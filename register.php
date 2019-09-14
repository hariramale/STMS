<?php
$name = filter_input(INPUT_POST, 'txtcname');
 $username = filter_input(INPUT_POST, 'txtcusername');
 $contact = filter_input(INPUT_POST, 'txtcontact');
 $address = filter_input(INPUT_POST, 'txtaddress');
 $problem = "6";
 $area = "4";
 $remarks = $_POST['txtremarks'];
 $service = "2";
 $status = "1";
 $notedby = "1";
 #$problem = filter_input(INPUT_POST, 'optproblem');
 #$area =filter_input(INPUT_POST,'optarea');
echo "your name is ".$name;
echo "Selected Area is ".$area ."<br> </br>";

print_r($_POST);
include ('dbconfig.php');

#$sql = "call addComplain('$name','$username','$contact','$address','$area','$problem','$service','$status','$remarks','$notedby')";
$sql = "call addComplain ('$name', '$username','$contact','$address','$area','$problem','$service','$status','$remarks','$notedby')";

if (mysqli_query($con, $sql)) {
    echo "New record created successfully";

} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($con);
}



?>