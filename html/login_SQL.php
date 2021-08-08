
<html>
<?php

$pass = $_POST['pass'];
$user = $_POST['user'];

//$con = mysqli_connect("localhost","exampleuser","pi","exampledb");
//if (mysqli_connect_errno()) {
//	echo "Failed to connect to SQL: " . mysqli_connect_error();
//}

//this file defines MySQLConnection
include "connectDB.php";
$con = $MySQLConnection;

if ($res = mysqli_query($con, "SELECT * FROM devices WHERE user='{$user}'")) {
 $row = mysqli_fetch_array($res);
 $device = $row['device']; 

 if(mysqli_num_rows($res) == 0) {
  echo "No Existing User. ";
 }

 if($row['pass'] != $pass) {
  echo "Password is incorrect.";
 }
 else {
  echo "Should be Good";
  //Pass User to Main interface
  //Pass device id to main interface
  header("location: index.php?device=" . $device);
 }

}
else {
 echo "Something went wrong.";
}
mysqli_close($con);



?>
<div><form action=login.php  method='post'>
<input type= 'submit' name= 'change_but' style='text-align:center;' value='OK'>
</div></form>
</html>
