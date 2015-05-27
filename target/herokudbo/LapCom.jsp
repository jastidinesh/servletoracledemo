<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Laptop Comments</title>

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
          <p class="navbar-brand">Laptop Comments</p>
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
      <%
	String user = request.getParameter("user");
	if(user == null){
		{
			String site = new String("/DBO/Login");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		}
	}%>
<!-- ---------------------------------------------------------------------------------------------------------------- -->
   	<div class="container">
		<div class="row">
    	    <div class="col-md-12">
        		<div class="table-responsive">
        		<p>
				<h1>Comment Details</h1>
				</p>
	              <table id="mytable" class="table table-bordred table-striped">
                   <thead>
                     <th>Author</th>
                     <th>Avg Rating</th>
                     <th>Comment</th>
                     <th>Type</th>
                     <th>Brand</th>
                     <th>Created</th>
                     <th>Rating</th>
                     <th>Spam</th>
                   </thead>
			      <tbody id="tbody">
				  <script type="text/javascript">
				  		function spam_add()
				  		{
				  			document.getElementById("spam").user.value = ${user};
				  			document.getElementById("spam").com_id.value = ${com_id};
				  			document.getElementById("spam").submit();
				  		}
				  		function add_rating()
						  {
							  document.getElementById("rating").user.value = ${user};
							  document.getElementById("rating").com_id.value = ${com_id};
						  }
						var table = document.getElementById("tbody");
						var rowcount = table.rows.length;
						var row = table.insertRow(rowcount);
						row.insertCell(0).innerHTML = ${author};
						row.insertCell(1).innerHTML = ${avg_rating};
						row.insertCell(2).innerHTML = ${content};
						row.insertCell(3).innerHTML = ${type};
						row.insertCell(4).innerHTML = ${brand};
						row.insertCell(5).innerHTML = ${created};
						row.insertCell(6).innerHTML = '<form id="rating" method="post" action="/DBO/ComRate">'+
						'<input type="number" min=0 max=5 name="rate" required value='+${rating}+'>/5'+
						'<button type="submit" class="btn btn-success btn-xs" onclick="add_rating()"><span class="glyphicon glyphicon-ok-sign"></span></button>'+
						'<input type="hidden" name="user">'+
						'<input type="hidden" name="com_id">'+
						'</form>';
						if(${spam})
							row.insertCell(7).innerHTML = '<form id="spam" method="post" action="/DBO/AddCommSpam">'+
														'<span class="glyphicon glyphicon-flag" style="color:red" onclick="spam_add()"></span>'+
														'<input type="hidden" name="user">'+
														'<input type="hidden" name="com_id">'+
														'</form>';
						else
							row.insertCell(7).innerHTML = '<form id="spam" method="post" action="/DBO/AddCommSpam">'+
														'<span class="glyphicon glyphicon-flag" onclick="spam_add()"></span>'+
														'<input type="hidden" name="user">'+
														'<input type="hidden" name="com_id">'+
														'</form>';
					</script>    
				    <tr>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    <td>&nbsp;</td>
				    </tr>
		    	</tbody>
			</table>            
		</div>
	</div>
</div>
</div>
<!-- --------------------------------------------------------------------------------------------------------------------- -->      
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Login.js"></script>
  </body>
</html>