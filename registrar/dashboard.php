<?php
session_start();
require_once '../config/db.php';

if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Registrar') {
  header("Location: login.php");
  exit;
}

// Fetch latest import log
$stmt = $pdo->query("SELECT * FROM import_logs ORDER BY import_time DESC LIMIT 1");
$latestBatch = $stmt->fetch();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registrar Dashboard - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>

<?php include '../includes/navbar.php'; ?>
<?php include '../includes/sidebar.php'; ?>

<div class="main-content">
  <div class="container-fluid">
    <h2 class="mb-4">Welcome, <?= htmlspecialchars($_SESSION['name']); ?> 👋</h2>

    <!-- Latest Batch Info -->
    <?php if ($latestBatch): ?>
      <div class="alert alert-info shadow-sm">
        <h5 class="mb-2">📦 Latest Upload Batch</h5>
        <p class="mb-1"><strong>Batch ID:</strong> <?= htmlspecialchars($latestBatch['batch_id']); ?></p>
        <p class="mb-1"><strong>Imported By:</strong> <?= htmlspecialchars($latestBatch['imported_by']); ?></p>
        <p class="mb-1"><strong>Total Students:</strong> <?= (int)$latestBatch['total_students']; ?></p>
        <p class="mb-2"><strong>Uploaded On:</strong> <?= htmlspecialchars($latestBatch['import_time']); ?></p>
        <a href="batch_generate.php?batch=<?= urlencode($latestBatch['batch_id']); ?>" class="btn btn-warning btn-sm">
          ⚡ Generate Certificates for This Batch
        </a>
      </div>
    <?php else: ?>
      <div class="alert alert-secondary shadow-sm">
        No upload batches found. Please import students to begin.
      </div>
    <?php endif; ?>

    <div class="row">
      <!-- Upload Students -->
      <div class="col-md-4 mb-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title">Upload Students</h5>
            <p class="text-muted small">Import students via CSV or manual entry</p>
            <a href="upload_students.php" class="btn btn-primary">Go</a>
          </div>
        </div>
      </div>

      <!-- Generate Certificate -->
      <div class="col-md-4 mb-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title">Generate Certificate</h5>
            <p class="text-muted small">Issue new certificates for uploaded batches</p>
            <a href="batch_generate.php" class="btn btn-primary">Go</a>
          </div>
        </div>
      </div>

      <!-- Issued Certificates -->
      <div class="col-md-4 mb-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title">Issued Certificates</h5>
            <p class="text-muted small">View and manage issued certificates</p>
            <a href="issued_certificates.php" class="btn btn-primary">Go</a>
          </div>
        </div>
      </div>

      <!-- Batch Reports -->
      <div class="col-md-4 mb-3">
        <div class="card text-center border-0 shadow-sm">
          <div class="card-body">
            <h5 class="card-title">Batch Reports</h5>
            <p class="text-muted small">View all imported and generated certificate batches</p>
            <a href="batch_report.php" class="btn btn-primary">Go</a>
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
