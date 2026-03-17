<?php
require_once("../config/db.php");
include("../includes/header.php");
include("../includes/menubar.php");

$stmt = $pdo->query("SELECT * FROM news ORDER BY id DESC");
?>

<div class="card">
    <h2><i class="fa fa-newspaper"></i> จัดการข่าว</h2>
    <a href="add.php" class="btn btn-primary">
        <i class="fa fa-plus"></i> เพิ่มข่าว
    </a>

    <table>
        <tr>
            <th>หัวข้อ</th>
            <th>หมวดหมู่</th>
            <th>ผู้เขียน</th>
            <th>จัดการ</th>
        </tr>

        <?php while($row = $stmt->fetch(PDO::FETCH_ASSOC)) { ?>
        <tr>
            <td><?= htmlspecialchars($row['title']) ?></td>
            <td><?= htmlspecialchars($row['category']) ?></td>
            <td><?= htmlspecialchars($row['author']) ?></td>
            <td>
                <a href="edit.php?id=<?= $row['id'] ?>" class="btn btn-primary">
                    <i class="fa fa-edit"></i>
                </a>
                <a href="delete.php?id=<?= $row['id'] ?>" class="btn btn-primary">
                    <i class="fa fa-trash"></i>
                </a>
            </td>
        </tr>
        <?php } ?>
    </table>
</div>

<?php include("../includes/footer.php"); ?>