<?php
//all of this code used for refreshing the page
//$page = $_SERVER['PHP_SELF'];
$sec = "3";
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
?>
<html>
<head>

<?php
//connect to database
//$con=mysqli_connect("localhost","exampleuser","pi","exampledb");// server, user, pass, databasesudo
// Check connection
//if (mysqli_connect_errno()) {
//  echo "Failed to connect to MySQL: " . mysqli_connect_error();
//}

//this file defines MySQLConnection
include "connectDB.php";
$con = $MySQLConnection;

//grab the table out of the database
$result = mysqli_query($con,"SELECT * FROM devices");//table select


//print some nice text at the top
echo "";

//draw the table
echo "<table border='2'>
<tr>
<th> </th>
<th>Device Name</th>
<th>Password</th>
<th></th>
</tr>";


//Login Info and Forms
echo "<tr><form action= login_SQL.php method= 'post'>";
echo "<td></td>";
echo "<td><input type='text' name='user' value=''  size='15' ></td>";
echo "<td><input type='text' name='pass' value=''  size='15' ></td>";
echo "<td><input type= 'submit' name= 'change_but' style='text-align:center;' value='Login'></td></tr></form>";

echo "</form></tr></table>  <div><form action=newdevice.php  method='post'><input type= 'submit' name= 'change_back' style='text-align:center;' value='New Device'></div></form> <div style='text-align:center; padding: 15px;'><p> __  </p></div>
</html>";

?>