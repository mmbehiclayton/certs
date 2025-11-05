<?php
session_start();
require_once '../config/db.php';

// ================== HANDLE LOGIN ==================
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = trim($_POST['email']);
  $password = $_POST['password'];

  $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ? LIMIT 1");
  $stmt->execute([$email]);
  $user = $stmt->fetch();

  if ($user && password_verify($password, $user['password'])) {
    // Set session
    $_SESSION['user_id'] = $user['user_id'];
    $_SESSION['name'] = $user['name'];
    $_SESSION['role'] = $user['role'];

    // Redirect based on role
    switch ($user['role']) {
      case 'Admin':
        header("Location: ../admin/dashboard.php");
        break;
      case 'Registrar':
        header("Location: ../registrar/dashboard.php");
        break;
      case 'Principal':
        header("Location: ../principal/dashboard.php");
        break;
      default:
        // unknown role
        $error = "Your account role is not recognized.";
        session_destroy();
        break;
    }
    exit;
  } else {
    $error = "❌ Invalid email or password.";
  }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>KNP CMS Login</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <style>
    body {
      background: #f5f7fa;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-box {
      background: #fff;
      padding: 35px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      width: 380px;
    }
    h2 {
      text-align: center;
      color: #0d6efd;
      font-weight: bold;
    }
  </style>
</head>
<body>

<div class="login-box">
  <h2 class="mb-3">KNP Certificate System</h2>

  <?php if (!empty($error)): ?>
    <div class="alert alert-danger py-2 text-center"><?= htmlspecialchars($error); ?></div>
  <?php endif; ?>

  <form method="POST">
    <div class="mb-3">
      <label class="form-label">Email</label>
      <input type="email" name="email" class="form-control" placeholder="Enter email address" required>
    </div>

    <div class="mb-3">
      <label class="form-label">Password</label>
      <input type="password" name="password" class="form-control" placeholder="Enter password" required>
    </div>

    <button type="submit" class="btn btn-primary w-100">🔐 Login</button>
  </form>

  <p class="mt-4 small text-center text-muted">
    &copy; <?= date('Y'); ?> The Kisumu National Polytechnic<br>
    <span class="text-secondary">Certificate Management System</span>
  </p>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
</body>
</html>
