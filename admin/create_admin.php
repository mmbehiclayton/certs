<?php
require_once '../config/db.php';

$message = "";
$error = "";

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $name = trim($_POST['name']);
  $email = trim($_POST['email']);
  $password = trim($_POST['password']);
  $confirm = trim($_POST['confirm']);

  if (empty($name) || empty($email) || empty($password)) {
    $error = "⚠️ All fields are required.";
  } elseif ($password !== $confirm) {
    $error = "❌ Passwords do not match.";
  } else {
    // Check if email already exists
    $check = $pdo->prepare("SELECT COUNT(*) FROM users WHERE email = ?");
    $check->execute([$email]);
    if ($check->fetchColumn() > 0) {
      $error = "That email is already registered.";
    } else {
      $hash = password_hash($password, PASSWORD_DEFAULT);
      $stmt = $pdo->prepare("INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, 'Admin')");
      $stmt->execute([$name, $email, $hash]);
      $message = "✅ Admin account created successfully. You can now log in.";
    }
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Create Admin (Direct) - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <style>
    body {
      background-color: #f8f9fa;
      font-family: 'Poppins', sans-serif;
    }
    .create-box {
      width: 450px;
      margin: 6% auto;
      background: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }
    h3 {
      color: #002147;
      text-align: center;
      margin-bottom: 20px;
    }
    .btn-primary {
      background-color: #002147;
      border-color: #002147;
    }
    .btn-primary:hover {
      background-color: #E1A500;
      border-color: #E1A500;
      color: #002147;
    }
  </style>
</head>
<body>

<div class="create-box">
  <h3>Create Admin Account</h3>

  <?php if (!empty($message)): ?>
    <div class="alert alert-success"><?= htmlspecialchars($message); ?></div>
  <?php endif; ?>

  <?php if (!empty($error)): ?>
    <div class="alert alert-danger"><?= htmlspecialchars($error); ?></div>
  <?php endif; ?>

  <form method="POST">
    <div class="mb-3">
      <label>Full Name</label>
      <input type="text" name="name" class="form-control" required>
    </div>

    <div class="mb-3">
      <label>Email Address</label>
      <input type="email" name="email" class="form-control" required>
    </div>

    <div class="mb-3">
      <label>Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>

    <div class="mb-3">
      <label>Confirm Password</label>
      <input type="password" name="confirm" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-primary w-100">Create Admin</button>
  </form>

  <p class="text-center text-muted mt-3 small">
    &copy; <?= date('Y'); ?> The Kisumu National Polytechnic
  </p>
</div>

</body>
</html>
