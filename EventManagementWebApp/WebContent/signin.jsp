<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>SignIn : Snap Tickets</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="event-management">
    <meta name="author" content="Avinash Barfa">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="css/dashboard.css" rel="stylesheet">
	
</head>
<body>



<!-- <script type="text/javascript">
	function myFunction() {
	    document.getElementById("button2").src = "EventManagementWebApp/WebContent/signup.jsp";
	}
	</script>
	-->

<div class="top-nav">
        <div class="row" style="background-color: rgba(104,53,148,.88); color: #fff">
            <div class="col s12">
                <h5 style="float: left;">Snap-Tickets</h5>
                
            </div>
        </div>
    </div>
   
   	 <div class="page-title">
    	<div class="row">
    		<div class="col s12">
    			<p>Let's see how your Events are doing!</p>
    			<p>LOGIN</p>
    		</div>
    	</div>
    </div>
   <div class="cancel-button">
    	<a class="btn-floating btn-large waves-effect waves-light red" href="index.jsp"><i class="material-icons">close</i></a>
    </div>
<form class="col s12" name="myForm" action="LoginOrg" method="post">

<div class="row" align="center">
    
      <div class="row" style="margin-left:33%">
        <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input id="icon_prefix" type="email" class="validate" name="mail" required = "required">
          <label for="icon_prefix">Email ID</label>
        </div>
        </div>
		<div class="row" style="margin-left:33%">
        <div class="input-field col s6">
          <i class="material-icons prefix">lock</i>
          <input id="pass" type="password" class="validate" name="password" required = "required">
          <label for="icon_telephone">Password</label>
        </div>
      </div>
      </div>
    
  </div>
<button class="btn waves-effect waves-light validate" type="submit" value="Submit" style="margin-left: 45%">SignIn
    <i class="material-icons right">send</i>
  </button>
  
</form>
<br>
<br>
<div class="row" >
<form action="signup.jsp">
    <button class="btn waves-effect waves-light" style="margin-left: 45%">SignUp
    
    <i class="material-icons right">group_add</i>
   
  </button>
</form>
</div>
</body>
<!--script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script-->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 <!-- script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.2/js/materialize.min.js"></script-->
 <script type="text/javascript" src="js/materialize.min.js"></script>
 <script>
</html>