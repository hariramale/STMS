<?php
include ('header.php');
include ('menu.php');
?>
<!-- //market-->
		<div class="market-updates">
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-2">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-eye"> </i>
					</div>
					 <div class="col-md-8 market-update-left">
					 <h5>Open Complains</h5>
					<h4>150</h4>
				  </div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-1">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-users" ></i>
					</div>
					<div class="col-md-8 market-update-left">
					<h5>New Connections</h5>
						<h4>90</h4>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-3">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-usd"></i>
					</div>
					<div class="col-md-8 market-update-left">
						<h5>Solve Complains</h5>
						<h4>70</h4>
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
			<div class="col-md-3 market-update-gd">
				<div class="market-update-block clr-block-4">
					<div class="col-md-4 market-update-right">
						<i class="fa fa-shopping-cart" aria-hidden="true"></i>
					</div>
					<div class="col-md-8 market-update-left">
						<h5 style="color:white;">Done Connections</h5>
						<h4>43</h4>
						
					</div>
				  <div class="clearfix"> </div>
				</div>
			</div>
		   <div class="clearfix"> </div>
		</div>	
		
		<div class="agil-info-calendar">
			<div class="clearfix"> </div>
		</div>
			<!-- Dashboard -->
			<div class="agile-last-grids">
				<div class="col-md-9 agile-last-left agile-last-middle">
					<div class="agile-last-grid">
						<div class="area-grids-heading">
							<h3>Complains and Connections</h3>
						</div>
	<?php
	include ('dbconfig.php');
#$result = mysqli_query($con,"select area as Area, count(*) as complains from tbl_complains where status='open' group by area;");
$result = mysqli_query($con,"call getTicketByArea (1)");

			echo  "<table class='table table-bordered'>
              <tr>
               	 	<th style='width: 10px'>#</th>
                	<th>Area</th>
                	<th>Complain</th>
                	<th style='width: 30px'>Connection</th>
                 	<th style='width: 10px'></th>
                <th>Area</th>
               <th>Complain</th>
               <th style='width: 30px'>Connection</th>
             </tr>";
			  while($row = mysqli_fetch_array($result))
			 
			{
			
               echo "<tr>";
               echo "  <td>if</td>";
               echo " <td>".$row['area']."</td>";
               echo " <td> <a href='index.html'>";
               echo "<span class='badge bg-red'>".$row['number']. "</span></a></td>";
			   echo "  <td><a href='index.html'><span class='badge bg-green'>11</span></a></td>";
				
               echo "  <td>else</td>";
               echo "  <td>".$row['id']."</td>";
               echo "  <td><a href='index.html'>";
               echo" <span class='badge bg-red'>".$row['area']."</span></a></td>";
               echo"  <td><a href='index.html'><span class='badge bg-green'>12</span></a></td>";
               echo "</tr>";
			
		}
             echo "</table>";
             mysqli_close($con);
         	
          ?>
						
					</div>
				</div>
			<div class="col-md-3 agile-last-left agile-last-middle">
					<div class="agile-last-grid">
						<div class="area-grids-heading">
							<h3>Area Status</h3>
						</div>
						<div class=""id=""></div>
						<p style="background-color: #ff8566;"> Maharajgunj-cmts1# 5/0/U5 Area=>Mandikhatar  Down </p>
						<br>
						<p style="background-color: #ff8566;"> Ranibari-cmts1# 8/0/U2 Area=>Raniban  Down </p>
						<br>
						<p style="background-color: #ff8566;"> Satdobato-cmts1# 6/1/U2 Area=>Satdobato Chowk  Down </p>
						<br>
						<p style="background-color: #ff8566;"> Gbaluwatar# lt-0/0 slot  Down </p>
						
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
		
</section>
<?php

include ('footer.php');
?>