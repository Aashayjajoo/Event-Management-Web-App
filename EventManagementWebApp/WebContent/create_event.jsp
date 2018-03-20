<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
	final String Driver = "com.mysql.jdbc.Driver";
	final String ConnectionString = "jdbc:mysql://localhost:3306/event_management";
	final String user = "root";
	final String pwd = "";
	Connection conn = null;
	/**
	 * to load the database base driver
	 * @return a database connection
	 * @throws SQLException throws an exception if an error occurs
	 */
	    try {
	        Class.forName(Driver);
	    } catch (ClassNotFoundException ex) {
	        System.out.println(ex.getMessage());
	    }
	    conn = DriverManager.getConnection(ConnectionString, user, pwd);
%>
<!DOCTYPE html>
<html lang="en">
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
                <!-- Dropdown Trigger -->
               	<a class='dropdown-button' href='#' data-activates='dropdown1' style="float: right;color:#fff;margin-top:10px;"><i class="material-icons" style="letter-spacing: -6px;">person expand_more</i></a>
                  <!-- Dropdown Structure -->
                  <ul id='dropdown1' class='dropdown-content'>
                    <li><a href="profile.jsp">profile</a></li>
                    <li><a href="logout.jsp">logout</a></li>
                  </ul>
            </div>
        </div>
    </div>
    	
    <div class="page-title">
    	<div class="row">
    		<div class="col s12">
    			<p>Let's create your event</p>
    		</div>
    	</div>
    </div>
    
    <div class="cancel-button">
    	<a class="btn-floating btn-large waves-effect waves-light red" href="events.jsp"><i class="material-icons">close</i></a>
    </div>
    
    <div class="row">
	    <div class="col s12">
	    	<div class="create-section">
	    		<div class="row">
		    		<div class="col s12">
		    			<div class="row">
		    				<form class="col s12" method="post" action="RegisterEvent">
						      <div class="row">
						        <div class="input-field col s6">
						          <input type="text" class="validate" name="name">
						          <label for="event_name">Event Name</label>
						        </div>
						   	  </div>
							  <div class="row">
						        <div class="input-field col s3">
						          <input type="text" class="datepicker" name="sdate">
						          <label for="start_date">Start Date</label>
						        </div>
						        <div class="input-field col s3">
						          <input type="text" class="timepicker" name="stime">
						          <label for="start_time">Start Time</label>
						        </div>
						   	  </div>	
						   	  <div class="row">
						        <div class="input-field col s3">
						          <input type="text" class="datepicker" name="edate">
						          <label for="end_date">End Date</label>
						        </div>
						        <div class="input-field col s3">
						          <input type="text" class="timepicker" name="etime">
						          <label for="end_time">End Time</label>
						        </div>
						   	  </div>
						   	  
						  		<div class="row">
									 <div class="input-field col s3">
									    <select name="city">
									      <option value="" disabled selected>Choose your option</option>
									      <%
									      		String query = "SELECT * FROM location WHERE status='0'";
						        		  		PreparedStatement ps = conn.prepareStatement(query);
						        		  		ResultSet rs = ps.executeQuery();
						        		  		while(rs.next()) {%>
						        		  			<option value="<%=rs.getString(1)%>"><%=rs.getString(2)%></option>
						        		  		<%}
									      %>
									    </select>
									    <label>City</label>
		 			 				</div>
						        </div>
						        
						        <div class="row">
						        <div class="input-field col s3">
						          <input type="text" class="validate" name="price">
						          <label for="price">Price</label>
						        </div>
						   	  </div>
						      
						        <div class="row">
						        <div class="input-field col s3">
						          <input type="text" class="validate" name="seat">
						          <label for="seats">Seats</label>
						        </div>
						   	  </div>
						   	  
								<div class="row">
									<div class="input-field col s12">
							          <input type="text" class="validate" name="venue">
							          <label for="venue">Address</label>
						        	</div>
								</div>
			
								<div class="row">
						          <div class="input-field col s12">
						            <input type="text" class="materialize-textarea" data-length="120" name="description">
						            <label for="description">Description</label>
						          </div>
						        </div>
			
								<div class="row">
									 <div class="input-field col s3">
									    <select name="category">
									      <option value="" disabled selected>Choose your option</option>
									      <%
									      		String query1 = "SELECT * FROM event_category";
						        		  		PreparedStatement ps1 = conn.prepareStatement(query1);
						        		  		ResultSet rs1 = ps1.executeQuery();
						        		  		while(rs1.next()) {%>
						        		  			<option value="<%=rs1.getString(1)%>"><%=rs1.getString(2)%></option>
						        		  		<%}
									      %>
									    </select>
									    <label>Event Type</label>
		 			 				</div>
		 			 			</div>	
								<button class="waves-effect waves-light btn" type="submit" value="submit">Create Event</button>	
							</form>
						</div>
					</div>
				</div>		  	
	    	</div>
	    </div>
	</div>
				<
</body>

<!--script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script-->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 <!-- script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.2/js/materialize.min.js"></script-->
 <script type="text/javascript" src="js/materialize.min.js"></script>
 <script>
$('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 15, // Creates a dropdown of 15 years to control year,
    today: 'Today',
    clear: 'Clear',
    close: 'Ok',
    closeOnSelect: false // Close upon selecting a date,
  });
  
  
$('.timepicker').pickatime({
default: 'now', // Set default time: 'now', '1:30AM', '16:30'
fromnow: 0,       // set default time to * milliseconds from now (using with default = 'now')
twelvehour: false, // Use AM/PM or 24-hour format
donetext: 'OK', // text for done-button
cleartext: 'Clear', // text for clear-button
canceltext: 'Cancel', // Text for cancel-button
autoclose: false, // automatic close timepicker
ampmclickable: true, // make AM PM clickable
aftershow: function(){} //Function for after opening timepicker
});

$(document).ready(function() {
    $('select').material_select();
  });
       
</script>
</html>