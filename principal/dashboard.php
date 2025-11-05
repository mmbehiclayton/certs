<?php
session_start();
require_once '../config/db.php';

if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Principal') {
  header("Location: login.php");
  exit;
}

$search = trim($_GET['search'] ?? '');
$start_date = $_GET['start_date'] ?? '';
$end_date = $_GET['end_date'] ?? '';

$sql = "
  SELECT c.cert_no, c.admission_no, s.name AS student_name, 
         s.course, s.grade, c.issue_date, c.pdf_path,
         i.batch_id, i.imported_by
  FROM certificates c
  LEFT JOIN students s ON c.admission_no = s.admission_no
  LEFT JOIN import_logs i ON DATE(i.import_time) = DATE(c.issue_date)
  WHERE 1=1
";
$params = [];

if (!empty($search)) {
  $sql .= " AND c.cert_no = ?";
  $params[] = $search;
}
if (!empty($start_date) && !empty($end_date)) {
  $sql .= " AND DATE(c.issue_date) BETWEEN ? AND ?";
  $params[] = $start_date;
  $params[] = $end_date;
}

$sql .= " ORDER BY c.issue_date DESC";
$stmt = $pdo->prepare($sql);
$stmt->execute($params);
$certificates = $stmt->fetchAll();

$total_certs = $pdo->query("SELECT COUNT(*) FROM certificates")->fetchColumn();
$total_batches = $pdo->query("SELECT COUNT(*) FROM import_logs")->fetchColumn();
$total_students = $pdo->query("SELECT COUNT(*) FROM students")->fetchColumn();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Chief Principal Dashboard - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <style>
    body { background: #f8f9fa; }
    .summary-card { border-left: 6px solid #0d6efd; background: #fff; }
    .summary-card h3 { color: #0d6efd; margin: 0; }
    table thead th { background: #0d6efd; color: #fff; }
  </style>
</head>
<body>

<nav class="navbar navbar-expand-lg shadow-sm" style="background-color:#0d6efd;">
  <div class="container-fluid">
    <a class="navbar-brand text-white fw-bold">🎓 KNP CMS - Chief Principal</a>
    <div class="navbar-text text-white ms-auto">
      Welcome, <?= htmlspecialchars($_SESSION['name']); ?> |
      <a href="../logout.php" class="text-light text-decoration-underline ms-2">Logout</a>
    </div>
  </div>
</nav>

<div class="container mt-4">
  <h4 class="mb-3 text-primary fw-bold">Chief Principal Dashboard</h4>

  <div class="row mb-4">
    <div class="col-md-4">
      <div class="card summary-card shadow-sm p-3">
        <h5>Total Certificates</h5>
        <h3><?= $total_certs; ?></h3>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card summary-card shadow-sm p-3 border-success">
        <h5>Total Batches</h5>
        <h3><?= $total_batches; ?></h3>
      </div>
    </div>
    <div class="col-md-4">
      <div class="card summary-card shadow-sm p-3 border-warning">
        <h5>Total Students</h5>
        <h3><?= $total_students; ?></h3>
      </div>
    </div>
  </div>

  <form method="get" class="row g-3 mb-4">
    <div class="col-md-4">
      <label class="form-label">Search by Certificate No.</label>
      <input type="text" name="search" class="form-control" placeholder="e.g. 20250123" value="<?= htmlspecialchars($search); ?>">
    </div>
    <div class="col-md-3">
      <label class="form-label">From</label>
      <input type="date" name="start_date" class="form-control" value="<?= htmlspecialchars($start_date); ?>">
    </div>
    <div class="col-md-3">
      <label class="form-label">To</label>
      <input type="date" name="end_date" class="form-control" value="<?= htmlspecialchars($end_date); ?>">
    </div>
    <div class="col-md-2 d-flex align-items-end">
      <button class="btn btn-primary w-100">🔍 Search</button>
    </div>
  </form>

  <div class="text-end mb-3">
    <a href="generate_report.php?search=<?= urlencode($search); ?>&start_date=<?= urlencode($start_date); ?>&end_date=<?= urlencode($end_date); ?>" class="btn btn-danger">⬇ Download Report (PDF)</a>
    <button onclick="window.print()" class="btn btn-outline-secondary">🖨️ Print</button>
  </div>

  <div class="card shadow-sm">
    <div class="card-body p-0">
      <table class="table table-striped table-hover mb-0">
        <thead>
          <tr>
            <th>Certificate No</th>
            <th>Student Name</th>
            <th>Course</th>
            <th>Grade</th>
            <th>Issue Date</th>
            <th>Batch ID</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
        <?php if ($certificates): foreach ($certificates as $c): ?>
          <tr>
            <td><?= htmlspecialchars($c['cert_no']); ?></td>
            <td><?= htmlspecialchars($c['student_name']); ?></td>
            <td><?= htmlspecialchars($c['course']); ?></td>
            <td><?= htmlspecialchars($c['grade']); ?></td>
            <td><?= htmlspecialchars($c['issue_date']); ?></td>
            <td><?= htmlspecialchars($c['batch_id'] ?? '—'); ?></td>
            <td>
              <?php if (!empty($c['pdf_path']) && file_exists("../" . $c['pdf_path'])): ?>
                <a href="../<?= htmlspecialchars($c['pdf_path']); ?>" target="_blank" class="btn btn-sm btn-warning">📄 PDF</a>
              <?php endif; ?>
            </td>
          </tr>
        <?php endforeach; else: ?>
          <tr><td colspan="7" class="text-center text-muted">No results found.</td></tr>
        <?php endif; ?>
        </tbody>
      </table>
    </div>
  </div>
</div>
</body>
</html>
