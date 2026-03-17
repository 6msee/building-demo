<?php include('../config/db.php'); ?>

<?php
if($_POST){
    $stmt = $pdo->prepare("INSERT INTO news(title,category,detail,author,created_at)
    VALUES(?,?,?,?,NOW())");

    $stmt->execute([
        $_POST['title'],
        $_POST['category'],
        $_POST['detail'],
        $_POST['author']
    ]);

    header("Location: index.php");
}
?>

<form method="post">
<input name="title" placeholder="หัวข้อ">
<input name="category" placeholder="ประเภทข่าว">
<textarea name="detail"></textarea>
<input name="author" placeholder="ผู้เขียน">
<button>บันทึก</button>
</form>