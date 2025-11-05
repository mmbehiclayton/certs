<?php
session_start();
require_once '../config/db.php';

// Security check
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Admin') {
  header("Location: login.php");
  exit;
}

// Fetch basic stats
$total_students = $pdo->query("SELECT COUNT(*) FROM students")->fetchColumn();
$total_certs = $pdo->query("SELECT COUNT(*) FROM certificates")->fetchColumn();
$total_registrars = $pdo->query("SELECT COUNT(*) FROM users WHERE role='Registrar'")->fetchColumn();
$total_revoked = $pdo->query("SELECT COUNT(*) FROM certificates WHERE status='Revoked'")->fetchColumn();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard - KNP Certificate System</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>

<?php include '../includes/navbar.php'; ?>
<?php include '../includes/sidebar.php'; ?>

<div class="main-content">
  <div class="container-fluid">
    <h2 class="mb-4">Welcome, <?= htmlspecialchars($_SESSION['name']); ?></h2>

    <!-- Stats Row -->
    <div class="row g-4 mb-4">
      <div class="col-md-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title text-secondary">Total Students</h5>
            <h2 class="fw-bold text-primary"><?= $total_students; ?></h2>
          </div>
          <div class="card-footer bg-light text-muted small">Enrolled</div>
        </div>
      </div>

      <div class="col-md-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title text-secondary">Certificates Issued</h5>
            <h2 class="fw-bold text-success"><?= $total_certs; ?></h2>
          </div>
          <div class="card-footer bg-light text-muted small">All time</div>
        </div>
      </div>

      <div class="col-md-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title text-secondary">Active Registrars</h5>
            <h2 class="fw-bold text-info"><?= $total_registrars; ?></h2>
          </div>
          <div class="card-footer bg-light text-muted small">Current</div>
        </div>
      </div>

      <div class="col-md-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title text-secondary">Revoked Certificates</h5>
            <h2 class="fw-bold text-danger"><?= $total_revoked; ?></h2>
          </div>
          <div class="card-footer bg-light text-muted small">Invalidated</div>
        </div>
      </div>
    </div>

    <!-- Quick Action Cards -->
    <div class="row g-4">
      <div class="col-md-4">
        <div class="card border-0 shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">Manage Users</h5>
            <p>View and manage Registrar accounts</p>
            <a href="manage_users.php" class="btn btn-primary w-100">Go</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card border-0 shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">View Certificates</h5>
            <p>Track issued or revoked certificates</p>
            <a href="../registrar/issued_certificates.php" class="btn btn-primary w-100">Go</a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="card border-0 shadow-sm">
          <div class="card-body text-center">
            <h5 class="card-title">System Settings</h5>
            <p>Manage configurations and backups</p>
            <a href="#" class="btn btn-primary w-100 disabled">Coming Soon</a>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>

<?php include '../includes/footer.php'; ?>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/main.js"></script>
</body>
</html>
