<?php
//all of this code used for refreshing the page
//$page = $_SERVER['PHP_SELF'];
$sec = "3";
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
?>

<html lang="en-US">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ESP32 Web-Based IR Controller</title>
<link href="css/singlePageTemplate.css" rel="stylesheet" type="text/css">
<!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
<script>var __adobewebfontsappname__="dreamweaver"</script>
<script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>


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
echo "<div style='position: relative; top: 20%;'>";

//draw the table
echo "<table style='margin-left: auto; margin-right: auto;'  border='2'>
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

echo "</div></tr></table>  <div> <div style='text-align:center; padding: 5px;'><form action=newdevice.php  method='post'><input type= 'submit' name= 'change_back' style='text-align:center;' value='New Device'></div></form></div>
</html>";

?>
