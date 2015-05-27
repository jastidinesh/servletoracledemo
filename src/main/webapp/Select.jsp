<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Restaurants List</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet"> 
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
<!-- ------------------------------------Header----------------------------------------------------------------------- -->

<script type="text/javascript">

	function users()
	{
		document.usersherf.user.value = ${user};
		document.usersherf.submit();
	}
	
	function credits()
	{
		document.creditshref.user.value = ${user};
		document.creditshref.submit();
	}
	
	function users_com()
	{
		document.usersherf.user.value = ${user};
		document.usersherf.submit();
	}
	
	function credits_com()
	{
		document.creditshref.user.value = ${user};
		document.creditshref.submit();
	}
	
	function restaurants()
	{
		document.resshref.user.value = ${user};
		document.resshref.submit();
	}
	
	function laptops()
	{
		document.comhref.user.value = ${user};
		document.comhref.submit();
	}
	
	function myaccount()
	{
		document.myacchref.user1.value = ${user};
		document.myacchref.submit();
	}
	
	function logout()
	{
		window.location="index.jsp";
	}
	

</script>

<form name="usersherf" action="/DBO/ResAdmin" method="post">
		<input type="hidden" name="user">
	</form>

<form name="creditshref" action="/DBO/ResCredits" method="post">
		<input type="hidden" name="user">
	</form>

<form name="userscomherf" action="/DBO/ComAdmin" method="post">
		<input type="hidden" name="user">
	</form>

<form name="creditcomshref" action="/DBO/ComCredits" method="post">
		<input type="hidden" name="user">
	</form>
	
<form name="resshref" action="/DBO/Select" method="post">
		<input type="hidden" name="user">
	</form>

<form name="comhref" action="/DBO/Laptops" method="post">
		<input type="hidden" name="user">
	</form>

<form name="myacchref" action="/DBO/MyAccount" method="post">
		<input type="hidden" name="user1">
	</form>

	
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <p class="navbar-brand">Restaurants</p>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-3">
          <ul class="nav navbar-nav navbar-right">
          <script>
          		if(${user}.localeCompare('res_leader') == 0)
          			{
          				document.write('<li><a href="javascript:users()">Users</a></li>'+
          						'<li><a href="javascript:credits()">Credits</a></li>'+
          						'<li><a href="javascript:restaurants()">Restaurants</a></li>'+
          						'<li><a href="javascript:laptops()">Laptops</a></li>'+
          						'<li><a href="javascript:myaccount()">My Account</a></li>'+
          						'<li><a href="javascript:logout()">Logout</a></li>');
          			}
          		else if(${user}.localeCompare('com_leader') == 0)
          			{
      				document.write('<li><a href="javascript:users_com()">Users</a></li>'+
      						'<li><a href="javascript:credits_com()">Credits</a></li>'+
      						'<li><a href="javascript:restaurants()">Restaurants</a></li>'+
      						'<li><a href="javascript:laptops()">Laptops</a></li>'+
      						'<li><a href="javascript:myaccount()">My Account</a></li>'+
      						'<li><a href="javascript:logout()">Logout</a></li>');
          			
          			}
          				
          		else
          		{
      				document.write('<li><a href="javascript:restaurants()">Restaurants</a></li>'+
      						'<li><a href="javascript:laptops()">Laptops</a></li>'+
      						'<li><a href="javascript:myaccount()">My Account</a></li>'+
      						'<li><a href="javascript:logout()">Logout</a></li>');
      			}
          	</script><!-- 
            <li><a href="javascript:users()">Users</a></li>
            <li><a href="javascript:credits()">Credits</a></li>
            <li><a href="javascript:restaurants()">Restaurants</a></li>
            <li><a href="javascript:laptops()">Laptops</a></li>
            <li><a href="javascript:myaccount()">My Account</a></li>  -->
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
</div><!-- /.container-fluid -->

<!-- ----------------------------------------------------------------------------------------------------------------- --> 
      <div class="container">
      <%
	String user = request.getParameter("user");
	if(user == null){
		{
			String site = new String("/DBO/Login");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		}
	}%>
		
		<div class="col-md-4">
		<p data-placement="top" data-toggle="tooltip" title="AddRes"><button class="btn btn-danger btn-xs" data-title="AddRes" data-toggle="modal" data-target="#addres" ><span class="glyphicon glyphicon-plus"> Add Restaurant</span></button></p>
		</div>
		<input name="user" type="hidden">
      </div>
   	<div class="container">
		<div class="row">
    	    <div class="col-md-12">
        		<div class="table-responsive">
	              <table id="mytable" class="table table-bordred table-striped">
                   <thead>
                     <th>#</th>
                     <th>Added By</th>
                     <th>Name</th>
                     <th>Created</th>
                   </thead>
			      <tbody id="tbody">
				  <script type="text/javascript">
					  function view_res(obj)
					  	{
						  document.getElementById("get_rev").user.value = ${user};
						  document.getElementById("get_rev").res_id.value = obj;
						  document.getElementById("get_rev").submit();
					  	}
						id1 = ${id};
						author	= ${author};
						name1 = ${name};
						created = ${created};
						var table = document.getElementById("tbody");
						for(i=0;i<${count};i++)
						{
							var rowcount = table.rows.length;
							var row = table.insertRow(rowcount);
							row.insertCell(0).innerHTML = i+1;
							row.insertCell(1).innerHTML = author[i];
							row.insertCell(2).innerHTML = '<a href="javascript:view_res('+id1[i]+')">'+name1[i]+'</a>';
							row.insertCell(3).innerHTML = created[i];
						}
					</script>    
				    <tr>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    </tr>
		    	</tbody>
			</table>
			<form action="/DBO/Review" method="post" id="get_rev">
				<input type="hidden" name="user">
				 <input type="hidden" name="res_id">
			</form>            
		</div>
	</div>
</div>
</div>
<!-- --------------------------------------------------------------------------------------------------------------------- -->      
      <div class="modal fade" id="addres" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      	<div class="modal-dialog">
    	<div class="modal-content">
          <div class="modal-header">
        	<h4 class="modal-title custom_align" id="Heading">Adding Restaurant</h4>
      	  </div>
       <div class="modal-body">
       <form method="post" id="myform" action="/DBO/AddRes">
       <textarea rows="1" cols="70" placeholder="Enter Restaurant Name" maxlength="70" name="res_name" required></textarea>
       <textarea rows="2" cols="70" placeholder="Enter Restaurant Location" maxlength="140" name="res_loc" required></textarea>
       <textarea rows="5" cols="70" placeholder="Enter Restaurant Description" maxlength="350" name="res_des" required></textarea>
      </div>
        <div class="modal-footer ">
        <script type="text/javascript">
	      	function add_res()
	      	{
	      		document.getElementById("myform").user.value = ${user};
	      	}
	     </script>
	     <input type="hidden" name=user>
        <button type="submit" class="btn btn-success" onClick="add_res()" value="Add To Restaurants"><span class="glyphicon glyphicon-ok-sign"></span></button>
      </div>
        </div>
        </form>
	    <!-- /.modal-content --> 
	  </div>
	  </div>
	  
<!-- ------------------------------------------------------------------------------------------------------------------------ -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Login.js"></script>
  </body>
</html>