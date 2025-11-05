<?php
session_start();
require_once '../config/db.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $email = trim($_POST['email']);
  $password = $_POST['password'];

  $stmt = $pdo->prepare("SELECT * FROM users WHERE email = ? LIMIT 1");
  $stmt->execute([$email]);
  $user = $stmt->fetch();

  if ($user && password_verify($password, $user['password'])) {
    $_SESSION['user_id'] = $user['user_id'];
    $_SESSION['name'] = $user['name'];
    $_SESSION['role'] = $user['role'];

    // Redirect by role
    if ($user['role'] === 'Admin') header("Location: dashboard.php");
    else header("Location: ../registrar/dashboard.php");
    exit;
  } else {
    $error = "Invalid email or password.";
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
</head>
<body>

<div class="login-box">
  <h2 class="mb-3">KNP Certificate System</h2>
  <?php if (!empty($error)): ?>
    <div class="alert alert-danger py-1"><?= htmlspecialchars($error); ?></div>
  <?php endif; ?>

  <form method="POST">
    <div class="mb-3">
      <label>Email</label>
      <input type="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
      <label>Password</label>
      <input type="password" name="password" class="form-control" required>
    </div>
    <button type="submit" class="btn btn-primary w-100">Login</button>
  </form>
  <p class="mt-3 small text-center text-muted">&copy; <?= date('Y'); ?> The Kisumu National Polytechnic</p>
</div>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/main.js"></script>
</body>
</html>
