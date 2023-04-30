<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
<?php
$mysqli = new mysqli("localhost", "exams", "exams", "examsplus");
if ($mysqli->connect_error) {
    exit('Could not connect');
}
$sql = "SELECT id, course_id, exam_id, question_class, question_text FROM question";

$stmt = $mysqli->prepare($sql);
$stmt->bind_param("s", $_GET['q']);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($id, $cid, $eid, $qclass, $qtext);
$stmt->fetch();
$stmt->close();

echo "<div>";
echo "here";
echo "</div>";



// $sql = "SELECT id, course_id, exam_id, question_class, question_text FROM question WHERE id = ?";

?>

</body>
</html>

