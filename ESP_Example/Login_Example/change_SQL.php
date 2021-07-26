<?php
//all of this code used for refreshing the page
//$page = $_SERVER['PHP_SELF'];
$sec = "3";
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
?>  

<html>
<?php

$pass = $_POST['pass'];
$user = $_POST['user'];
$device = $_POST['device'];

//this file defines MySQLConnection
include "connectDB.php";
$con = $MySQLConnection;

//$con = mysqli_connect("localhost","exampleuser","pi","exampledb");
//if (mysqli_connect_errno()) {
//	echo "Failed to connect to SQL: " . mysqli_connect_error();
//}

if ($res = mysqli_query($con, "SELECT * FROM devices WHERE device='{$device}'")) {
 //echo "This device may  already be registered: " .  $device . ".";
 if(mysqli_num_rows($res) == 0) {
  echo "...";
  
  //If the query obtains no results
  //First insert device login info
  mysqli_query($con, "INSERT INTO devices (device, user, pass) VALUES ('{$device}','{$user}','{$pass}')");

  //Create a new table for the device tomysqli_query($con, "INSERT INTO devices (device, user, pass) VALUES ('{$device}','{$user}','{$pass}')"); link to.
  $newTable = "CREATE TABLE " . $device . " (ID MEDIUMINT NOT NULL AUTO_INCREMENT, Command CHAR(30) NOT NULL, Board MEDIUMINT NOT NULL, Status MEDIUMINT NOT NULL, PRIMARY KEY (ID))";
  if(mysqli_query($con, $newTable)) {
  	echo "Successfully Made Table. ";
  }

  $fillTable = "INSERT INTO " . $device . " (Command, Board, Status) VALUES ('No_Command','0','0')";
  mysqli_query($con, $fillTable);

  header("location: newdevice.php");

 }
}
else {
 echo "Something went wrong.";
}
mysqli_close($con);

?>
</html>
