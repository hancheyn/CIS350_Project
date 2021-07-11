<?php
//all of this code used for refreshing the page
//$page = $_SERVER['PHP_SELF'];
$sec = "3";
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Cache-Control: post-check=0, pre-check=0", false);
header("Pragma: no-cache");
?>  
<?php
//connect to database
$con=mysqli_connect("localhost","charting_userESP","Nietzsche1","charting_ESP32");// server, user, pass, database


// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
//grab the table out of the database
$result = mysqli_query($con,"SELECT * FROM ESPtable");//table select

//print some nice text at the top
$unit_id = $row['id'];
$column = "LED";
$current_LED = $row['LED'];
echo "<div style='width:25%; height:30px'>  </div>";
echo "<div style='float:left; width:33%; height:15%; color:black; font-size: 17px;'> <b>Controls for ESP32</b> </div>";
echo "<div style='float:left; width:33%; height:15%; color:black; font-size: 17px;'> <b>Change Setting</b> </div>";
echo "<div style='float:left; width:33%; height:15%; color:black; font-size: 17px;'> <b>Last Updated Change</b> </div>";

while($row = mysqli_fetch_array($result)) {

  echo "<div style='width:100%'>";
  $unit_id = $row['id'];
  echo "<div style='float:left; width:33%; height:10%; background-color:white; padding-top:20px;'>" . $row['id'] . "</div>";
$column = "LED";
$current_LED = $row['LED'];

// form action
echo "<div style='float:left; width:33%; height:10%; background-color:white; padding-top:20px;'><form action= change_SQL.php method= 'post'>
<input id='tester' type='text' name='value' value=$current_LED  size='15' >
<input type='hidden' name='unit' value=$unit_id >
<input type='hidden' name='column' value=$column >
<input type= 'submit' name= 'change_but' style='text-align:center;' value='change'></form></div>";

echo "<div style='float:left; width:33%; height:10%; background-color:white; padding-top:20px; color:grey'>" . $row['SENSOR'] . "</div>
<div style='float:left; width:33%; height:10%; background-color:white; padding-top:20px; color:grey'> Temperature: " . $row['TEMP'] . " degrees Celsius</div>";
echo "<div style='float:left; width:33%; height:10%; background-color:white; padding-top:20px; color:grey'> Humidity: " . $row['HUM'] . "% </div>";
echo "<div style='float:left; width:33%; height:10%; background-color:white; padding-top:20px; color:grey'> </div><div style ='float:left; padding-top:50px;'><b style ='font:24px/21px fantasy, tahoma, sans-serif;'>Data Saving Chart</b> <p></p> <h> The table below allows the user to save important data periodically by pressing save.</h></div>";
}
?>

