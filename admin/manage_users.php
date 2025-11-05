<?php
session_start();
require_once '../config/db.php';

// ================= ACCESS CONTROL ===================
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Admin') {
  header("Location: login.php");
  exit;
}

$msg = "";
$error = "";

// ================= ADD USER ===================
if (isset($_POST['add_user'])) {
  $name = trim($_POST['name']);
  $email = trim($_POST['email']);
  $password = $_POST['password'];
  $role = trim($_POST['role']); // ensure not blank

  if (!$name || !$email || !$password || !$role) {
    $error = "⚠️ All fields are required, including Role.";
  } else {
    // check if email exists
    $stmt = $pdo->prepare("SELECT COUNT(*) FROM users WHERE email = ?");
    $stmt->execute([$email]);
    if ($stmt->fetchColumn() > 0) {
      $error = "⚠️ Email already exists. Try another.";
    } else {
      $hashed = password_hash($password, PASSWORD_DEFAULT);
      $stmt = $pdo->prepare("INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)");
      $stmt->execute([$name, $email, $hashed, $role]);
      $msg = "✅ User added successfully as $role.";
    }
  }
}

// ================= DELETE USER ===================
if (isset($_GET['delete'])) {
  $uid = (int)$_GET['delete'];
  $stmt = $pdo->prepare("DELETE FROM users WHERE user_id = ?");
  $stmt->execute([$uid]);
  $msg = "🗑️ User deleted successfully.";
}

// ================= FETCH USERS ===================
$users = $pdo->query("SELECT * FROM users ORDER BY created_at DESC")->fetchAll();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Users - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>

<?php include '../includes/navbar.php'; ?>
<?php include '../includes/sidebar.php'; ?>

<div class="main-content">
  <div class="container-fluid">

    <h3 class="mb-4">👥 Manage Users</h3>

    <?php if ($msg): ?>
      <div class="alert alert-success"><?= htmlspecialchars($msg); ?></div>
    <?php endif; ?>
    <?php if ($error): ?>
      <div class="alert alert-danger"><?= htmlspecialchars($error); ?></div>
    <?php endif; ?>

    <!-- ============ Add User Form ============ -->
    <div class="card mb-4 border-0 shadow-sm">
      <div class="card-header bg-primary text-white">Add New User</div>
      <div class="card-body">
        <form method="POST">
          <div class="row g-3">
            <div class="col-md-3">
              <input type="text" name="name" class="form-control" placeholder="Full Name" required>
            </div>
            <div class="col-md-3">
              <input type="email" name="email" class="form-control" placeholder="Email (username)" required>
            </div>
            <div class="col-md-3">
              <input type="password" name="password" class="form-control" placeholder="Password" required>
            </div>
            <div class="col-md-2">
              <select name="role" class="form-select" required>
                <option value="" disabled selected>Select Role</option>
                <option value="Admin">Admin</option>
                <option value="Registrar">Registrar</option>
                <option value="Principal">Principal</option>
              </select>
            </div>
            <div class="col-md-1">
              <button type="submit" name="add_user" class="btn btn-success w-100">Add</button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <!-- ============ User Table ============ -->
    <div class="card border-0 shadow-sm">
      <div class="card-header bg-primary text-white">Existing Users</div>
      <div class="card-body table-responsive">
        <table class="table table-striped table-hover align-middle">
          <thead>
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Email</th>
              <th>Role</th>
              <th>Created</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <?php if ($users): $i = 1; foreach ($users as $u): ?>
              <tr>
                <td><?= $i++; ?></td>
                <td><?= htmlspecialchars($u['name']); ?></td>
                <td><?= htmlspecialchars($u['email']); ?></td>
                <td>
                  <?php 
                    switch ($u['role']) {
                      case 'Admin':
                        echo '<span class="badge bg-secondary">Admin</span>';
                        break;
                      case 'Registrar':
                        echo '<span class="badge bg-success">Registrar</span>';
                        break;
                      case 'Principal':
                        echo '<span class="badge bg-warning text-dark">Principal</span>';
                        break;
                      default:
                        echo '<span class="badge bg-light text-dark">Unknown</span>';
                    }
                  ?>
                </td>
                <td><?= htmlspecialchars($u['created_at']); ?></td>
                <td>
                  <?php if ($u['role'] !== 'Admin'): ?>
                    <a href="?delete=<?= $u['user_id']; ?>" 
                       class="btn btn-sm btn-danger" 
                       onclick="return confirm('Delete this user?');">Delete</a>
                  <?php else: ?>
                    <button class="btn btn-sm btn-secondary" disabled>Protected</button>
                  <?php endif; ?>
                </td>
              </tr>
            <?php endforeach; else: ?>
              <tr><td colspan="6" class="text-center text-muted">No users found.</td></tr>
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
