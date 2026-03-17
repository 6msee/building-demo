<?php
include('../config/db.php');

$id = $_GET['id'];
$pdo->prepare("DELETE FROM news WHERE id=?")->execute([$id]);

header("Location: index.php");