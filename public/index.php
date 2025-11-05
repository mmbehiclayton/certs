<?php
require_once '../config/db.php';

$result = null;
$error = null;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $cert_no = trim($_POST['cert_no']);

  if (!empty($cert_no)) {
    $stmt = $pdo->prepare("
      SELECT s.name, s.course, s.grade, s.completion_year, c.cert_no, c.issue_date
      FROM certificates c
      JOIN students s ON c.admission_no = s.admission_no
      WHERE c.cert_no = ?
    ");
    $stmt->execute([$cert_no]);
    $result = $stmt->fetch();

    if (!$result) {
      $error = "❌ No certificate found with number <b>" . htmlspecialchars($cert_no) . "</b>.";
    }
  } else {
    $error = "⚠️ Please enter a certificate number.";
  }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>KNP Certificate Verification</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <style>
    body {
      background: linear-gradient(to bottom right, #f9fafc, #e8eef5);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      text-align: center;
      color: #002147;
    }
    .container {
      max-width: 800px;
      margin: 70px auto;
      background: white;
      padding: 45px;
      border-radius: 12px;
      box-shadow: 0 0 18px rgba(0,0,0,0.1);
    }
    img {
      width: 110px;
      margin-bottom: 10px;
    }
    h1 {
      font-size: 26px;
      font-weight: bold;
      color: #002147;
    }
    h2 {
      color: #e36c0a;
      font-size: 20px;
      margin-bottom: 25px;
    }
    .btn-knp {
      background-color: #002147;
      color: #fff;
      padding: 10px 25px;
      border-radius: 6px;
      font-size: 16px;
      border: none;
      text-decoration: none;
    }
    .btn-knp:hover {
      background-color: #e36c0a;
      color: #fff;
    }
    .result-card {
      margin-top: 30px;
      text-align: left;
      border: 1px solid #ddd;
      padding: 25px;
      border-radius: 8px;
      background: #f8f9fa;
    }
    .result-card h4 {
      color: #002147;
      font-weight: bold;
      margin-bottom: 12px;
    }
    .result-card p {
      font-size: 14px;
      margin: 3px 0;
    }
    footer {
      margin-top: 40px;
      font-size: 13px;
      color: #777;
    }
  </style>
</head>
<body>

<div class="container">
  <img src="../templates/logo kisumu.png" alt="KNP Logo">
  <h1>THE KISUMU NATIONAL POLYTECHNIC</h1>
  <h2>Certificate Verification Portal</h2>

  <p class="mb-4">Enter the certificate number below to verify authenticity.</p>

  <form method="POST" class="d-flex justify-content-center mb-4">
    <input 
      type="text" 
      name="cert_no" 
      class="form-control w-50 me-2" 
      placeholder="Enter Certificate Number (e.g., 20250001)" 
      required
    >
    <button type="submit" class="btn-knp">Verify</button>
  </form>

  <?php if ($error): ?>
    <div class="alert alert-danger"><?= $error; ?></div>
  <?php endif; ?>

  <?php if ($result): ?>
    <div class="result-card">
      <h4>✅ Certificate Verified Successfully</h4>
      <p><strong>Certificate No:</strong> <?= htmlspecialchars($result['cert_no']); ?></p>
      <p><strong>Student Name:</strong> <?= htmlspecialchars($result['name']); ?></p>
      <p><strong>Course:</strong> <?= htmlspecialchars($result['course']); ?></p>
      <p><strong>Final Grade:</strong> <?= htmlspecialchars($result['grade']); ?></p>
      <p><strong>Year of Completion:</strong> <?= htmlspecialchars($result['completion_year']); ?></p>
      <p><strong>Issued On:</strong> <?= htmlspecialchars($result['issue_date']); ?></p>
      <hr>
      <p class="text-muted text-center mb-0">
        This certificate is verified as authentic by 
        <strong>The Kisumu National Polytechnic</strong>.
      </p>
    </div>
  <?php endif; ?>
</div>

<footer>
  &copy; <?= date('Y'); ?> The Kisumu National Polytechnic. All Rights Reserved.
</footer>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
