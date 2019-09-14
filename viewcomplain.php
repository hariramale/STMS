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
				$result = mysqli_query($con,"call getOpenTicket");

 				while($row = mysqli_fetch_array($result))
			{ 
		  echo "<tr>";
          echo "<td>".$row['name']."</td>";
          echo "<td>".$row['username']."</td>";
          echo "<td>".$row['address']."</td>";
          echo "<td>".$row['problem']."</td>";
          echo "<td>".$row['service']."</td>";
          echo "<td>";
          echo "<button class='btn-sm btn-warning' data-toggle='modal' data-target='#clientdetail'> Details </button>";
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

<!-- The Modal -->
<div class="modal" id="clientdetail" " >
  <div class="modal-dialog"  >
    <div class="modal-content" style="width:800px;">
      <!-- Modal Header -->
      <div class="modal-header" >
        <h4 class="modal-title">Client Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <!-- Modal body -->
      <div class="modal-body">
        <table class="table">
        <tr>
          <th> Name</th>
          <th> Username </th>
          <th> Phone </th>
          <th> Address </th>
          </tr>
          <tr>
            <td> Hariram Ale Magar </td>
            <td> hariram_subisu </td>
            <td> 9801158296 </td>
            <td> Mandikhatar</td>
                    </tr>
        </table>
        <div class="jumbotron1">
        <p>Additinal Information </p>
        <hr/>
        <p style="color:blue;"> Service <small style="color:gray;">Cable Modem </small> Problem Domain <small style="color:gray;"> Cable Blink </small> </p>  
        <h4 class="page-header" style="color:green">Remarks</h4>
        <section class="comment-list">
          <article class="row">
           
            <div class="col-md-10 col-sm-10">
              <div class="panel panel-default arrow left">
                <div class="panel-body">
                  <header class="text-left" style="color:green;">
                    <div class="comment-user"><i class="fa fa-user"></i> Akash Dahal</div>
                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> 18:08:12 Jul 18, 2019</time>
                  </header>
                  <div class="comment-post">
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </article>
          <article class="row">
           
            <div class="col-md-10 col-sm-10">
              <div class="panel panel-default arrow left">
                <div class="panel-body">
                  <header class="text-left" style="color:green;">
                    <div class="comment-user"><i class="fa fa-user"></i> Hariram Ale</div>
                    <time class="comment-date" datetime="16-12-2014 01:05"><i class="fa fa-clock-o"></i> 19:30:44 Jul 18, 2019</time>
                  </header>
                  <div class="comment-post">
                    <p>
                      Complain has been already forwared and resolved by the technician, Extra wire has been used for this customer....
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </article>
          <input type="text" class="form-control col-sm-12" id="txtcomment" name="txtcomment" placeholder="Type Remakrs">  <input type="hidden" class="clear-fix">
          <br/>
          <br/>
          <input Type="submit" class="btn btn-primary " name="btnupdate" value="Update">
          
          </section>

</div>
        </div>

      </div>

    </div>
  </div>
</div>


</section>
<?php
include ('footer.php');
?>