<!DOCTYPE html>
<html>
<body>

<?php
$servername = "localhost";
$username = "webuser";
$password = "$8QVe#m&P#";
$dbname = "cis350project";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT ID, Command, Board, Status FROM commands";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        echo "<br> ". $row["ID"]. " ". $row["Command"]. " ". $row["Board"].  " ". $row["Status"]."<br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>

</body>
</html>
