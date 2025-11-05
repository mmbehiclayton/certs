<?php
session_start();
require_once '../config/db.php';
require_once '../libs/tcpdf/tcpdf.php';
require_once '../libs/phpqrcode/qrlib.php';

if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Registrar') {
  header("Location: login.php");
  exit;
}

// ========== Handle Direct Generation from Manage Students ==========
if (isset($_GET['adm'])) {
  $_POST['admission_no'] = $_GET['adm'];
  $_SERVER['REQUEST_METHOD'] = 'POST';
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['admission_no'])) {
  $adm = trim($_POST['admission_no']);

  $stmt = $pdo->prepare("SELECT * FROM students WHERE admission_no = ?");
  $stmt->execute([$adm]);
  $student = $stmt->fetch();

  if (!$student) {
    header("Location: upload_students.php?msg=" . urlencode("❌ Student not found!"));
    exit;
  }

  // prevent duplicate certificate for same student
  $checkCert = $pdo->prepare("SELECT cert_no FROM certificates WHERE admission_no = ?");
  $checkCert->execute([$adm]);
  $existingCert = $checkCert->fetchColumn();

  if ($existingCert) {
    header("Location: upload_students.php?msg=" . urlencode("⚠️ Certificate already exists for {$student['name']} (No. {$existingCert})"));
    exit;
  }

  // sequential certificate number
  $currentYear = date('Y');
  $stmt = $pdo->prepare("SELECT cert_no FROM certificates WHERE cert_no LIKE ? ORDER BY cert_no DESC LIMIT 1");
  $stmt->execute(["$currentYear%"]);
  $lastCert = $stmt->fetchColumn();
  if ($lastCert) {
    $lastNumber = (int)substr($lastCert, -4);
    $nextNumber = $lastNumber + 1;
  } else {
    $nextNumber = 1;
  }
  $cert_no = $currentYear . str_pad($nextNumber, 4, '0', STR_PAD_LEFT);

  $qualification_code = $student['qualification_code'] ?? 'N/A';
  $qualification_type = $student['qualification_type'] ?? 'CERTIFICATE';

  $baseDir = realpath(__DIR__ . '/../');
  $pdfDir = $baseDir . '/certificates/pdfs/';
  $qrDir  = $baseDir . '/certificates/qrcodes/';
  if (!is_dir($pdfDir)) mkdir($pdfDir, 0777, true);
  if (!is_dir($qrDir)) mkdir($qrDir, 0777, true);

  $pdfFile = $pdfDir . $cert_no . ".pdf";
  $qrFile  = $qrDir . $cert_no . ".png";

  // generate QR
  $verify_url = (isset($_SERVER['HTTPS']) ? "https" : "http") .
    "://{$_SERVER['HTTP_HOST']}/knp_certificate_system/public/verify.php?cert=" . urlencode($cert_no);
  QRcode::png($verify_url, $qrFile, QR_ECLEVEL_H, 4);

  // assets
  $logo        = realpath($baseDir . '/templates/logo kisumu.png');
  $sign_reg    = realpath($baseDir . '/templates/signature_registrar.png');
  $sign_pri    = realpath($baseDir . '/templates/signature_principal.png');
  $background  = realpath($baseDir . '/templates/Certificate5.png');

  // === Custom TCPDF class Full Background + faint watermark ===
  class MultiBackgroundPDF extends TCPDF {
    public $backgroundImg = null;
    public $watermarkImg = null;

    public function Header() {
      if ($this->getPage() === 1) {
        if ($this->backgroundImg && file_exists($this->backgroundImg)) {
          $this->SetAutoPageBreak(false, 0);
          $pageW = $this->getPageWidth();
          $pageH = $this->getPageHeight();
          $x = -5;
          $y = -7;
          $w = $pageW + 10;
          $h = $pageH + 14;
          $this->Image($this->backgroundImg, $x, $y, $w, $h, '', '', '', false, 300, '', false, false, 0);
          $this->SetAutoPageBreak(true, 12);
        }
        if ($this->watermarkImg && file_exists($this->watermarkImg)) {
          $this->SetAlpha(0.06);
          $logoW = 90;
          $logoH = 90;
          $this->Image(
            $this->watermarkImg,
            ($this->getPageWidth() - $logoW) / 2,
            ($this->getPageHeight() - $logoH) / 2,
            $logoW, $logoH, '', '', '', false, 300, '', false, false, 0
          );
          $this->SetAlpha(1);
        }
      }
    }
    public function Footer() {}
  }

  // === Setup PDF ===
  $pdf = new MultiBackgroundPDF('P', 'mm', 'A4', true, 'UTF-8', false);
  $pdf->backgroundImg = $background;
  $pdf->watermarkImg  = $logo;
  $pdf->SetCreator('Kisumu National Polytechnic');
  $pdf->SetTitle('Certificate - ' . $student['name']);
  $pdf->SetMargins(12, 12, 12);
  $pdf->SetAutoPageBreak(true, 12);
  $pdf->setPrintHeader(true);
  $pdf->setPrintFooter(false);
  $pdf->AddPage();

  // add Mokgech font if available
  if (file_exists(__DIR__ . '/../libs/tcpdf/fonts/mokgech.php')) {
    $pdf->AddFont('mokgech', '', 'mokgech.php');
    $pdf->SetFont('mokgech', '', 16);
  }

  // content variables
  $student_name_safe = mb_strtoupper(htmlspecialchars($student['name']), "UTF-8");
  $qualification_type_safe = strtoupper(htmlspecialchars($qualification_type));
  $course_safe = strtoupper(htmlspecialchars($student['course']));
  $grade_safe = strtoupper(htmlspecialchars($student['grade']));
  $qual_code_safe = htmlspecialchars($qualification_code);

  // HTML content
  $html = '
  <div style="text-align:center; font-family:Times New Roman, serif; line-height:1.18;">
    <div style="text-align:right; font-size:10px; color:#555;">
      Certificate No: <strong>' . htmlspecialchars($cert_no) . '</strong>
    </div>

    <div style="margin-top:-6px; text-align:center;">
      <img src="' . $logo . '" width="115" style="margin-bottom:4px;">
      <h1 style="font-size:21px; color:#002147; font-weight:bold; margin:2px 0 0 0;">
        THE KISUMU NATIONAL POLYTECHNIC
      </h1>

      <h4 style="margin-top:6px; font-size:15px; font-weight:bold;">This is to certify that</h4><br>

      <h2 style="font-size:27px; color:#e36c0a; font-family:\'mokgech\', DejaVu Sans, sans-serif;">
        <b>' . $student_name_safe . '</b>
      </h2>

      <p style="font-size:16px; font-weight:bold; font-style:italic; margin-top:10px;">
        having satisfied all the requirements was awarded the
      </p>

      <h3 style="color:#e36c0a; font-size:18px; margin:8px 0;">
        <b>' . $qualification_type_safe . ' IN ' . $course_safe . '</b>
      </h3>

      <p style="color:#e36c0a; font-size:15px; margin:4px 0;">
        <b>Grade: ' . $grade_safe . '</b>
      </p>
      <p style="font-size:13px; margin:2px 0;">
        <b>Qualification Code:</b> ' . $qual_code_safe . '
      </p>

      <p style="font-size:17px; font-style:italic; font-weight:bold; margin-top:12px; line-height:1.4;">
        At a congregation held at the Polytechnic on the <br>
        Twenty Sixth Day of April in the Year <br>
        Two Thousand and Twenty-Five
      </p>

      <div style="height:60px;"></div>

      <table width="100%" cellpadding="0" cellspacing="0" style="margin-top:70px;">
        <tr>
          <td align="center" width="33%" style="vertical-align:bottom;">
            <div style="border-bottom:2px solid #000; width:160px; margin:0 auto; height:40px; margin-bottom:5px;"></div>
            <b style="font-size:11px;">Registrar</b>
          </td>
          <td align="center" width="34%" style="vertical-align:bottom;">
            ' . (file_exists($qrFile) ? '<img src="' . $qrFile . '" width="90" height="90" style="margin-top:18px;"><br>' : '') . '
            <span style="font-size:9.5px; color:#333;">Scan to verify</span>
          </td>
          <td align="center" width="33%" style="vertical-align:bottom;">
            <div style="border-bottom:2px solid #000; width:180px; margin:0 auto; height:40px; margin-bottom:5px;"></div>
            <b style="font-size:11px;">Chief Principal / Council Secretary</b>
          </td>
        </tr>
      </table>
    </div>
  </div>';

  $pdf->writeHTML($html, true, false, true, false, '');

  // === Page 2 (Key) ===
  $pdf->setPrintHeader(false);
  $pdf->AddPage();
  $pdf->SetFont('helvetica', '', 10);
  $pdf->writeHTMLCell(0, 0, '', '', '
    <h3 style="color:#002147; text-align:center;">Key on Competence/Proficiency Level</h3>
    <ol style="line-height:1.8; font-size:11px;">
      <li><b>Mastery (80–100%)</b> Excellent mastery of technical and related knowledge and skills.</li>
      <li><b>Proficient (65–79%)</b> Good technical and related knowledge and skills.</li>
      <li><b>Competent (50–64%)</b> Satisfactory technical and related knowledge and skills.</li>
      <li><b>Not Yet Competent (0–49%)</b> Insufficient technical knowledge and attitude.</li>
      <li><b>Y:</b> Assessment irregularities/malpractice.</li>
    </ol>', 0, 1, 0, true, '', false);

  // === Save PDF file ===
  $pdf->Output($pdfFile, 'F');

  // save to db
  $stmt = $pdo->prepare("
    INSERT INTO certificates (cert_no, admission_no, cert_type, qualification_code, issue_date, pdf_path, qr_path, status)
    VALUES (?, ?, 'Course Completion', ?, ?, ?, ?, 'Issued')
  ");
  $stmt->execute([
    $cert_no,
    $student['admission_no'],
    $qualification_code,
    date('Y-m-d'),
    'certificates/pdfs/' . basename($pdfFile),
    'certificates/qrcodes/' . basename($qrFile)
  ]);

  header("Location: upload_students.php?msg=" . urlencode("✅ Certificate generated successfully for {$student['name']} (No. $cert_no)"));
  exit;
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
              <th>Qualification Code</th>
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
                <td><?= htmlspecialchars($c['qualification_code']); ?></td>
                <td><?= htmlspecialchars($c['issue_date']); ?></td>
                <td><?= htmlspecialchars($c['cert_type']); ?></td>
                <td><span class="badge bg-success"><?= htmlspecialchars($c['status']); ?></span></td>
                <td><a href="../<?= htmlspecialchars($c['pdf_path']); ?>" target="_blank" class="btn btn-sm btn-primary">View PDF</a></td>
              </tr>
            <?php endforeach;
          else: ?>
            <tr><td colspan="7" class="text-center text-muted">No certificates generated yet.</td></tr>
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
