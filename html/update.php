<?php
//this file defines MySQLConnection
include "connectDB.php";

//run different update command based on input button submitted
if(isset($_POST['device1-power']))
{       
    $update = mysqli_query($MySQLConnection,"UPDATE commands SET Command='device1-power',  Board='0', Status='0' WHERE ID = '1'");
}

if(isset($_POST['device1-volup']))
{       
    $update = mysqli_query($MySQLConnection,"UPDATE commands SET Command='device1-volup',  Board='0', Status='0' WHERE ID = '1'");
}

if(isset($_POST['device1-voldown']))
{		
    $update = mysqli_query($MySQLConnection,"UPDATE commands SET Command='device1-voldown',  Board='0', Status='0' WHERE ID = '1'");
}
if(isset($_POST['device1-chup']))
{       
    $update = mysqli_query($MySQLConnection,"UPDATE commands SET Command='device1-chup',  Board='0', Status='0' WHERE ID = '1'");
}
if(isset($_POST['device1-chup']))
{       
    $update = mysqli_query($MySQLConnection,"UPDATE commands SET Command='device1-chdown',  Board='0', Status='0' WHERE ID = '1'");
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