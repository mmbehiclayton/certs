<div class="sidebar bg-light shadow-sm">
  <ul class="list-unstyled m-0 p-3">
    <li class="sidebar-header text-center fw-bold text-uppercase text-knp mb-3">
      Menu
    </li>
    <li><a href="../<?= strtolower($_SESSION['role']); ?>/dashboard.php" class="sidebar-link"><span>🏠</span> Dashboard</a></li>

    <?php if ($_SESSION['role'] === 'Registrar'): ?>
      <li><a href="../registrar/upload_students.php" class="sidebar-link"><span>📤</span> Upload Students</a></li>
      <li><a href="../registrar/generate_certificate.php" class="sidebar-link"><span>🎓</span> Generate Certificate</a></li>
      <li><a href="../registrar/issued_certificates.php" class="sidebar-link"><span>📜</span> Issued Certificates</a></li>
       <li><a href="../registrar/batch_report.php" class="sidebar-link"><span>📜</span> Batch report</a></li>
    <?php endif; ?>

    <?php if ($_SESSION['role'] === 'Admin'): ?>
      <li><a href="../admin/manage_users.php" class="sidebar-link"><span>👥</span> Manage Users</a></li>
    <?php endif; ?>

    <hr>
    <li><a href="../<?= strtolower($_SESSION['role']); ?>/logout.php" class="sidebar-link text-danger"><span>🚪</span> Sign out</a></li>
  </ul>
</div>
