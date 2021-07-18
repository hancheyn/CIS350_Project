<?php
function getCmdStatus() {
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

    $sql = "SELECT Status FROM commands WHERE ID="1";
    $commandStatus = $conn->query($sql);

    if ($commandStatus == 0) {
      echo "STATUS: <span style=\"color: #00D80D\">COMMAND RECEIVED</span>";
    }

    if ($commandStatus == 1) {
      echo "STATUS: <span style=\"color: #00D80D'\">COMMAND SENT</span>";
    }

    $conn->close();
}
?>