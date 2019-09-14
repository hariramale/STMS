<?php
include ('header.php');
include ('menu.php');
?>
<div class="table-agile-info">
  <div class="panel panel-default">
    <div class="panel-heading">
      Complains of Chundevi Area
    </div>
    <div class="row w3-res-tb">
      <div class="col-sm-5 m-b-xs">             
      </div>
      <div class="col-sm-4">
      </div>
      <div class="col-sm-3">
        <div class="input-group">
          <input type="text" class="input-sm form-control" placeholder="Search">
          <span class="input-group-btn">
            <button class="btn btn-sm btn-default" type="button">Go!</button>
          </span>
        </div>
      </div>
    </div>
    <div class="table-responsive">
      <table class="table table-striped b-t b-light">
        <thead>
          <tr>
            
            <th style="color: blue;">Name</th>
            <th style="color: blue;">Username</th>
            <th style="color: blue;">Address</th>
            <th style="color: blue;">Problem</th>
            <th style="color: blue;">Service</th>
            <th style="color: blue;">Action</th>
            <th style="width:30px; color: blue;"></th> 
          </tr>
        </thead>
        <tbody>
<?php
			include ('dbconfig.php');
				$result = mysqli_query($con,"select name,username,address,problem,service from tbl_complains where status='open'");

 				while($row = mysqli_fetch_array($result))
			{ 
		  echo "<tr>";
          echo "<td>".$row['name']."</td>";
          echo "<td>".$row['username']."</td>";
          echo "<td>".$row['address']."</td>";
          echo "<td>".$row['problem']."</td>";
          echo "<td>".$row['service']."</td>";
          echo "<td>";
          echo "<button class='btn-sm btn-warning'> Details</button>";
          echo "<button class='btn-sm btn-success'> Update</button>";
          echo "</td>";
          echo "</tr>";
            }
				mysqli_close($con);
?>
        </tbody>
      </table>
    </div>
    <footer class="panel-footer">
      <div class="row">
        
        <div class="col-sm-5 text-center">
          <small class="text-muted inline m-t-sm m-b-sm">showing 20-30 of 50 data</small>
        </div>
        <div class="col-sm-7 text-right text-center-xs">                
          <ul class="pagination pagination-sm m-t-none m-b-none">
            <li><a href=""><i class="fa fa-chevron-left"></i></a></li>
            <li><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href=""><i class="fa fa-chevron-right"></i></a></li>
          </ul>
        </div>
      </div>
    </footer>
  </div>
</div>


</section>
<?php
include ('footer.php');
?>