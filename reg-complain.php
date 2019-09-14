
<?php
include ('header.php');
include ('menu.php');
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
 if (isset($_POST["txtcname"]))
 {
    

    $sql = "call addClient ('$name', '$username','$contact','$address')";
    $sql2 = "call addTicket ('$username','$problem','$area','$service','$notedby','$status')";
    $data = mysqli_query($con,$sql);
    if($data)
    {
       $data2 = mysqli_query($con,$sql2);
       $_session ["success_msg"]="New Ticket of user " .$username. " has been created successfully";
       
    }
    else
    $_session ["error_msg"]=" Something went wrong ";

 }


?>
<div class="form-w3layouts">
                    <?php 
                        if ($_session['error_msg'] !="")
                        {
                            echo "<div class='alert alert-warning' role='alert'>". $_session['error_msg']. "</div>";
                            $_session ["error_msg"]="";
                        }
                        elseif($_session['success_msg'] !="")
                        {
                            echo "<div class='alert alert-success' role='alert'>".$_session['success_msg']."</div>";
                            $_session ["success_msg"]="";

                        } 
                        else{

                        }                 
                     ?>


        <!-- page start-->
        <div class="row">
            <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            New Complain Registration
                        </header>
                        <div class="panel-body">
                            <div class="position-left">
                                <form  id="addcomplain" name="addcomplain" method="post" action ="reg-complain.php">
								<div class="row">
								<div class="col-md-6 form-group">
								<label for="txtcname">Customer Name:</label>
                                <input type="text" class="form-control" id="txtcname" name="txtcname"placeholder="Enter  name"> 
                            </div>
							<div class="col-md-6 form-group">
								<label for="txtcusername">Username:</label>
                                <input type="text" class="form-control" id="txtcusername" name="txtcusername" placeholder="Enter  username"> 
                            </div>
							
							<div class="col-md-6 form-group">
								
                               <label for="txtcname">Contact Number:</label> 
							   <input type="text" class="form-control" id="txtcontact" name= "txtcontact" placeholder="Enter contact number"> 
                            </div>
							<div class="col-md-6 form-group">
								<label for="txtcname">Address:</label>
                                <input type="text" class="form-control" id="txtaddress" name="txtaddress" placeholder="Enter Address"> 
                            </div>
							<div class="col-md-3 form-group">
								
                               <label for="txtcname">Problem Domain:</label> 
							   <select class="form-control m-bot15" id="optproblem" name="optproblem">
							   	<?php 
                               	$sql = mysqli_query($con, "SELECT id,problem From tbl_problemdomain order by problem asc");
									$row = mysqli_num_rows($sql);
										while ($row = mysqli_fetch_array($sql)){
                                echo "<option value=".$row['id'].">".$row['problem']."</option>";
                                }
                                #mysqli_close($con);
                                ?>
                            </select>
                            </div>
							<div class="col-md-3 form-group">
								<label for="txtcname">Area:</label>
                               <select class="form-control m-bot15" name="optarea">
                               	<?php 
                               	$sql = mysqli_query($con, "SELECT id,area From tbl_area order by area asc");
									$row = mysqli_num_rows($sql);
										while ($row = mysqli_fetch_array($sql)){
										echo 	"<option value=".$row['id'].">".$row['area']."</option>";

										}
										
                               

                               	?>
                              
                            </select>
                            </div>
							<div class="col-md-3 form-group">
								
                               <label for="txtcname">Service:</label> 
							   <select class="form-control m-bot15" name="optservice">
                               <?php 
                               	$sql = mysqli_query($con, "SELECT id,service From tbl_service order by service asc");
									$row = mysqli_num_rows($sql);
										while ($row = mysqli_fetch_array($sql)){
										echo 	"<option value=".$row['id'].">".$row['service']."</option>";

										}

                               	?>
                            </select> 
							</div>
							<div class="col-md-3 form-group">
								<label for="txtcname">Status:</label>
                              <select class="form-control m-bot15" name="optstatus">
                              <?php 
                               	$sql = mysqli_query($con, "SELECT id,status From tbl_status");
									$row = mysqli_num_rows($sql);
										while ($row = mysqli_fetch_array($sql)){
										echo 	"<option value=".$row['id'].">".$row['status']."</option>";

										}
										

                               	?>
                                
                            </select> 
                            </div>
							<div class="col-md-8 form-group">
								
                               <label for="txtcname">Remarks:</label> 
                               <textarea class="form-control" id="txtremark" name="txtremark" rows="3" placeholder="Remarks..."></textarea>
                               
                            </select> 
                            </div>
                            </div>
                            <button type="reset" class="btn btn-danger" id="bnt_reg"><i class="fa fa-plus-square"></i>Reset</button>
                                <button type="submit" class="btn btn-info" id="bnt_reg" name="btn_reg"><i class="fa fa-plus-square"></i>Register</button>
								
                            </form>
                            </div>

                        </div>
                    </section>

            </div>
            
        </div>
        <div class="row">
        <div class="col-lg-12">

        </div>
        </div>


        <!-- page end-->
        </div>
		
</section>
<script>
function submit() {
  /*Put all the data posting code here*/
 document.getElementById("addcomplain").reset();
}
</script>
<?php

include ('footer.php');
?>