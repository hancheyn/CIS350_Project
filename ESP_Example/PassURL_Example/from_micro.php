<?php

//http://chartingprofits.com/micro/from_micro.php?unit=1&sensor=123

//loop through and grab variables off the URL
foreach($_REQUEST as $key => $value)
{
if($key =="unit"){
$unit = $value;
}

if($key =="sensor"){
$sensor = $value;
}

if($key =="temp"){
$temp = $value;
}

if($key =="hum"){
$hum = $value;
}
}//for each


// Create connection to SQL database
$con=mysqli_connect("localhost","charting_userESP","Nietzsche1","charting_ESP32");// server, user, pass, database

// Check connection
if (mysqli_connect_errno()) {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
//update sensor value in database
mysqli_query($con,"UPDATE ESPtable SET SENSOR = $sensor
WHERE id=$unit");
mysqli_query($con,"UPDATE ESPtable SET TEMP = $temp
WHERE id=$unit");
mysqli_query($con,"UPDATE ESPtable SET HUM = $hum
WHERE id=$unit");
mysqli_query($con,"UPDATE ESPsave SET TEMP = $temp
WHERE id=$unit");
mysqli_query($con,"UPDATE ESPsave SET HUM = $hum
WHERE id=$unit");
mysqli_query($con,"UPDATE ESPsave SET LED = $sensor
WHERE id=$unit");


//if we need to get the time from the internet, use this.  This sets teh timezone
date_default_timezone_set('America/New_York');
$t1 = date("gi");//many different possible formats, but this gives 12 hr format, and returns 1:23 as 123

//pull out the table
$result = mysqli_query($con,"SELECT * FROM ESPtable");//table select

//loop through the table and filter out data for this unit id
while($row = mysqli_fetch_array($result)) {
if($row['id'] == $unit){
$d1 = $row['LED'];
$d2 = $row['SENSOR'];
$d3 = $row['TEMP'];
$d3 = $row['HUM'];
echo "_t1$t1##_d1$d1##_d2$d2##_d3$d3##";
}
}

//if($sensor > 8) {//send alarm as text message using email function
//mail("nathan.g.hanchey@outlook.com", "ALARM", "Sensor=$sensor", "Unit=$unit");
//}

?>