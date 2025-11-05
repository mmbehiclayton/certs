<?php
session_start();
require_once '../config/db.php';

$message = "";
$error = "";

// If already logged in
if (isset($_SESSION['role']) && $_SESSION['role'] === 'Registrar') {
  header("Location: dashboard.php");
  exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = trim($_POST['email']);
  $password = trim($_POST['password']);

  if (empty($email) || empty($password)) {
    $error = "Please enter both email and password.";
  } else {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ? AND role = 'Registrar' LIMIT 1");
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
      $_SESSION['user_id'] = $user['user_id'];
      $_SESSION['name'] = $user['name'];
      $_SESSION['role'] = $user['role'];
      header("Location: dashboard.php");
      exit;
    } else {
      $error = "Invalid credentials or not authorized.";
    }
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registrar Login - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <style>
    body {
      background-color: #f4f6f8;
      font-family: 'Poppins', sans-serif;
    }
    .login-box {
      width: 400px;
      margin: 7% auto;
      background: white;
      padding: 35px;
      border-radius: 8px;
      box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    }
    h3 {
      text-align: center;
      color: #002147;
      margin-bottom: 25px;
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

<div class="login-box">
  <div class="text-center mb-3">
    <img src="../templates/logo_kisumu.jpeg" width="70" class="mb-2" alt="KNP Logo">
    <h3>The Kisumu National Polytechnic</h3>
    <p class="text-muted">Registrar Portal Login</p>
  </div>

  <?php if (!empty($error)): ?>
    <div class="alert alert-danger"><?= htmlspecialchars($error); ?></div>
  <?php endif; ?>

  <form method="POST">
    <div class="mb-3">
      <label>Email Address</label>
      <input type="email" name="email" class="form-control" required>
    </div>

    <div class="mb-3">
      <label>Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>

    <button type="submit" class="btn btn-primary w-100">Login</button>
  </form>

  <p class="text-center mt-3 text-muted small">
    &copy; <?= date('Y'); ?> The Kisumu National Polytechnic
  </p>
</div>

</body>
</html>
