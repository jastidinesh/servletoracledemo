<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Add Bank</title>

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

<form name="usersherf" action="/heroku-postgres-e55986aa/ResAdmin" method="post">
		<input type="hidden" name="user">
	</form>

<form name="creditshref" action="/heroku-postgres-e55986aa/ResCredits" method="post">
		<input type="hidden" name="user">
	</form>

<form name="userscomherf" action="/heroku-postgres-e55986aa/ComAdmin" method="post">
		<input type="hidden" name="user">
	</form>

<form name="creditcomshref" action="/heroku-postgres-e55986aa/ComCredits" method="post">
		<input type="hidden" name="user">
	</form>
	
<form name="resshref" action="/heroku-postgres-e55986aa/Select" method="post">
		<input type="hidden" name="user">
	</form>

<form name="comhref" action="/heroku-postgres-e55986aa/Laptops" method="post">
		<input type="hidden" name="user">
	</form>

<form name="myacchref" action="/heroku-postgres-e55986aa/MyAccount" method="post">
		<input type="hidden" name="user1">
	</form>

	
<div class="container-fluid">
    <nav class="navbar navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <p class="navbar-brand">Add Bank</p>
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
<script type="text/javascript">
	function load_user()
	{
		document.getElementById("myform").user.value = ${user};
	}
</script>
<center><font face=verdana color=red><h3 id="demo"></h3></font></center>

<script>
if(${error} == "no")
{
	document.getElementById("demo").innerHTML = "";}
else
	{
	document.getElementById("demo").innerHTML = ${error};
	}
</script>
<div class="container">
  <form class="form-horizontal" id="myform" role="form" action="/heroku-postgres-e55986aa/AddBank" method="post">
  	<input type="hidden" name="user">
  	<input type="hidden" name="flag" value="true">
    <fieldset>
      <legend>Payment</legend>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-holder-name">Account Name</label>
        <div class="col-sm-9">
          <input type="text" class="form-control" name="acc-name" id="card-holder-name" placeholder="Account Holder's Name" required maxlength="16">
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">Account Number</label>
        <div class="col-sm-9">
          <input type="number" class="form-control" name="acc-number" id="card-number" placeholder="Account Number" required max="999999999"/>
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="card-number">Routing Number</label>
        <div class="col-sm-9">
          <input type="number" class="form-control" name="routing-number" id="routing-number" placeholder="Routing Number" required max="999999999"/>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
          <button type="submit" class="btn btn-success" onclick="load_user()">Add</button>
        </div>
      </div>
    </fieldset>
  </form>
</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/resadmin.js"></script>
  </body>
</html>