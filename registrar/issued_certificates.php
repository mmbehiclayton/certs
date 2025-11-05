<?php
session_start();
require_once '../config/db.php';

// Restrict access to Registrar only
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Registrar') {
  header("Location: login.php");
  exit;
}

$message = "";
$error = "";

// ================== HANDLE REVOCATION / REINSTATEMENT ==================
if (isset($_GET['action']) && isset($_GET['cert_no'])) {
  $cert_no = $_GET['cert_no'];
  $action = $_GET['action'];

  if ($action === 'revoke') {
    $stmt = $pdo->prepare("UPDATE certificates SET status = 'Revoked' WHERE cert_no = ?");
    $stmt->execute([$cert_no]);
    $message = "⚠️ Certificate $cert_no has been revoked.";
  } elseif ($action === 'reinstate') {
    $stmt = $pdo->prepare("UPDATE certificates SET status = 'Issued' WHERE cert_no = ?");
    $stmt->execute([$cert_no]);
    $message = "✅ Certificate $cert_no has been reinstated.";
  }
}

// ================== SEARCH / FILTER ==================
$search = "";
$query = "SELECT * FROM certificates ORDER BY created_at DESC";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && !empty($_POST['search'])) {
  $search = trim($_POST['search']);
  $query = "SELECT * FROM certificates 
            WHERE cert_no LIKE ? OR admission_no LIKE ?
            ORDER BY created_at DESC";
  $stmt = $pdo->prepare($query);
  $stmt->execute(["%$search%", "%$search%"]);
  $certs = $stmt->fetchAll();
} else {
  $certs = $pdo->query($query)->fetchAll();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Issued Certificates - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>

<?php include '../includes/navbar.php'; ?>
<?php include '../includes/sidebar.php'; ?>

<div class="main-content">
  <div class="container-fluid">

    <h3 class="mb-4 text-knp">📜 Issued Certificates</h3>

    <?php if ($message): ?><div class="alert alert-success"><?= $message; ?></div><?php endif; ?>
    <?php if ($error): ?><div class="alert alert-danger"><?= $error; ?></div><?php endif; ?>

    <!-- Search Form -->
    <form method="POST" class="row g-3 mb-4">
      <div class="col-md-8">
        <input type="text" name="search" class="form-control" placeholder="Search by Admission No or Certificate No" value="<?= htmlspecialchars($search); ?>">
      </div>
      <div class="col-md-4">
        <button type="submit" class="btn btn-primary w-100">Search</button>
      </div>
    </form>

    <!-- Certificates Table -->
    <div class="card border-0 shadow-sm">
      <div class="card-header bg-light">All Issued Certificates</div>
      <div class="card-body table-responsive">
        
        <table class="table table-hover align-middle">
          <thead class="table-dark">
            <tr>
              <th>#</th>
              <th>Certificate No</th>
              <th>Admission No</th>
              <th>Certificate Type</th>
              <th>Issue Date</th>
              <th>Status</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <?php
              if ($certs):
                $i = 1;
                foreach ($certs as $c):
            ?>
            <tr>
              <td><?= $i++; ?></td>
              <td><?= htmlspecialchars($c['cert_no']); ?></td>
              <td><?= htmlspecialchars($c['admission_no']); ?></td>
              <td><?= htmlspecialchars($c['cert_type']); ?></td>
              <td><?= htmlspecialchars($c['issue_date']); ?></td>
              <td>
                <?php if ($c['status'] === 'Issued'): ?>
                  <span class="badge bg-success">Issued</span>
                <?php else: ?>
                  <span class="badge bg-danger">Revoked</span>
                <?php endif; ?>
              </td>
              <td>
                <a href="../<?= htmlspecialchars($c['pdf_path']); ?>" target="_blank" class="btn btn-sm btn-primary">View PDF</a>
                <?php if ($c['status'] === 'Issued'): ?>
                  <a href="?action=revoke&cert_no=<?= urlencode($c['cert_no']); ?>" 
                     onclick="return confirm('Revoke this certificate?');"
                     class="btn btn-sm btn-warning">Revoke</a>
                <?php else: ?>
                  <a href="?action=reinstate&cert_no=<?= urlencode($c['cert_no']); ?>" 
                     onclick="return confirm('Reinstate this certificate?');"
                     class="btn btn-sm btn-success">Reinstate</a>
                <?php endif; ?>
              </td>
            </tr>
            <?php endforeach; else: ?>
              <tr>
                <td colspan="7" class="text-center text-muted">No certificates found.</td>
              </tr>
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
