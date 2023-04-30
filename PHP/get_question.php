<?php
$mysqli = new mysqli("127.0.0.1", "exams", "exams", "examsplus");
if ($mysqli->connect_error) {
    exit('Could not connect');
}

// $sql = "SELECT customerid, companyname, contactname, address, city, postalcode, country
// FROM customers WHERE customerid = ?";

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
