<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>SignUp</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/Login.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
   <!--
    you can substitue the span of reauth email for a input with the email and
    include the remember me checkbox
    -->
    <div class="container">
        <div class="card card-container">
        <%
	String msg = request.getParameter("errmsg");
	if(msg != null){
		out.println("<center><font face=verdana color=red>"+msg+"</center></font>");
	}%>
        <script type="text/javascript">    		
		  function validate_user() 
		    {
			  if(form.username.value.length=0)
				  {
				  document.getElementById('errname').innerHTML="Username Cannot Be Empty";
			      	form.username.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errname').innerHTML="";
			  if(form.username.value.length < 6)
			  {
			  document.getElementById('errname').innerHTML="Username must have atleast 6 characters";
		      	form.username.focus();
		      	return false;
		    }
		    else
		    	document.getElementById('errname').innerHTML="";
			  re = /^\w+$/;
			    if(!re.test(form.username.value)) {
			    	document.getElementById('errname').innerHTML="Username must contain only letters,numbers and underscores!";
			      	form.username.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errname').innerHTML="";
		    }
		  
		  function validate_pass()
		  {
			  if(form.pwd1.value != "" && form.pwd1.value == form.pwd2.value) {
			      if(form.pwd1.value.length < 6) {
			    	  document.getElementById('errpass').innerHTML="Password must contain at least six characters!";
			        form.pwd1.focus();
			        return false;
			      }
			      else
			    	  {
			    	  document.getElementById('errpass').innerHTML="";
			    	  }
			      if(form.pwd1.value.length > 16) {
			    	  document.getElementById('errpass').innerHTML="Password cannot be greater than 16 characters!";
			        form.pwd1.focus();
			        return false;
			      }
			      else
			    	  {
			    	  document.getElementById('errpass').innerHTML="";
			    	  }
			      if(form.pwd1.value == form.username.value) {
			    	  document.getElementById('errpass').innerHTML="Password must be different from Username";
			        form.pwd1.focus();
			        return false;
			      }
			      else
			    	  {
			    	  document.getElementById('errpass').innerHTML="";
			    	  }
			    } else {
			    	document.getElementById('errpass').innerHTML="Please check that you've entered and confirmed your password!";
			      form.pwd1.focus();
			      return false;
			    }

		  }
		  
		  function validate_fname() 
		    {
			  if(form.fname.value.length=0)
				  {
				  document.getElementById('errfname').innerHTML="First Name Cannot Be Empty";
			      	form.fname.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errfname').innerHTML="";
			  re = /^\w+$/;
			    if(!re.test(form.fname.value)) {
			    	document.getElementById('errfname').innerHTML="First Name Cannot Contain Symbols";
			      	form.fname.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errfname').innerHTML="";
			    if(form.fname.value.indexOf('_') > -1)
			    {
			    	document.getElementById('errfname').innerHTML="First Name Cannot Contain Underscore";
			      	form.fname.focus();
			      	return false;	
			    }
			    else
			    	document.getElementById('errfname').innerHTML="";
			    
			    if(/\d/.test(form.fname.value)) {
			    	document.getElementById('errfname').innerHTML="First Name Cannot Contain numbers";
			      	form.fname.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errfname').innerHTML="";
		    }
		
		  function validate_lname() 
		    {
			  if(form.lname.value.length=0)
				  {
				  document.getElementById('errlname').innerHTML="Last Name Cannot Be Empty";
			      	form.lname.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errlname').innerHTML="";
			  re = /^\w+$/;
			    if(!re.test(form.lname.value)) {
			    	document.getElementById('errlname').innerHTML="Last Name Cannot Contain Symbols";
			      	form.lname.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errlname').innerHTML="";
			    if(form.fname.value.indexOf('_') > -1)
			    {
			    	document.getElementById('errlname').innerHTML="Last Name Cannot Contain Underscore";
			      	form.lname.focus();
			      	return false;	
			    }
			    else
			    	document.getElementById('errlname').innerHTML="";
			    
			    if(/\d/.test(form.lname.value)) {
			    	document.getElementById('errlname').innerHTML="Last Name Cannot Contain numbers";
			      	form.lname.focus();
			      	return false;
			    }
			    else
			    	document.getElementById('errlname').innerHTML="";
		    }
		  
		  function validate_pin()
		  {
			  if(form.pin.value.length != 4)
			    {
			    	document.getElementById('errpin').innerHTML="Pin Should Be 4 digits";
			      	form.pin.focus();
			      	return false;	
			    }
			    else
			    	document.getElementById('errpin').innerHTML="";  
		  }
</script>
        
      		<img id="profile-img" class="profile-img-card" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" />
            <p id="profile-name" class="profile-name-card"></p>
			<form class="form-signin" name="form" method="post" action="Signup" onsubmit="return validate_pass();">
			<input type="text" class="form-control" name="username" placeholder="User Name" required autofocus onblur="validate_user()"><span id="errname"></span>
			<input type="password" class="form-control" name="pwd1" placeholder="Password" required>
			<input type="password" class="form-control" name="pwd2" placeholder="Confirm Password" required onblur="validate_pass()"><span id="errpass"></span>
			<input type="text" class="form-control" name="fname" placeholder="First Name" required autofocus onblur="validate_fname()"><span id="errfname"></span>
			<input type="text" class="form-control" name="lname" placeholder="Last Name" required autofocus onblur="validate_lname()"><span id="errlname"></span>
			<input type="email" class="form-control" name="email" placeholder="Email" required autofocus>
			<input type="number" class="form-control" name="pin" placeholder="Enter 4 digit Recovery Pin" onblur="validate_pin()" required autofocus><span id="errpin"></span>
			<button type="submit" class="btn btn-lg btn-primary btn-block btn-signin">Sign Up</button>
			</form>
		</div>
</div>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/Login.js"></script>
  </body>
</html>