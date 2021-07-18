<?php
    $servername = "localhost";
    // Your Database name
    $dbname = "cis350project";
    // Your Database user
    $username = "webuser";
    // Your Database user password
    $password = "$8QVe#m&P#";


$db = mysqli_connect($servername, $username, $password, $dbname);

if(!$db)
{
    die("Connection failed: " . mysqli_connect_error());
}

    
?>