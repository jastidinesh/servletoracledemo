<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Bank Details</title>

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
          <p class="navbar-brand">Bank Details</p>
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
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<p>
					<h1>Bank Accounts Added</h1>
					</p>
					<table id="mytable" class="table table-bordred table-striped">
						<thead>
							<th>Name</th>
							<th>Account Number</th>
							<th>Added On</th>
						</thead>
						<tbody id="tbody">
							<script type="text/javascript">
		name1 = ${name};
		num 	= ${num};
		created = ${created};
		
		var table = document.getElementById("tbody");
		var i=0;
		while(i<${count})
		{
			var rowcount = table.rows.length;
			var row = table.insertRow(rowcount);
			
			row.insertCell(0).innerHTML = name1[i];
			row.insertCell(1).innerHTML = num[i];
			row.insertCell(2).innerHTML = created[i];
			i++
		}
		
	</script>
							<tr>
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
	<!-- ------------------------------------------------------------------------------------------------------------------------- -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<p>
					<h1>Credit Cards Added</h1>
					</p>
					<table id="mytable" class="table table-bordred table-striped">
						<thead>
							<th>Name</th>
							<th>Account Number</th>
							<th>Added On</th>
							<th>Expiry Date</th>
							<th>Type</th>
						</thead>
						<tbody id="tbody1">
							<script type="text/javascript">
		name2 = ${name1};
		num 	= ${num1};
		type	= ${type};
		exp	= ${exp};
		created = ${created1};
			
		var table = document.getElementById("tbody1");
		var i=0;
		while(i<${count1})
		{
			var rowcount = table.rows.length;
			var row = table.insertRow(rowcount);

			row.insertCell(0).innerHTML = name2[i];
			row.insertCell(1).innerHTML = num[i];
			row.insertCell(2).innerHTML = type[i];
			row.insertCell(2).innerHTML = exp[i];
			row.insertCell(2).innerHTML = created[i];
			i++
		}
		
	</script>
							<tr>
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
	<!-- ------------------------------------------------------------------------------------------------------------------------ -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="table-responsive">
					<p>
					<h1>Add Balance</h1>
					</p>
					<table class="table table-user-information">
						<script type="text/javascript">
      			 	function update_balance()
      			 	{
      			 		bal = document.getElementById("new_bal").value;
      			 		if( bal == "" || bal < 0)
      			 			{
      			 			alert("Balance Can't Be Empty Or Negative");
      			 			}
      			 		else if(${count} ==0 && ${count1} == 0)
      			 			{
      			 			alert("Payment Meathod Not Found");
      			 			}
      			 		else
      			 			{
      			 				document.getElementById("user_update").value = ${user};
      			 				document.getElementById("bala").value = bal;
      			 				document.getElementById("formupdate").submit();
      			 			}
      			 	}
      			 	</script>
						<tbody>
							<tr>
								<td>Current Balance</td>
								<td>${balance}</td>
							</tr>
							<tr>
								<td>New balance</td>
								<td><input type="number" id="new_bal"></td>
							</tr>
							<tr>
								<td>Select Payment</td>
								<td>
									<div class="col-xs-3">
										<select class="form-control col-sm-2" id="select" required>
											<script type="text/javascript">
		      			 	i =0;
		      			 	num3	= ${num};
		      			 	num4	= ${num1};
		      			 	while(i < ${count})
		      			 	{
		      			 		document.write('<option value="' +i+'">' + num3[i] + '</option>');
		    	      		    i++;      			 		
		      			 	}
		      			 	i=0;
		      			 	while(i < ${count1})
		      			 	{
		      			 		document.write('<option value="' +i+${count}+'">' + num4[i] + '</option>');
		    	      		    i++;      			 		
		      			 	}
		      			 </script>
										</select>
									</div>
								</td>
								<td>
									<form action="/heroku-postgres-e55986aa/UpdateBalance" method="post" id="formupdate">
										<input type="hidden" name="user_update" id="user_update"> 
										<input type="hidden" name="bala" id="bala">
										<button type="button" class="btn btn-primary btn-sm"
											onclick="update_balance()">Update Balance</button>
									</form>
								</td>
							</tr>
						</tbody>
					</table>
					</fieldset>
					</form>
				</div>
				<!-- ------------------------------------------------------------------------------------------------------------------------ -->
				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
				<!-- Include all compiled plugins (below), or include individual files as needed -->
				<script src="js/bootstrap.min.js"></script>
				<script
					src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
				<script src="js/resadmin.js"></script>
</body>
</html>