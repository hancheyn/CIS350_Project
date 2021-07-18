<?php
include "connectDB.php"; // Using database connection file here

if(isset($_POST['device1-voldown']))
{		

    $update = mysqli_query($db,"UPDATE commands SET Command='device1-voldown',  Board='0', Status='0' WHERE ID = '1'");

    if(!$update)
    {
        echo mysqli_error();
    }
    else
    {
        echo "Records added successfully.";
    }
}

mysqli_close($db); // Close connection
?>