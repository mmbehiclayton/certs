<?php
session_start();
require_once '../config/db.php';
require_once '../libs/tcpdf/tcpdf.php';
require_once '../libs/phpqrcode/qrlib.php';

if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Registrar') {
  header("Location: login.php");
  exit;
}

$message = "";
$error = "";

// ======================= GENERATE CERTIFICATE ===========================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['admission_no'])) {
  $adm = trim($_POST['admission_no']);

  $stmt = $pdo->prepare("SELECT * FROM students WHERE admission_no = ?");
  $stmt->execute([$adm]);
  $student = $stmt->fetch();

  if (!$student) {
    $error = "❌ Student not found!";
  } else {
    $cert_no = "KNP-" . date("Y") . "-" . strtoupper(bin2hex(random_bytes(3)));

    $baseDir = realpath(__DIR__ . '/../');
    $pdfDir = $baseDir . '/certificates/pdfs/';
    $qrDir  = $baseDir . '/certificates/qrcodes/';

    if (!is_dir($pdfDir)) mkdir($pdfDir, 0777, true);
    if (!is_dir($qrDir)) mkdir($qrDir, 0777, true);

    $pdfFile = $pdfDir . $cert_no . ".pdf";
    $qrFile  = $qrDir . $cert_no . ".png";

    $verify_url = (isset($_SERVER['HTTPS']) ? "https" : "http") .
      "://{$_SERVER['HTTP_HOST']}/knp_certificate_system/public/verify.php?cert=" . urlencode($cert_no);
    QRcode::png($verify_url, $qrFile, QR_ECLEVEL_H, 4);

    // === Image Paths ===
    $logo     = realpath($baseDir . '/templates/logo kisumu.png');
    $sign_reg = realpath($baseDir . '/templates/signature_registrar.png');
    $sign_pri = realpath($baseDir . '/templates/signature_principal.png');

    // === TCPDF Setup ===
    // === TCPDF Setup ===
$pdf = new TCPDF('P', 'mm', 'A4', true, 'UTF-8', false);
$pdf->SetCreator('Kisumu National Polytechnic');
$pdf->SetTitle('Certificate - ' . $student['name']);
$pdf->setPrintHeader(false);
$pdf->setPrintFooter(false);
$pdf->SetMargins(15, 15, 15);
$pdf->AddPage();

// === Faint Centered Watermark (NOT diagonal) ===
if ($logo && file_exists($logo)) {
  $pdf->SetAlpha(0.07); // faint watermark
  $pageWidth = $pdf->getPageWidth();
  $pageHeight = $pdf->getPageHeight();
  $pdf->Image($logo, ($pageWidth - 120) / 2, ($pageHeight - 120) / 2, 120, 120, '', '', '', false, 300);
  $pdf->SetAlpha(1);
}

// === Certificate Layout (Page 1) ===
$html = '
<div style="text-align:center; line-height:1.6;">

  <!-- Certificate Number at top-right -->
  <div style="text-align:right; font-size:12px; color:#555; margin-bottom:-5px;">
    Certificate No: <strong>' . htmlspecialchars($cert_no) . '</strong>
  </div>

  <!-- Logo and Title -->
  <div style="margin-top:-5px;">
    <img src="' . $logo . '" width="85"><br>
    <h1 style="font-size:25px; color:#002147; margin:2px 0;">THE KISUMU NATIONAL POLYTECHNIC</h1>
  </div>

  <hr style="width:60%; margin:10px auto; border:1px solid #002147;">

  <h3 style="margin-top:10px;">This is to certify that</h3>
  <h2 style="font-size:22px; color:#000;"><b>' . strtoupper(htmlspecialchars($student['name'])) . '</b></h2>
  <p>Admission No: <b>' . htmlspecialchars($student['admission_no']) . '</b></p>
  <p>Having satisfied all the requirements was awarded the</p>
  <h2 style="color:#002147;">CERTIFICATE IN ' . strtoupper(htmlspecialchars($student['course'])) . '</h2>
  <p><b>Grade: ' . strtoupper(htmlspecialchars($student['grade'])) . '</b></p>
  <p>At a congregation held at the Polytechnic on the 
    <b>Twenty Sixth Day of April</b> in the year 
    <b>' . htmlspecialchars($student['completion_year']) . '</b>.
  </p>

  <br><br><br>

  <!-- Signatures Section -->
  <table width="100%">
    <tr>
      <td align="center" width="50%">
        ' . (file_exists($sign_reg) ? '<img src="' . $sign_reg . '" width="110"><br>' : '') . '
        <div style="border-top:1px solid #000; width:150px; margin:5px auto 3px auto;"></div>
        <b>Registrar</b>
      </td>
      <td align="center" width="50%">
        ' . (file_exists($sign_pri) ? '<img src="' . $sign_pri . '" width="110"><br>' : '') . '
        <div style="border-top:1px solid #000; width:150px; margin:5px auto 3px auto;"></div>
        <b>Chief Principal / Council Secretary</b>
      </td>
    </tr>
  </table>

</div>';

// ✳ Write the certificate content
$pdf->writeHTML($html, false, false, false, false, '');

// === QR Code (bottom-left corner, not touching text) ===
if (file_exists($qrFile)) {
  $x = 18; // left position
  $y = $pdf->getPageHeight() - 50; // from bottom
  $pdf->Image($qrFile, $x, $y, 25, 25, 'PNG');
}

// === Page 2 (Key Page with spacing) ===
$pdf->AddPage();
$pdf->SetFont('helvetica', '', 11);
$pdf->writeHTMLCell(
  0, 0, '', '', '
  <h3 style="color:#002147; text-align:center;">Key on Competence/Proficiency Level</h3>
  <ol style="line-height:2.0;">
    <li><b>Mastery: 80–100%</b> — Mastery of technical and related knowledge and skills.</li>
    <li><b>Proficient: 65–79%</b> — Good working technical and related knowledge and skills.</li>
    <li><b>Competent: 50–64%</b> — Satisfactory technical and related knowledge and skills.</li>
    <li><b>Not Yet Competent: 0–49%</b> — Insufficient technical skills, related knowledge, and attitude.</li>
    <li><b>Y:</b> Assessment irregularities/malpractice.</li>
  </ol>', 0, 1, 0, true, '', false
);

// ✅ Save certificate without extra blank page
$pdf->Output($pdfFile, 'F');

    // === Save Record ===
    $stmt = $pdo->prepare("
      INSERT INTO certificates (cert_no, admission_no, cert_type, issue_date, pdf_path, qr_path, status)
      VALUES (?, ?, 'Course Completion', ?, ?, ?, 'Issued')
    ");
    $stmt->execute([
      $cert_no,
      $student['admission_no'],
      date('Y-m-d'),
      'certificates/pdfs/' . basename($pdfFile),
      'certificates/qrcodes/' . basename($qrFile)
    ]);

    $message = "✅ Certificate generated successfully for " . htmlspecialchars($student['name']) . ".";
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Generate Certificate - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>
<?php include '../includes/navbar.php'; ?>
<?php include '../includes/sidebar.php'; ?>

<div class="main-content">
  <div class="container-fluid">
    <h3 class="mb-4 text-knp">🎓 Generate Certificate</h3>
    <?php if ($message): ?><div class="alert alert-success"><?= $message; ?></div><?php endif; ?>
    <?php if ($error): ?><div class="alert alert-danger"><?= $error; ?></div><?php endif; ?>

    <div class="card border-0 shadow-sm mb-4">
      <div class="card-header bg-knp text-white">Select Student</div>
      <div class="card-body">
        <form method="POST" class="row g-3">
          <div class="col-md-8">
            <label class="form-label">Choose Student by Admission Number</label>
            <select name="admission_no" class="form-select" required>
              <option value="">-- Select Student --</option>
              <?php
              $students = $pdo->query("SELECT admission_no, name, course FROM students ORDER BY name ASC")->fetchAll();
              foreach ($students as $s):
                echo "<option value='{$s['admission_no']}'>{$s['admission_no']} - {$s['name']} ({$s['course']})</option>";
              endforeach;
              ?>
            </select>
          </div>
          <div class="col-md-4 d-flex align-items-end">
            <button class="btn btn-success w-100">Generate Certificate</button>
          </div>
        </form>
      </div>
    </div>

    <div class="card border-0 shadow-sm">
      <div class="card-header bg-light">Recently Generated Certificates</div>
      <div class="card-body table-responsive">
        <table class="table table-striped table-hover">
          <thead class="table-dark">
            <tr>
              <th>Certificate No</th>
              <th>Admission No</th>
              <th>Issue Date</th>
              <th>Type</th>
              <th>Status</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
          <?php
          $certs = $pdo->query("SELECT * FROM certificates ORDER BY created_at DESC LIMIT 10")->fetchAll();
          if ($certs):
            foreach ($certs as $c): ?>
              <tr>
                <td><?= htmlspecialchars($c['cert_no']); ?></td>
                <td><?= htmlspecialchars($c['admission_no']); ?></td>
                <td><?= htmlspecialchars($c['issue_date']); ?></td>
                <td><?= htmlspecialchars($c['cert_type']); ?></td>
                <td><span class="badge bg-success"><?= htmlspecialchars($c['status']); ?></span></td>
                <td><a href="../<?= htmlspecialchars($c['pdf_path']); ?>" target="_blank" class="btn btn-sm btn-primary">View PDF</a></td>
              </tr>
            <?php endforeach;
          else: ?>
            <tr><td colspan="6" class="text-center text-muted">No certificates generated yet.</td></tr>
          <?php endif; ?>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<?php include '../includes/footer.php'; ?>
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/main.js"></script>
</body>
</html>
