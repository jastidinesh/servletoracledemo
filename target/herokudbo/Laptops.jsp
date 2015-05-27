<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Laptops Comments</title>

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
			String site = new String("/heroku-postgres-e55986aa/Login");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		}
	}%>
		<div class="container">
		<div class="col-md-4">
		<p data-placement="top" data-toggle="tooltip" title="AddRes"><button class="btn btn-danger btn-xs" data-title="AddRes" data-toggle="modal" data-target="#addcom" ><span class="glyphicon glyphicon-plus"> Add Comment</span></button></p>
		<script type="text/javascript">
		function brand_change()
		{
			document.getElementById("form_brand").brand.value =document.getElementById("brand").value;
			document.getElementById("form_brand").user.value = ${user};
			document.getElementById("form_brand").submit();
		}
		
		function type_change()
		{
			document.getElementById("form_type").type.value =document.getElementById("type").value;
			document.getElementById("form_type").user.value = ${user};
			document.getElementById("form_type").submit();
		}
		</script>
		<select class="form-control col-sm-2" name="brand" id="brand" required onchange="brand_change()">
				<option selected>Brand</option>
                <option value="Lenovo">Lenovo</option>
                <option value="Dell">Dell</option>
                <option value="MSI">MSI</option>
                <option value="HP">HP</option>
                <option value="Toshiba">Toshiba</option>
                <option value="Apple">Apple</option>
                <option value="ASUS">ASUS</option>
                <option value="Acer">Acer</option>
                <option value="Other">Other</option>
         </select>
         <select class="form-control col-sm-2" name="type" id="type" required onchange="type_change()">
                <option selected>Type</option>
                <option value="Reviews">Reviews</option>
                <option value="Help">Help</option>
                <option value="Trade">Trade</option>
         </select>
		</div>
		<input name="user" type="hidden">
      </div>
      <form action="/heroku-postgres-e55986aa/BrandChange" method="post" id="form_brand">
      <input type="hidden" name="brand">
      <input type="hidden" name="user">
      </form>
      <form action="/heroku-postgres-e55986aa/TypeChange" method="post" id="form_type">
      <input type="hidden" name="type">
      <input type="hidden" name="user">
      </form>
   	<div class="container">
		<div class="row">
    	    <div class="col-md-12">
        		<div class="table-responsive">
	              <table id="mytable" class="table table-bordred table-striped">
                   <thead>
                     <th>#</th>
                     <th>Added By</th>
                     <th>Comment</th>
                     <th>Brand</th>
                     <th>Type</th>
                     <th>Created</th>
                   </thead>
			      <tbody id="tbody">
				  <script type="text/javascript">
					  function view_com(obj)
					  	{
						  document.getElementById("get_com").user.value = ${user};
						  document.getElementById("get_com").com_id.value = obj;
						  document.getElementById("get_com").submit();
					  	}
						id1 = ${id};
						author	= ${author};
						type = ${type};
						brand = ${brand};
						content = ${content};
						created = ${created};
						var table = document.getElementById("tbody");
						for(i=0;i<${count};i++)
						{
							var rowcount = table.rows.length;
							var row = table.insertRow(rowcount);
							row.insertCell(0).innerHTML = i+1;
							row.insertCell(1).innerHTML = author[i];
							row.insertCell(2).innerHTML = '<a href="javascript:view_com('+id1[i]+')">'+content[i].substring(0,10)+'</a>';
							row.insertCell(3).innerHTML = brand[i];
							row.insertCell(4).innerHTML = type[i];
							row.insertCell(5).innerHTML = created[i];
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
			<form action="/heroku-postgres-e55986aa/LapCom" method="post" id="get_com">
				<input type="hidden" name="user">
				 <input type="hidden" name="com_id">
			</form>            
		</div>
	</div>
</div>
</div>
<!-- --------------------------------------------------------------------------------------------------------------------- -->      
      <div class="modal fade" id="addcom" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      	<div class="modal-dialog">
    	<div class="modal-content">
          <div class="modal-header">
        	<h4 class="modal-title custom_align" id="Heading">Adding Comment</h4>
      	  </div>
       <div class="modal-body">
       <form method="post" id="myform" action="/heroku-postgres-e55986aa/AddLapCom">
       <textarea rows="2" cols="70" placeholder="Enter Your Comment" maxlength="70" name="lap_com" required></textarea>
        <select class="form-control col-sm-2" name="type" id="com-type" required onchange="com_type()">
                <option value="Review" selected>Review</option>
                <option value="Help">Help</option>
                <option value="E-Commerce">E-Commerce</option>
         </select>
         <select class="form-control col-sm-2" name="brand" id="brand" required onchange="com_type()">
                <option value="Lenovo" selected>Lenovo</option>
                <option value="Dell">Dell</option>
                <option value="MSI">MSI</option>
                <option value="HP">HP</option>
                <option value="Toshiba">Toshiba</option>
                <option value="Apple">Apple</option>
                <option value="ASUS">ASUS</option>
                <option value="Acer">Acer</option>
                <option value="Other">Other</option>
         </select>
         <select disabled class="form-control col-sm-2" name="trade" id="trade" required onchange="com_type()">
                <option value="Buy">Buy</option>
                <option value="Sell" selected>Sell</option>
         </select>
         <input disabled type="number" min=0 max=999999999 required placeholder="Enter Price" name="price" id="price" required>
         <script type="text/javascript">
         	function com_type()
         	{
         		if((document.getElementById("com-type").value).localeCompare("E-Commerce") == 0)
	        		{
         			document.getElementById("trade").disabled = false;
         			document.getElementById("price").disabled = false;
	        		}
         		else
         			{
         			document.getElementById("trade").disabled = true;
         			document.getElementById("price").disabled = true;
         			}
         	}
         </script>
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