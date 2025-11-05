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
$zipPath = "";
$combinedRelative = "";

try {
  // === Step 1: Identify the latest upload batch ===
  $stmtBatch = $pdo->query("SELECT batch_id FROM import_logs ORDER BY import_time DESC LIMIT 1");
  $latestBatchId = $stmtBatch->fetchColumn();

  if (!$latestBatchId) {
    throw new Exception("No batch found. Please upload students first.");
  }

  // === Step 2: Select only students from that batch without certificates ===
  $stmt = $pdo->prepare("
    SELECT s.*
    FROM students s
    LEFT JOIN certificates c ON s.admission_no = c.admission_no
    WHERE c.admission_no IS NULL AND s.batch_id = ?
    ORDER BY s.created_at ASC
  ");
  $stmt->execute([$latestBatchId]);
  $students = $stmt->fetchAll();

  if (!$students) {
    $message = "✅ No new students in the latest batch need certificates.";
  } else {
    $count = 0;
    $baseDir = realpath(__DIR__ . '/../');
    $pdfDir = $baseDir . '/certificates/pdfs/';
    $qrDir  = $baseDir . '/certificates/qrcodes/';
    $background = realpath($baseDir . '/templates/Certificate5.png');
    $logo = realpath($baseDir . '/templates/logo kisumu.png');

    if (!is_dir($pdfDir)) mkdir($pdfDir, 0777, true);
    if (!is_dir($qrDir)) mkdir($qrDir, 0777, true);

    // === Step 3: Custom TCPDF class ===
    if (!class_exists('MultiBackgroundPDF')) {
      class MultiBackgroundPDF extends TCPDF {
        public $backgroundImg = null;
        public $watermarkImg = null;
        public $applyBackground = true;

        public function Header() {
          if ($this->applyBackground && $this->backgroundImg && file_exists($this->backgroundImg)) {
            $this->SetAutoPageBreak(false, 0);
            $this->Image($this->backgroundImg, -5, -7, $this->getPageWidth() + 10, $this->getPageHeight() + 14, '', '', '', false, 300);
            $this->SetAutoPageBreak(true, 12);
          }
          if ($this->applyBackground && $this->watermarkImg && file_exists($this->watermarkImg)) {
            $this->SetAlpha(0.06);
            $this->Image($this->watermarkImg, ($this->getPageWidth() - 90) / 2, ($this->getPageHeight() - 90) / 2, 90, 90, '', '', '', false, 300);
            $this->SetAlpha(1);
          }
        }
        public function Footer() {}
      }
    }

    // === Step 4: Prepare batch PDF ===
    $batchTime = date('Ymd_His');
    $combinedFile = $pdfDir . "Batch_Certificates_{$batchTime}.pdf";

    $combinedPdf = new MultiBackgroundPDF('P', 'mm', 'A4', true, 'UTF-8', false);
    $combinedPdf->SetCreator('Kisumu National Polytechnic');
    $combinedPdf->SetTitle('Batch Certificates ' . $batchTime);
    $combinedPdf->SetMargins(12, 12, 12);
    $combinedPdf->SetAutoPageBreak(true, 12);
    $combinedPdf->setPrintHeader(true);
    $combinedPdf->setPrintFooter(false);

    if (file_exists(__DIR__ . '/../libs/tcpdf/fonts/mokgech.php')) {
      $combinedPdf->AddFont('mokgech', '', 'mokgech.php');
    }

    // === Step 5: Get next certificate number ===
    $currentYear = date('Y');
    $stmtMax = $pdo->prepare("SELECT MAX(CAST(SUBSTRING(cert_no, 5) AS UNSIGNED)) FROM certificates WHERE cert_no LIKE ?");
    $stmtMax->execute(["{$currentYear}%"]);
    $maxNum = (int)$stmtMax->fetchColumn();
    $nextNumber = $maxNum + 1;

    foreach ($students as $student) {
      $cert_no = $currentYear . str_pad($nextNumber++, 4, '0', STR_PAD_LEFT);

      $adm = $student['admission_no'];
      $qualification_code = $student['qualification_code'] ?? 'N/A';
      $qualification_type = $student['qualification_type'] ?? 'CERTIFICATE';

      // === Step 6: QR code ===
      $qrFile  = $qrDir . $cert_no . ".png";
      $verify_url = (isset($_SERVER['HTTPS']) ? "https" : "http") .
        "://{$_SERVER['HTTP_HOST']}/knp_certificate_system/public/verify.php?cert=" . urlencode($cert_no);
      QRcode::png($verify_url, $qrFile, QR_ECLEVEL_H, 4);

      // === PAGE 1 (with background) ===
      $combinedPdf->applyBackground = true;
      $combinedPdf->backgroundImg = $background;
      $combinedPdf->watermarkImg  = $logo;
      $combinedPdf->AddPage();

      $fontUsed = file_exists(__DIR__ . '/../libs/tcpdf/fonts/mokgech.php') ? 'mokgech' : 'times';
      $combinedPdf->SetFont($fontUsed, '', 16);

      $student_name_safe = mb_strtoupper(htmlspecialchars($student['name']), "UTF-8");
      $qualification_type_safe = strtoupper(htmlspecialchars($qualification_type));
      $course_safe = strtoupper(htmlspecialchars($student['course']));
      $grade_safe = strtoupper(htmlspecialchars($student['grade']));
      $qual_code_safe = htmlspecialchars($qualification_code);

      $html = '
      <div style="text-align:center; font-family:Times New Roman, serif; line-height:1.18;">
        <div style="text-align:right; font-size:10px; color:#555;">
          Certificate No: <strong>' . htmlspecialchars($cert_no) . '</strong>
        </div>
        <div style="margin-top:-6px; text-align:center;">
          <img src="' . $logo . '" width="115" style="margin-bottom:4px;">
          <h1 style="font-size:21px; color:#002147; font-weight:bold;">THE KISUMU NATIONAL POLYTECHNIC</h1>
          <h4 style="margin-top:6px; font-size:15px; font-weight:bold;">This is to certify that</h4><br>
          <h2 style="font-size:27px; color:#e36c0a;">
            <b>' . $student_name_safe . '</b>
          </h2>
          <p style="font-size:16px; font-weight:bold; font-style:italic; margin-top:10px;">
            having satisfied all the requirements was awarded the
          </p>
          <h3 style="color:#e36c0a; font-size:18px; margin:8px 0;">
            <b>' . $qualification_type_safe . ' IN ' . $course_safe . '</b>
          </h3>
          <p style="color:#e36c0a; font-size:15px;"><b>Grade: ' . $grade_safe . '</b></p>
          <p style="font-size:13px;"><b>Qualification Code:</b> ' . $qual_code_safe . '</p>
          <p style="font-size:17px; font-style:italic; font-weight:bold; margin-top:12px;">
            At a congregation held at the Polytechnic on the <br>
            Twenty Sixth Day of April in the Year <br> Two Thousand and Twenty-Five
          </p>
          <div style="height:60px;"></div>
          <table width="100%" cellpadding="0" cellspacing="0" style="margin-top:70px;">
            <tr>
              <td align="center" width="33%">
                <div style="border-bottom:2px solid #000; width:160px; margin:0 auto; height:40px; margin-bottom:5px;"></div>
                <b style="font-size:11px;">Registrar</b>
              </td>
              <td align="center" width="34%">
                ' . (file_exists($qrFile) ? '<img src="' . $qrFile . '" width="90" height="90"><br>' : '') . '
                <span style="font-size:9.5px;">Scan to verify</span>
              </td>
              <td align="center" width="33%">
                <div style="border-bottom:2px solid #000; width:180px; margin:0 auto; height:40px; margin-bottom:5px;"></div>
                <b style="font-size:11px;">Chief Principal / Council Secretary</b>
              </td>
            </tr>
          </table>
        </div>
      </div>';
      $combinedPdf->writeHTML($html, true, false, true, false, '');

      // === PAGE 2 (plain, no background) ===
      $combinedPdf->applyBackground = false;
      $combinedPdf->AddPage();
      $combinedPdf->SetFont('helvetica', '', 10);
      $combinedPdf->writeHTMLCell(0, 0, '', '', '
        <h3 style="color:#002147; text-align:center;">Key on Competence/Proficiency Level</h3>
        <ol style="line-height:1.8; font-size:11px;">
          <li><b>Mastery (80–100%)</b> Excellent mastery of technical and related knowledge and skills.</li>
          <li><b>Proficient (65–79%)</b> Good technical and related knowledge and skills.</li>
          <li><b>Competent (50–64%)</b> Satisfactory technical and related knowledge and skills.</li>
          <li><b>Not Yet Competent (0–49%)</b> Insufficient technical knowledge and attitude.</li>
          <li><b>Y:</b> Assessment irregularities/malpractice.</li>
        </ol>', 0, 1, 0, true, '', false);

      // Save certificate record
      $stmt3 = $pdo->prepare("
        INSERT INTO certificates (cert_no, admission_no, cert_type, qualification_code, issue_date, pdf_path, qr_path, status)
        VALUES (?, ?, 'Course Completion', ?, ?, ?, ?, 'Issued')
      ");
      $stmt3->execute([
        $cert_no,
        $adm,
        $qualification_code,
        date('Y-m-d'),
        'certificates/pdfs/' . basename($combinedFile),
        'certificates/qrcodes/' . basename($qrFile)
      ]);

      $count++;
    }

    // === Step 7: Save batch PDF and ZIP ===
    $combinedPdf->Output($combinedFile, 'F');
    $combinedRelative = '../certificates/pdfs/' . basename($combinedFile);

    $zipPath = $pdfDir . "Batch_{$batchTime}.zip";
    $zip = new ZipArchive();
    if ($zip->open($zipPath, ZipArchive::CREATE) === TRUE) {
      $zip->addFile($combinedFile, basename($combinedFile));
      $zip->close();
    }

    // === Step 8: Record batch report for analytics ===
    $generated_by = $_SESSION['name'] ?? 'Registrar';
    $stmtLog = $pdo->prepare("
      INSERT INTO batch_reports (batch_id, total_certificates, generated_by, generated_at)
      VALUES (?, ?, ?, NOW())
      ON DUPLICATE KEY UPDATE 
        total_certificates = VALUES(total_certificates),
        generated_by = VALUES(generated_by),
        generated_at = VALUES(generated_at)
    ");
    $stmtLog->execute([$latestBatchId, $count, $generated_by]);

    $message = "✅ {$count} certificates generated successfully for this batch!";
  }
} catch (Exception $e) {
  $error = "❌ Error: " . $e->getMessage();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Batch Certificate Generation</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
</head>
<body class="p-4">
<div class="container">
  <h3>⚡ Batch Certificate Generation</h3>
  <?php if ($message): ?><div class="alert alert-success mt-3"><?= $message; ?></div><?php endif; ?>
  <?php if ($error): ?><div class="alert alert-danger mt-3"><?= $error; ?></div><?php endif; ?>

  <?php if (!empty($combinedRelative)): ?>
    <div class="mt-4">
      <a href="<?= $combinedRelative; ?>" class="btn btn-warning" target="_blank">🖨️ Print This Batch (PDF)</a>
    </div>
  <?php endif; ?>

  <?php if (!empty($zipPath) && file_exists($zipPath)): ?>
    <div class="mt-3">
      <a href="../certificates/pdfs/<?= basename($zipPath); ?>" class="btn btn-success">⬇ Download ZIP (This Batch)</a>
    </div>
  <?php endif; ?>

  <a href="dashboard.php" class="btn btn-primary mt-4">⬅ Back to Dashboard</a>
</div>
</body>
</html>
