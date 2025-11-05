<?php
session_start();
require_once '../config/db.php';

// ================= ACCESS CONTROL ===================
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Registrar') {
  header("Location: login.php");
  exit;
}

$message = "";
$error = "";

// ================= SUCCESS MESSAGE FROM CERT GENERATION ===================
if (isset($_GET['msg'])) {
  $message = htmlspecialchars($_GET['msg']);
}

// ================= CSV Upload ===================
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_FILES['csv_file'])) {
  $file = $_FILES['csv_file']['tmp_name'];
  if (is_uploaded_file($file)) {
    $handle = fopen($file, 'r');
    $row = 0;
    $imported = 0;

    try {
      $pdo->beginTransaction();
      $stmt = $pdo->prepare("
        INSERT INTO students (admission_no, name, course, qualification_code, qualification_type, grade, completion_year)
        VALUES (?, ?, ?, ?, ?, ?, ?)
        ON DUPLICATE KEY UPDATE 
          name=VALUES(name), 
          course=VALUES(course),
          qualification_code=VALUES(qualification_code),
          qualification_type=VALUES(qualification_type),
          grade=VALUES(grade), 
          completion_year=VALUES(completion_year)
      ");

      while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        if ($row++ === 0) continue; // skip header
        [$adm, $name, $course, $qualification_code, $qualification_type, $grade, $year] = array_map('trim', $data);
        if (!$adm || !$name) continue;
        $stmt->execute([$adm, $name, $course, $qualification_code, $qualification_type, $grade, $year]);
        $imported++;
      }

      // ✅ STEP 1: Create batch ID and log it
      $batchId = 'BATCH_' . date('Ymd_His');
      $totalImported = $imported;
      $importedBy = $_SESSION['username'] ?? 'Registrar';

      $stmtLog = $pdo->prepare("INSERT INTO import_logs (batch_id, imported_by, total_students) VALUES (?, ?, ?)");
      $stmtLog->execute([$batchId, $importedBy, $totalImported]);

      // ✅ STEP 2: Assign the batch ID to all students imported in this batch
      $pdo->exec("UPDATE students SET batch_id = '{$batchId}' WHERE batch_id IS NULL ORDER BY created_at DESC LIMIT {$totalImported}");

      $pdo->commit();
      fclose($handle);

      $message = "✅ Successfully imported $imported students (Batch ID: $batchId)";
    } catch (Exception $e) {
      $pdo->rollBack();
      $error = "❌ Import failed: " . $e->getMessage();
    }
  } else {
    $error = "⚠️ Failed to upload file.";
  }
}

// ================= Manual Add ===================
if (isset($_POST['add_manual'])) {
  $adm   = trim($_POST['admission_no']);
  $name  = trim($_POST['name']);
  $course = trim($_POST['course']);
  $qualification_code = trim($_POST['qualification_code']);
  $qualification_type = trim($_POST['qualification_type']);
  $grade = trim($_POST['grade']);
  $year  = trim($_POST['completion_year']);

  if ($adm && $name && $course && $year && $qualification_code && $qualification_type) {
    $stmt = $pdo->prepare("
      INSERT INTO students (admission_no, name, course, qualification_code, qualification_type, grade, completion_year)
      VALUES (?, ?, ?, ?, ?, ?, ?)
      ON DUPLICATE KEY UPDATE 
        name=VALUES(name), 
        course=VALUES(course),
        qualification_code=VALUES(qualification_code),
        qualification_type=VALUES(qualification_type),
        grade=VALUES(grade),
        completion_year=VALUES(completion_year)
    ");
    $stmt->execute([$adm, $name, $course, $qualification_code, $qualification_type, $grade, $year]);
    $message = "✅ Student record added/updated successfully.";
  } else {
    $error = "⚠️ All fields are required.";
  }
}

// ================= Delete ===================
if (isset($_GET['delete'])) {
  $adm = $_GET['delete'];
  $stmt = $pdo->prepare("DELETE FROM students WHERE admission_no = ?");
  $stmt->execute([$adm]);
  $message = "🗑️ Student deleted successfully.";
}

// ================= Edit ===================
if (isset($_POST['edit_student'])) {
  $adm = $_POST['edit_admission_no'];
  $name = $_POST['edit_name'];
  $course = $_POST['edit_course'];
  $qualification_code = $_POST['edit_qualification_code'];
  $qualification_type = $_POST['edit_qualification_type'];
  $grade = $_POST['edit_grade'];
  $year = $_POST['edit_year'];

  $stmt = $pdo->prepare("UPDATE students 
    SET name=?, course=?, qualification_code=?, qualification_type=?, grade=?, completion_year=? 
    WHERE admission_no=?");
  $stmt->execute([$name, $course, $qualification_code, $qualification_type, $grade, $year, $adm]);
  $message = "✏️ Student record updated successfully.";
}

// ================= Search ===================
$search = $_GET['search'] ?? '';
if ($search) {
  $stmt = $pdo->prepare("SELECT * FROM students 
    WHERE name LIKE ? OR admission_no LIKE ? OR course LIKE ? 
      OR qualification_code LIKE ? OR qualification_type LIKE ?
    ORDER BY created_at DESC");
  $stmt->execute(["%$search%", "%$search%", "%$search%", "%$search%", "%$search%"]);
  $students = $stmt->fetchAll();
} else {
  $students = $pdo->query("SELECT * FROM students ORDER BY created_at DESC LIMIT 20")->fetchAll();
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Manage Students - KNP CMS</title>
  <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
  <link rel="stylesheet" href="../assets/css/style.css">
  <link rel="stylesheet" href="../assets/css/dashboard.css">
</head>
<body>

<?php include '../includes/navbar.php'; ?>
<?php include '../includes/sidebar.php'; ?>

<div class="main-content">
  <div class="container-fluid">
    <h3 class="mb-4 text-knp">🎓 Student Management</h3>

    <?php if ($message): ?><div class="alert alert-success"><?= $message; ?></div><?php endif; ?>
    <?php if ($error): ?><div class="alert alert-danger"><?= $error; ?></div><?php endif; ?>

    <div class="row">
      <!-- CSV Upload -->
      <div class="col-md-6 mb-4">
        <div class="card border-0 shadow-sm">
          <div class="card-header bg-knp text-white">Bulk Upload (CSV)</div>
          <div class="card-body">
            <form method="POST" enctype="multipart/form-data">
              <input type="file" name="csv_file" class="form-control mb-2" accept=".csv" required>
              <small class="text-muted">
                Format: admission_no, name, course, qualification_code, qualification_type, grade, completion_year
              </small><br>
              <button type="submit" class="btn btn-primary w-100 mt-2">Upload CSV</button>
            </form>
          </div>
        </div>
      </div>

      <!-- Manual Add -->
      <div class="col-md-6 mb-4">
        <div class="card border-0 shadow-sm">
          <div class="card-header bg-knp text-white">Add Student</div>
          <div class="card-body">
            <form method="POST">
              <input type="hidden" name="add_manual" value="1">
              <div class="row g-2">
                <div class="col-md-6"><input type="text" name="admission_no" placeholder="Admission No" class="form-control" required></div>
                <div class="col-md-6"><input type="text" name="name" placeholder="Full Name" class="form-control" required></div>
                <div class="col-md-6"><input type="text" name="course" placeholder="Course" class="form-control" required></div>
                <div class="col-md-6"><input type="text" name="qualification_code" placeholder="Qualification Code" class="form-control" required></div>
                <div class="col-md-6"><input type="text" name="qualification_type" placeholder="Qualification Type" class="form-control" required></div>
                <div class="col-md-3"><input type="text" name="grade" placeholder="Grade" class="form-control"></div>
                <div class="col-md-3"><input type="number" name="completion_year" placeholder="Year" class="form-control" required></div>
              </div>
              <button class="btn btn-success w-100 mt-3">Add Student</button>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Search -->
    <form class="mb-3" method="GET">
      <input type="text" name="search" class="form-control" placeholder="Search by name, course, qualification code, or type" value="<?= htmlspecialchars($search); ?>">
    </form>

    <!-- Student Table -->
    <div class="card border-0 shadow-sm">
      <div class="card-header bg-light">Student Records</div>
      <div class="card-body table-responsive">
        <div class="mb-3 text-end">
  <a href="batch_generate.php" class="btn btn-warning">
    ⚡ Generate Certificates in Batch (Max 1000)
  </a>
</div>

        <table class="table table-striped table-hover align-middle">
          <thead class="table-dark">
            <tr>
              <th>Admission No</th>
              <th>Name</th>
              <th>Course</th>
              <th>Qualification Code</th>
              <th>Qualification Type</th>
              <th>Grade</th>
              <th>Year</th>
              <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <?php if ($students): foreach ($students as $s): ?>
              <tr>
                <td><?= htmlspecialchars($s['admission_no']); ?></td>
                <td><?= htmlspecialchars($s['name']); ?></td>
                <td><?= htmlspecialchars($s['course']); ?></td>
                <td><?= htmlspecialchars($s['qualification_code']); ?></td>
                <td><?= htmlspecialchars($s['qualification_type']); ?></td>
                <td><?= htmlspecialchars($s['grade']); ?></td>
                <td><?= htmlspecialchars($s['completion_year']); ?></td>
               <td>
  <button class="btn btn-sm btn-outline-primary" 
    data-bs-toggle="modal" 
    data-bs-target="#editModal"
    data-adm="<?= htmlspecialchars($s['admission_no']); ?>"
    data-name="<?= htmlspecialchars($s['name']); ?>"
    data-course="<?= htmlspecialchars($s['course']); ?>"
    data-qualification="<?= htmlspecialchars($s['qualification_code']); ?>"
    data-qtype="<?= htmlspecialchars($s['qualification_type']); ?>"
    data-grade="<?= htmlspecialchars($s['grade']); ?>"
    data-year="<?= htmlspecialchars($s['completion_year']); ?>">
    ✏️ Edit
  </button>

  <a href="?delete=<?= urlencode($s['admission_no']); ?>" 
     class="btn btn-sm btn-outline-danger"
     onclick="return confirm('Delete this student?');">🗑️ Delete</a>

  <a href="generate_certificate.php?adm=<?= urlencode($s['admission_no']); ?>" 
     class="btn btn-sm btn-success">🧾 Generate Cert</a>

  <?php
  // check if this student already has a certificate
  $certCheck = $pdo->prepare("SELECT pdf_path FROM certificates WHERE admission_no = ?");
  $certCheck->execute([$s['admission_no']]);
  $cert = $certCheck->fetch();

  if ($cert && file_exists("../" . $cert['pdf_path'])): ?>
    <a href="../<?= htmlspecialchars($cert['pdf_path']); ?>" 
       target="_blank" 
       class="btn btn-sm btn-primary">👁️ View Cert</a>
  <?php else: ?>
    <button class="btn btn-sm btn-secondary" disabled>🚫 No Cert</button>
  <?php endif; ?>
</td>

              </tr>
            <?php endforeach; else: ?>
              <tr><td colspan="8" class="text-center text-muted">No students found.</td></tr>
            <?php endif; ?>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</div>

<!-- Edit Modal -->
<div class="modal fade" id="editModal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="POST">
        <div class="modal-header bg-knp text-white">
          <h5 class="modal-title">Edit Student</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="edit_student" value="1">
          <input type="hidden" name="edit_admission_no" id="edit_admission_no">
          <div class="mb-2"><label>Name</label>
            <input type="text" name="edit_name" id="edit_name" class="form-control" required></div>
          <div class="mb-2"><label>Course</label>
            <input type="text" name="edit_course" id="edit_course" class="form-control" required></div>
          <div class="mb-2"><label>Qualification Code</label>
            <input type="text" name="edit_qualification_code" id="edit_qualification_code" class="form-control" required></div>
          <div class="mb-2"><label>Qualification Type</label>
            <input type="text" name="edit_qualification_type" id="edit_qualification_type" class="form-control" required></div>
          <div class="mb-2"><label>Grade</label>
            <input type="text" name="edit_grade" id="edit_grade" class="form-control"></div>
          <div class="mb-2"><label>Completion Year</label>
            <input type="number" name="edit_year" id="edit_year" class="form-control" required></div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-primary">Save Changes</button>
        </div>
      </form>
    </div>
  </div>
</div>

<?php include '../includes/footer.php'; ?>

<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/main.js"></script>
<script>
  const editModal = document.getElementById('editModal');
  editModal.addEventListener('show.bs.modal', function (event) {
    const button = event.relatedTarget;
    document.getElementById('edit_admission_no').value = button.getAttribute('data-adm');
    document.getElementById('edit_name').value = button.getAttribute('data-name');
    document.getElementById('edit_course').value = button.getAttribute('data-course');
    document.getElementById('edit_qualification_code').value = button.getAttribute('data-qualification');
    document.getElementById('edit_qualification_type').value = button.getAttribute('data-qtype');
    document.getElementById('edit_grade').value = button.getAttribute('data-grade');
    document.getElementById('edit_year').value = button.getAttribute('data-year');
  });
</script>
</body>
</html>

