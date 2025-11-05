<?php 
require_once '../config/db.php';

$cert = $_GET['cert'] ?? '';
$certificate = null;
$error = '';

if (!empty($cert)) {
  $stmt = $pdo->prepare("
    SELECT c.*, s.name, s.course, s.grade, s.completion_year
    FROM certificates c
    JOIN students s ON c.admission_no = s.admission_no
    WHERE c.cert_no = ?
  ");
  $stmt->execute([$cert]);
  $certificate = $stmt->fetch();

  if (!$certificate) {
    $error = "❌ Certificate not found or invalid certificate number.";
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Certificate Verification - The Kisumu National Polytechnic</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <style>
    body {
      background: #f5f7fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .verify-box {
      max-width: 720px;
      margin: 70px auto;
      background: white;
      border-radius: 12px;
      box-shadow: 0 0 18px rgba(0,0,0,0.1);
      padding: 45px;
      text-align: center;
    }
    .verify-box img {
      width: 110px;
      margin-bottom: 12px;
    }
    h1 {
      color: #002147;
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 5px;
    }
    h2 {
      color: #e36c0a;
      font-size: 26px;
      margin: 15px 0 5px;
    }
    table {
      width: 100%;
      margin-top: 25px;
      font-size: 15px;
    }
    th {
      width: 40%;
      text-align: right;
      color: #002147;
      padding-right: 10px;
    }
    td {
      text-align: left;
    }
    .btn-knp {
      background-color: #002147;
      color: white;
    }
    .btn-knp:hover {
      background-color: #e36c0a;
      color: white;
    }
  </style>
</head>
<body>

<div class="verify-box">
  <img src="../templates/logo kisumu.png" alt="KNP Logo">
  <h1>THE KISUMU NATIONAL POLYTECHNIC</h1>
  <h5 class="text-muted mb-4">Certificate Verification Portal</h5>

  <form method="GET" class="mb-4">
    <div class="input-group">
      <input 
        type="text" 
        name="cert" 
        class="form-control" 
        placeholder="Enter Certificate Number (e.g. 20250001)" 
        value="<?= htmlspecialchars($cert) ?>" 
        required
      >
      <button class="btn btn-knp">Verify</button>
    </div>
  </form>

  <?php if ($error): ?>
    <div class="alert alert-danger mt-3"><?= $error; ?></div>

  <?php elseif ($certificate): ?>
    <div class="alert alert-success">✅ Certificate Verified Successfully</div>

    <h2><?= strtoupper(htmlspecialchars($certificate['name'])); ?></h2>

    <table class="table table-borderless mt-3">
      <tr><th>Certificate No.:</th><td><b><?= htmlspecialchars($certificate['cert_no']); ?></b></td></tr>
      <tr><th>Institution:</th><td>The Kisumu National Polytechnic</td></tr>
      <tr><th>Course:</th><td><?= htmlspecialchars($certificate['course']); ?></td></tr>
      <tr><th>Final Grade:</th><td><?= htmlspecialchars($certificate['grade']); ?></td></tr>
      <tr><th>Month:</th><td>April</td></tr>
      <tr><th>Year:</th><td><?= htmlspecialchars($certificate['completion_year']); ?></td></tr>
    </table>

    <div class="mt-4">
      <a href="../<?= htmlspecialchars($certificate['pdf_path']); ?>" target="_blank" class="btn btn-knp">
        📄 View Original Certificate
      </a>
    </div>

  <?php else: ?>
    <div class="alert alert-info">Enter a certificate number above or scan the QR code printed on your certificate.</div>
  <?php endif; ?>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
