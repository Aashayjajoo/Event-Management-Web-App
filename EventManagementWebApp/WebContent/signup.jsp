<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Organize | Snap Ticket</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="event-management">
    <meta name="author" content="Avinash Barfa">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="css/dashboard.css" rel="stylesheet">
</head>
<body>
	
	<div class="top-nav" style="background-color: rgba(104,53,148,.88); color: #fff">
        <div class="row">
            <div class="col s12">
                <h5 style="float: left;">Snap-Tickets</h5>
                
            </div>
        </div>
    </div>
    	
    <div class="page-title">
    	<div class="row">
    		<div class="col s12">
    			<p>Let's create your Profile</p>
    		</div>
    	</div>
    </div>
    
    <div class="cancel-button">
    	<a class="btn-floating btn-large waves-effect waves-light red" href="signin.jsp"><i class="material-icons">close</i></a>
    </div>
    
	 <div class="row">
    <form class="col s12" name="registerForm" action="RegisterOrg" method="POST">
      <div class="row">
        <div class="input-field col s6">
          <input id="name" type="text" class="validate" name="name" required="required" maxlength="40">
          <label for="name">Name</label>
        </div>
        </div>
     
      <div class="row">
        <p>
      <input name="gender" type="radio" id="male" value="0" />
      <label for="male">Male</label>
    </p>
    <p>
      <input name="gender" type="radio" id="female" value="1" />
      <label for="female">Female</label>
    </p>
      </div>
	    <div class="row">
		<div class="input-field col s2">
			<input type="text" class="datepicker" name="dob">
			<label for="dob">DOB</label>
		</div>
		</div>
		<div class="row">
        <div class="input-field col s12">
          <input type="tel" name="contact"  required="reqiured" maxlength="10" class="form-control">
          <label for="contact">Phone No.</label>
        </div>
      </div>	
		<div class="row">
			<div class="input-field col s12">
			<input type="text" class="validate" name="city">
		    <label for="venue">Address</label>
		 </div>
		</div>				       	
	     <div class="row">
	       <div class="input-field col s12">
	         <input type="password" name="password" id="password"  required="required" maxlength="40" class="validate">
	         <label for="password">Password</label>
	       </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate" name="email" required="required" maxlength="60">
          <label for="email">Email</label>
        </div>
      </div>
      <button class="btn waves-effect waves-light" type="submit" value="submit">Submit
    		<i class="material-icons right">send</i>
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
$('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    
    selectYears: 40, // Creates a dropdown of 40 years to control year,
    changeMonth : true,
    changeYear : true,
    yearRange: '-100y:c+nn',
    maxDate: '-1d',
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
  });
  


$(document).ready(function() {
    $('select').material_select();
  });
       
</script>

</html>