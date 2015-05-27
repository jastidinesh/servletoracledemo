<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Restaurant Admin</title>

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
		document.usersherf.user.value = ${user1};
		document.usersherf.submit();
	}
	
	function credits()
	{
		document.creditshref.user.value = ${user1};
		document.creditshref.submit();
	}
	
	function users_com()
	{
		document.userscomherf.user.value = ${user1};
		document.userscomherf.submit();
	}
	
	function credits_com()
	{
		document.creditscomhref.user.value = ${user1};
		document.creditscomhref.submit();
	}
	
	function restaurants()
	{
		document.resshref.user.value = ${user1};
		document.resshref.submit();
	}
	
	function laptops()
	{
		document.comhref.user.value = ${user1};
		document.comhref.submit();
	}
	
	function myaccount()
	{
		document.myacchref.user1.value = ${user1};
		document.myacchref.submit();
	}
	
	function logout()
	{
		window.location="index.jsp";
	}
	

</script>

<form name="usersherf" action="/ResAdmin" method="post">
		<input type="hidden" name="user">
	</form>

<form name="creditshref" action="/ResCredits" method="post">
		<input type="hidden" name="user">
	</form>

<form name="userscomherf" action="/ComAdmin" method="post">
		<input type="hidden" name="user">
	</form>

<form name="creditcomshref" action="/ComCredits" method="post">
		<input type="hidden" name="user">
	</form>
	
<form name="resshref" action="/Select" method="post">
		<input type="hidden" name="user">
	</form>

<form name="comhref" action="/Laptops" method="post">
		<input type="hidden" name="user">
	</form>

<form name="myacchref" action="/MyAccount" method="post">
		<input type="hidden" name="user1">
	</form>

	
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <p class="navbar-brand">Restaurant Admin</p>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse-3">
          <ul class="nav navbar-nav navbar-right">
          <script>
          		if(${user1}.localeCompare('res_leader') == 0)
          			{
          				document.write('<li><a href="javascript:users()">Users</a></li>'+
          						'<li><a href="javascript:credits()">Credits</a></li>'+
          						'<li><a href="javascript:restaurants()">Restaurants</a></li>'+
          						'<li><a href="javascript:laptops()">Laptops</a></li>'+
          						'<li><a href="javascript:myaccount()">My Account</a></li>'+
          						'<li><a href="javascript:logout()">Logout</a></li>');
          			}
          		else if(${user1}.localeCompare('com_leader') == 0)
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
<script type="text/javascript">
	function update(button_id)
	{
		text = "input"+button_id;
		value = document.getElementById(text).value;
		user = ${user}[button_id];
		document.submitcredit.credit.value = value;
		document.submitcredit.user.value = user;
		document.submitcredit.submit();
	}
	
	function delete_user(id)
	{
	    if (confirm("Are You Sure You Want To Delete The Record") == true) {
			user = ${user}[id];
			document.deleteuser.user.value = user;
			document.deleteuser.submit();
	    } else {
	        return;
	    }
	}
</script>
	
	
	<form name="deleteuser" action="/DeleteUser" method="post">
		<input type="hidden" name="user">
		<input type="hidden" name="user1" value="res_leader">
	</form>
	
	<form name="submitcredit" action="/UpdateCredit" method="post">
		<input type="hidden" name="credit">
		<input type="hidden" name="user">
		<input type="hidden" name="user1" value="res_leader">
	</form>	
   	<div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                     <th>User Name</th>
                     <th>Credits</th>
                     <th>Title</th>
                     <th>Spam Count</th>
                     <th>Update Credits</th>
                     <th>Delete</th>
                   </thead>
    <tbody id="tbody">
	<script>
		
		usernames = ${user};
		credit 	= ${credit};
		title = ${title};
		spam = ${spam};
		
		var table = document.getElementById("tbody");
		for(i=0;i<${count};i++)
		{
			var rowcount = table.rows.length;
			var row = table.insertRow(rowcount);
			
			row.insertCell(0).innerHTML = usernames[i];
			row.insertCell(1).innerHTML = '<input type="number" id=input'+i+' value='+credit[i]+' maxvalue="9999999999">';
			row.insertCell(2).innerHTML = title[i];
			row.insertCell(3).innerHTML = spam[i];
			row.insertCell(4).innerHTML = '<p data-placement="top" data-toggle="tooltip" title="Update"><button class="btn btn-primary btn-sm"  data-toggle="modal" onclick="update(this.id)" id='+i+'>Update</button></p>';
			row.insertCell(5).innerHTML = '<p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" onclick="delete_user(this.id)" id='+i+'><span class="glyphicon glyphicon-trash"></span></button></p>';
			
		}
		
	</script>    
    <tr>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/resadmin.js"></script>
  </body>
</html>