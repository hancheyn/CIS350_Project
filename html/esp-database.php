<?php
    $servername = "localhost";
    // Your Database name
    $dbname = "cis350project";
    // Your Database user
    $username = "webuser";
    // Your Database user password
    $password = "T9^T3DrQ$8QVe#m&P#";

function updateCommand($ID, $Command, $Board, $Status) {
        global $servername, $username, $password, $dbname;

        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);
        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }

        $sql = "UPDATE commands
        SET Command='$Command',  Board='0', Status='$Status'
	WHERE ID = '$ID'";

       if ($conn->query($sql) === TRUE) {
            return "New output created successfully";
        }
        else {
            return "Error: " . $sql . "<br>" . $conn->error;
        }
        $conn->close();
    }
?>
