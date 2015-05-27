<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>My Account</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/navbar.css" rel="stylesheet">
    <link href="css/myaccount.css" rel="stylesheet"> 
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
		document.usersherf.user.value = ${user1};
		document.usersherf.submit();
	}
	
	function credits_com()
	{
		document.creditshref.user.value = ${user1};
		document.creditshref.submit();
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
          <p class="navbar-brand">My Account</p>
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
<div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">
       <br>
      </div>
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">${user1}</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class=" col-md-9 col-lg-9 ">
                 <script type="text/javascript">
						function add_bank()
						{
							document.getElementById("fab").user.value = ${user1};
							document.getElementById("fab").submit();
						}
						function add_card()
						{
							document.getElementById("fac").user.value = ${user1};
							document.getElementById("fac").submit();
						}
						function view_bank()
						{
							document.getElementById("fvb").user.value = ${user1};
							document.getElementById("fvb").submit();
						}
				  </script> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>User Name</td>
                        <td>${user1}</td>
                      </tr>
                      <tr>
                        <td>Created On</td>
                        <td>${created}</td>
                      </tr>
                      <tr>
                        <td>First Name</td>
                        <td>${fname}</td>
                      </tr>
					  <tr>
                        <td>Last Name</td>
                        <td>${lname}</td>
                      </tr>
                        <tr>
                        <td>Email Address</td>
                        <td>${email}</td>
                      </tr>
                      <tr>
                        <td>Title</td>
                        <td>${title}</td>
                      </tr>
                      <tr>
                        <td>Credits</td>
                        <td>${credit}</td>
                      </tr>
                      <tr>
                        <td>Spam Count</td>
                        <td>${spam}</td>
                      </tr>
                      <tr>
                      <td>
	                      <form action="/heroku-postgres-e55986aa/Bank" method ="post" id="fvb">
	                      	<input type="hidden" name="user">
		                  	<button type="button" class="btn btn-primary btn-sm" onclick="view_bank()">Bank Details</button>
		                  </form>
	                  </td>
	                  <td>
		                  <form action="/heroku-postgres-e55986aa/AddBank" method ="post" id="fab">
		                  	<input type="hidden" name="user">
		                  	<input type="hidden" name="flag" value="false">
		                  	<button type="button" class="btn btn-primary btn-sm" onclick="add_bank()">Add Bank</button>
		                  </form>
	                  </td>
	                  <td>
		                  <form action="/heroku-postgres-e55986aa/AddCard" method ="post" id="fac">
		                  	<input type="hidden" name="user">
		                  	<input type="hidden" name="flag" value="false">
		                  	<button type="button" class="btn btn-primary btn-sm" onclick="add_card()">Add Credit</button>
		                  </form>
	                  </td>
	                  </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/resadmin.js"></script>
    <script src="js/myaccount.js"></script>
  </body>
</html>