<?php
session_start();
require_once '../config/db.php';

// 🔹 If user already logged in, go straight to dashboard
if (isset($_SESSION['role']) && $_SESSION['role'] === 'Principal') {
  header("Location: dashboard.php");
  exit;
}

// 🔹 If user is logged in but not principal, destroy old session to avoid loops
if (isset($_SESSION['role']) && $_SESSION['role'] !== 'Principal') {
  session_unset();
  session_destroy();
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = trim($_POST['email']);
  $password = $_POST['password'];

  if ($email && $password) {
    $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ? AND role = 'Principal' LIMIT 1");
    $stmt->execute([$email]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
      // ✅ Correct login
      session_regenerate_id(true);
      $_SESSION['user_id'] = $user['user_id'];
      $_SESSION['name'] = $user['name'];
      $_SESSION['email'] = $user['email'];
      $_SESSION['role'] = $user['role'];

      header("Location: dashboard.php");
      exit;
    } else {
      $error = "❌ Invalid email or password.";
    }
  } else {
    $error = "⚠️ Please enter both email and password.";
  }
}
?>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Chief Principal Login - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <style>
    body {
      background: #f4f7fa;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    .login-box {
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
      width: 380px;
    }
    h3 {
      color: #0d6efd;
      text-align: center;
      font-weight: bold;
    }
  </style>
</head>
<body>
<div class="login-box">
  <h3>Chief Principal Login</h3>
  <?php if ($error): ?>
    <div class="alert alert-danger py-2 mt-3 text-center"><?= htmlspecialchars($error) ?></div>
  <?php endif; ?>

  <form method="post" class="mt-3">
    <div class="mb-3">
      <label>Email Address</label>
      <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
    </div>

    <div class="mb-3">
      <label>Password</label>
      <input type="password" name="password" class="form-control" placeholder="Enter your password" required>
    </div>

    <button class="btn btn-primary w-100">Login</button>
    <a href="../index.php" class="btn btn-link d-block text-center mt-2">← Back to Home</a>
  </form>
</div>
</body>
</html>
