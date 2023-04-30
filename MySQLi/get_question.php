<!DOCTYPE html>
<html lang="en">

<head>
    <title>Template</title>

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/main.css" />
    <link rel="stylesheet" href="../css/header.css" />
</head>

<body style="background-color: lightskyblue;font-family: arial">
    

<?php
$mysqli = new mysqli("127.0.0.1", "exams", "exams", "examsplus");
if ($mysqli->connect_error) {
    exit('Could not connect');
}

$sql = "SELECT id, course_id, exam_id, question_class, question_text FROM question WHERE id = ?";

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $_GET['q']);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($id, $cid, $eid, $qclass, $qtext);
$stmt->fetch();
$stmt->close();

echo "<table>";
echo "<tr>";
echo "<th>ID</th>";
echo "<td>" . $id . "</td>";
echo "<th>CourseID</th>";
echo "<td>" . $cid . "</td>";
echo "<th>ExamID</th>";
echo "<td>" . $eid . "</td>";
echo "<th>Class</th>";
echo "<td>" . $qclass . "</td>";
echo "<th>Text</th>";
echo "<td>" . $qtext . "</td>";
echo "</tr>";
echo "</table>";
?>
