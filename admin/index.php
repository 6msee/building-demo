<?php
require_once("config/db.php");
include("includes/header.php");
include("includes/menubar.php");

/* ดึงสถิติ */
$newsCount = $pdo->query("SELECT COUNT(*) FROM news")->fetchColumn();
$docCount = $pdo->query("SELECT COUNT(*) FROM documents")->fetchColumn();
$activityCount = $pdo->query("SELECT COUNT(*) FROM activities")->fetchColumn();
$staffCount = $pdo->query("SELECT COUNT(*) FROM staff")->fetchColumn();
?>

<div class="card">
    <h2><i class="fa-solid fa-gauge-high"></i> Dashboard</h2>
</div>

<div class="dashboard-grid">

    <div class="stat-card">
        <i class="fa-solid fa-newspaper"></i>
        <h3><?= $newsCount ?></h3>
        <p>ข่าวทั้งหมด</p>
    </div>

    <div class="stat-card">
        <i class="fa-solid fa-file"></i>
        <h3><?= $docCount ?></h3>
        <p>เอกสารทั้งหมด</p>
    </div>

    <div class="stat-card">
        <i class="fa-solid fa-calendar-days"></i>
        <h3><?= $activityCount ?></h3>
        <p>กิจกรรมทั้งหมด</p>
    </div>

    <div class="stat-card">
        <i class="fa-solid fa-users"></i>
        <h3><?= $staffCount ?></h3>
        <p>บุคลากรทั้งหมด</p>
    </div>

</div>

<?php include("includes/footer.php"); ?>