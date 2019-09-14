
<?php
$name = filter_input(INPUT_POST, 'txtcname');
 $username = filter_input(INPUT_POST, 'txtcusername');
 $contact = filter_input(INPUT_POST, 'txtcontact');
 $address = filter_input(INPUT_POST, 'txtaddress');
 $problem = filter_input(INPUT_POST, 'optproblem');
 $area = filter_input(INPUT_POST, 'optarea');
 $remarks = filter_input(INPUT_POST, 'txtremark');
 $service = filter_input(INPUT_POST, 'optservice');
 $status = filter_input(INPUT_POST, 'optstatus');
 $notedby = "1";
 $_session ["success_msg"]="";
 $_session ["error_msg"]="";
include ('dbconfig.php');
$sql = "
call addClient ('$name', '$username','$contact','$address');
call addTicket ((select id from tbl_clients where username='$username'),'$problem','$area','$service','$notedby','$status');
";
if (mysqli_query($con, $sql)) {

    $_session ["success_msg"]="New complain has been successfully registered";
     $_session ["success_msg"]="";

} else {
    #echo "Error: " . $sql . "<br>" . mysqli_error($con);
    $_session ["error_msg"]="Complain can't be registered!!!!, Something went wrong ";
    $_session ["error_msg"]="";

}

?>