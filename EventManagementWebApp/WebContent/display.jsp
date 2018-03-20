<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>

 

<%
	
	final Connection conn;
    final String Driver = "com.mysql.jdbc.Driver";
    final String ConnectionString = "jdbc:mysql://localhost:3306/event_management";
    final String user = "root";
    final String pwd = "";
	
	int session_id = (Integer)session.getAttribute("b_id");
	String name = null;
	String mail = null; 
	long mobile = 0 ;
	String gender = null;
	String city = null;
	String dob = null;
	String password = null;
	int count=0;
	
	
		try{
			//conn = DBUtil.loadDriver();
			
            Class.forName(Driver);
            conn = DriverManager.getConnection(ConnectionString, user, pwd);
            String query = "SELECT * from buyer_info WHERE b_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, session_id);
			System.out.print(session_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			name = rs.getString("name");
	        mail=rs.getString("mail");
	        mobile=Long.parseLong(rs.getString("mobile"));
			}
	        
	        String query1 = "SELECT SUM(seats_booked) from tickets where b_id=?";
			PreparedStatement ps1 = conn.prepareStatement(query1);
			
			ResultSet rs1 = ps.executeQuery();
			while(rs1.next()) {
				count=count+rs.getInt("seats_booked");
			}
	        
			
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
%>

						 				
						
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Profile : Snap Tickets</title>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta name="description" content="event-management">
    <meta name="author" content="Avinash Barfa">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<link href="css/dashboard.css" rel="stylesheet">
</head>
<body> 
	
	<div class="top-nav">
        <div class="row" style="background-color: rgba(104,53,148,.88); color: #fff">
            <div class="col s12">
                <h5 style="float: left;">Snap-Tickets</h5>
                <!-- Dropdown Trigger -->
                <a class='dropdown-button' href='#' data-activates='dropdown1' style="float: right;color:#fff;margin-top:10px;"><i class="material-icons" style="letter-spacing: -6px;">person expand_more</i></a>
                  <!-- Dropdown Structure -->
                  <ul id='dropdown1' class='dropdown-content'>
                    
                    <li><a href="buyticket.jsp">Buy Ticket</a></li>
                    <li><a href="logout1.jsp">logout</a></li>
                  </ul>
            </div>
        </div>
    </div>
   
   	 <div class="page-title">
    	<div class="row">
    		<div class="col s6">
    			<p>TICKET BOOKED</p>
    		</div>
    	</div>
    </div>
    
                   <div id="test1" class="col s12">
              	<table class="highlight">

        

     
            

         	  
	<div class="row">
        <div class="col s12 m6">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">TICKETS DETAILS</span>
               <BR>NAME:<%=name%><BR><BR>
				EMAIL ID:<%=mail%><BR><BR>
				PHONE NO.:<%=mobile%>
               
            </div>
           
          </div>
        </div>
      </div>
				
	 <div class="row">
        <div class="col s12 m6">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">YOUR DETAILS</span>
               <BR>Total Tickets:??<%=count%><BR><BR>
				
               
            </div>
            <div class="card-action">
             <p align="center"><b>PRICE:</b>???</p>
            </div>
          </div>
        </div>
      </div>		  	
         
        
</body>
<!--script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script-->
 <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
 <!-- script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.2/js/materialize.min.js"></script-->
 <script type="text/javascript" src="js/materialize.min.js"></script>
 <script>
 $(document).ready(function() {
	    $('select').material_select();
	  });
 </script>
</html>