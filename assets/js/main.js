// Sidebar toggle for mobile view
document.addEventListener("DOMContentLoaded", function() {
  const sidebar = document.getElementById("sidebar");
  const toggle = document.getElementById("menu-toggle");

  if (toggle && sidebar) {
    toggle.addEventListener("click", () => {
      sidebar.classList.toggle("active");
    });
  }
});
