<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>User Credits</title>

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
		document.userscomherf.user.value = ${user};
		document.userscomherf.submit();
	}
	
	function credits_com()
	{
		document.creditscomhref.user.value = ${user};
		document.creditscomhref.submit();
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
          <p class="navbar-brand">User Credits</p>
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
	function update_credit(button_id)
	{
		start = "start"+button_id;
		end = "end"+button_id;
		title = "title"+button_id;
		start_value = document.getElementById(start).value;
		end_value = document.getElementById(end).value;
		title_value = document.getElementById(title).value;
		if(start_value == "" || end_value == "" || title_value.localeCompare("") == 0)
		{
				alert("None Of The Fields Can Be Empty");
		}
		else
		{
				document.creditchartupdate.start.value = start_value;
				document.creditchartupdate.end.value = end_value;
				document.creditchartupdate.title.value = title_value;
				document.creditchartupdate.id.value = button_id;
				document.creditchartupdate.submit();
		}
	}
	
	
</script>
	
	<form name="creditchartupdate" action="/heroku-postgres-e55986aa/CreditChartUpdate" method="post">
		<input type="hidden" name="start">
		<input type="hidden" name="end">
		<input type="hidden" name="title">
		<input type="hidden" name="id">
		<input type="hidden" name="user" value="com_leader">
	</form>	
	
	
   	<div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
        <div class="table-responsive">

    			<p><h1>Credits Chart Table</h1></p>            
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                     <th>Start</th>
                     <th>End</th>
                     <th>Title</th>
                     <th>Update Credits</th>
                   </thead>
    <tbody id="tbody">
	<script>
		
		start = ${start};
		end 	= ${end};
		title = ${title};
			
		var table = document.getElementById("tbody");
		var i=0;
		while(i<${count})
		{
			var rowcount = table.rows.length;
			var row = table.insertRow(rowcount);
			
			row.insertCell(0).innerHTML = '<input type="number" id=start'+i+' value='+start[i]+' maxvalue="9999999999">';
			row.insertCell(1).innerHTML = '<input type="number" id=end'+i+' value='+end[i]+' maxvalue="9999999999">';
			row.insertCell(2).innerHTML = '<input type="text" id=title'+i+' value='+title[i]+'>';
			row.insertCell(3).innerHTML = '<p data-placement="top" data-toggle="tooltip" title="Update"><button class="btn btn-primary btn-sm"  data-toggle="modal" onclick="update_credit(this.id)" id='+i+'>Update</button></p>';
			i++
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
        </div>
	</div>
</div>
</div>

<!-- ---------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
	function update(button_id)
	{
		buy = document.getElementById("buy").value; 
		com = document.getElementById("com").value;
		
		if(buy == "" || res < 0 || com == "" || com < 0)
			{
				alert("The values cannot be empty or negative");
			}
		else
			{
			document.rescredit.buy.value = buy;
			document.rescredit.com.value = com;
			document.rescredit.submit();
			}
		
	}
	
	
</script>
	
	<form name="rescredit" action="/heroku-postgres-e55986aa/ComCreditsUpdate" method="post">
		<input type="hidden" name="buy">
		<input type="hidden" name="com">
		<input type="hidden" name="user" value="com_leader">
	</form>	
	
	
   	<div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
        <div class="table-responsive">

    			<p><h1>Credits Added Per Task</h1></p>            
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                     <th>Add New Comment</th>
                     <th>Buy Or Sell</th>
                     <th>Update Credits</th>
                   </thead>
    <tbody id="tbody1">
	<script>
		
		com 	= ${com};
		buy = ${buy};
			
		var table = document.getElementById("tbody1");
		var rowcount = table.rows.length;
		var row = table.insertRow(rowcount);
		
		row.insertCell(0).innerHTML = '<input type="number" id=res value='+com+' maxvalue="100">';
		row.insertCell(1).innerHTML = '<input type="number" id=rev value='+buy+' maxvalue="100">';
		row.insertCell(2).innerHTML = '<p data-placement="top" data-toggle="tooltip" title="Update"><button class="btn btn-primary btn-sm"  data-toggle="modal" onclick="update()">Update</button></p>';
		
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="js/resadmin.js"></script>
  </body>
</html>