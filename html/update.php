<?php
//this file defines MySQLConnection
include "connectDB.php";

$device = $_POST['DeviceID'];
$remotetype = $_POST['remotetype'];

$remotetype = strtolower($remotetype);
if(strcmp($remotetype, "visio") == 0) {
        $board = 3;
}
else if(strcmp($remotetype, "samsung") == 0) {
        $board = 2;
}
else if(strcmp($remotetype, "yamaha") == 0) {
        $board = 1;
}
else {
        $board = 0;
}

//run different update command based on input button submitted
if(isset($_POST['device1-power']))
{
    $update = mysqli_query($MySQLConnection,"UPDATE " . $device . " SET Command='device1-power',  Board='" . $board  . "', Status='0' WHERE ID = '1'");
}

if(isset($_POST['device1-volup']))
{
    $update = mysqli_query($MySQLConnection,"UPDATE " . $device . " SET Command='device1-volup',  Board='" . $board  . "', Status='0' WHERE ID = '1'");
}

if(isset($_POST['device1-voldown']))
{
    $update = mysqli_query($MySQLConnection,"UPDATE " . $device . " SET Command='device1-voldown',  Board='" . $board  .  "', Status='0' WHERE ID = '1'");
}

if(isset($_POST['device1-chup']))
{
    $update = mysqli_query($MySQLConnection,"UPDATE " . $device . " SET Command='device1-chup',  Board='" . $board  .  "', Status='0' WHERE ID = '1'");
}

if(isset($_POST['device1-chdown']))
{
    $update = mysqli_query($MySQLConnection,"UPDATE " . $device . " SET Command='device1-chdown',  Board='" . $board  .  "', Status='0' WHERE ID = '1'");
}


//check if sql update command was successful
 if(!$update)
    {
        echo mysqli_error();
    }
    else
    {
        echo "Records added successfully.";
    }


//close the connection to the sql server
mysqli_close($MySQLConnection);

?>