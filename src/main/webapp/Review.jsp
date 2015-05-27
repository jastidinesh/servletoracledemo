<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Restaurant Reviews</title>

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
          <p class="navbar-brand">Restaurant Reviews</p>
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
			String site = new String("/Login");
			response.setStatus(response.SC_MOVED_TEMPORARILY);
			response.setHeader("Location", site); 
		}
	}%>
	<div class="container">
		<div class="col-md-4">
		<p data-placement="top" data-toggle="tooltip" title="AddRev"><button class="btn btn-danger btn-xs" data-title="AddRes" data-toggle="modal" data-target="#addrev" ><span class="glyphicon glyphicon-plus"> Add Review</span></button></p>
		</div>
		<input name="user" type="hidden">
      </div>
	
<!-- --------------------------------------------------------------------------------------------------------------------- -->      
    	<div class="container">
		<div class="row">
		<p>
		<h1>Restaurant Details</h1>
		</p>
       <span class="glyphicon glyphicon-glass"></span><p id="res_name"></p>
       <span class="glyphicon glyphicon-road"><p id="res_loc"></p>
       <span class="glyphicon glyphicon-cloud"><p id="res_desc"></p>
      </div>
      <script type="text/javascript">
      	    document.getElementById("res_name").innerHTML = ${res_name};
      	    document.getElementById("res_loc").innerHTML = ${res_loc};
      	    document.getElementById("res_desc").innerHTML = ${res_desc};
      </script>
	  </div>
<!-- ---------------------------------------------------------------------------------------------------------------- -->
   	<div class="container">
		<div class="row">
    	    <div class="col-md-12">
        		<div class="table-responsive">
        		<p>
				<h1>Review Details</h1>
				</p>
	              <table id="mytable" class="table table-bordred table-striped">
                   <thead>
                     <th>#</th>
                     <th>Rating</th>
                     <th>Author</th>
                     <th>Review</th>
                     <th>Created</th>
                     <th>Rate This Review</th>
                     <th>Spam</th>
                   </thead>
			      <tbody id="tbody">
				  <script type="text/javascript">
					  function view_com(obj)
					  	{
						  document.getElementById("get_com").user.value = ${user};
						  document.getElementById("get_com").rev_id.value = obj;
						  document.getElementById("get_com").res_id.value = ${res_id};
						  document.getElementById("get_com").submit();
					  	}
					  
					  function spam_add(rev_id)
					  {
						  document.getElementById("spam").user.value = ${user};
						  document.getElementById("spam").rev_id.value = rev_id;
						  document.getElementById("spam").res_id.value = ${res_id};
						  document.getElementById("spam").submit();
					  }
					  
					  function add_rating(rev_id)
					  {
						  document.getElementById("rating").user.value = ${user};
						  document.getElementById("rating").rev_id.value = rev_id;
						  document.getElementById("rating").res_id.value = ${res_id};
					  }
						id_set = ${id};
						author	= ${author};
						name1 = ${content};
						created = ${created};
						var table = document.getElementById("tbody");
						for(i=0;i<${count};i++)
						{
							var rowcount = table.rows.length;
							var row = table.insertRow(rowcount);
							row.insertCell(0).innerHTML = i+1;
							row.insertCell(1).innerHTML = ${avg_rating}[i];
							row.insertCell(2).innerHTML = author[i];
							row.insertCell(3).innerHTML = '<a href="javascript:view_com('+id_set[i]+')">'+name1[i].substring(0,6)+'....</a>';
							row.insertCell(4).innerHTML = created[i];
							row.insertCell(5).innerHTML = '<form id="rating" method="post" action="/AddRate">'+
															'<input type="number" min=0 max=5 name="rate" required value='+${rating}[i]+'>/5'+
															'<button type="submit" class="btn btn-success btn-xs" onclick="add_rating('+id_set[i]+')"><span class="glyphicon glyphicon-ok-sign"></span></button>'+
															'<input type="hidden" name="user">'+
															'<input type="hidden" name="rev_id">'+
															'<input type="hidden" name="res_id">'+
															'</form>';
							if(${spam}[i])
								row.insertCell(6).innerHTML = '<form id="spam" method="post" action="/AddRevSpam">'+
															'<span class="glyphicon glyphicon-flag" style="color:red" onclick="spam_add('+id_set[i]+')"></span>'+
															'<input type="hidden" name="user">'+
															'<input type="hidden" name="rev_id">'+
															'<input type="hidden" name="res_id">'+
															'</form>';
							else
								row.insertCell(6).innerHTML = '<form id="spam" method="post" action="/AddRevSpam">'+
															'<span class="glyphicon glyphicon-flag" onclick="spam_add('+id_set[i]+')"></span>'+
															'<input type="hidden" name="user">'+
															'<input type="hidden" name="rev_id">'+
															'<input type="hidden" name="res_id">'+
															'</form>';
						}
					</script>    
				    <tr>
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
			<form action="/Comment" method="post" id="get_com">
				<input type="hidden" name="user">
				 <input type="hidden" name="rev_id">
				 <input type="hidden" name="res_id">
			</form>             
		</div>
	</div>
</div>
</div>
<!-- --------------------------------------------------------------------------------------------------------------------- -->      
      <div class="modal fade" id="addrev" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      	<div class="modal-dialog">
    	<div class="modal-content">
          <div class="modal-header">
        	<h4 class="modal-title custom_align" id="Heading">Adding Review</h4>
      	  </div>
       <div class="modal-body">
       <form action="/AddRev" method="post" id="myform">
	      <script type="text/javascript">
	      	function add_rev()
	      	{
	      		document.getElementById("myform").res_id.value = ${res_id};
	      		document.getElementById("myform").user.value = ${user};
	      	}
	      </script>
       <textarea rows="2" cols="70" placeholder="Enter Your Review" maxlength="140" name="review" required></textarea>
       <input type="hidden" name=user>
       <input type="hidden" name=res_id>  
      </div>
        <div class="modal-footer ">
        <button type="submit" class="btn btn-success" onclick="add_rev()" value="Add This Review"><span class="glyphicon glyphicon-ok-sign"></span></button>
      </div>
        </div>
        </form>
	    <!-- /.modal-content --> 
	  </div>
<!-- ------------------------------------------------------------------------------------------------------------------------ -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Login.js"></script>
  </body>
</html>