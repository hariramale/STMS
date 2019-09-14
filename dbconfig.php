<?php
$db_server ='127.0.0.1';
$db_username='root';
$db_password='root3312';
$database='SajiloDB';
$con=mysqli_connect($db_server,$db_username,$db_password,$database);
// Check connection
if (mysqli_connect_errno())
{
echo "Failed to connect database " . mysqli_connect_error();
}
?>