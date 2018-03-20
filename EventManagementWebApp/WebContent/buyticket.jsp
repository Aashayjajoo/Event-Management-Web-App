<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	final String Driver = "com.mysql.jdbc.Driver";
	final String ConnectionString = "jdbc:mysql://localhost:3306/event_management";
	final String user = "root";
	final String pwd = "";
	Connection conn = null;
	

     int session_id = (Integer)session.getAttribute("b_id");
     String name = null;
 	 String venue = null; 
 	 String city = null;
 	 String start_date = null;
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
                    <li><a href="BuyerProfile.jsp">profile</a></li>
              
                    <li><a href="buyticket.jsp">Buy Ticket</a></li>
                    <li><a href="logout1.jsp">logout</a></li>
                  </ul>
            </div>
        </div>
    </div>
   
   	 <div class="page-title">
    	<div class="row">
    		<div class="col s12">
    			<p>IF YOU CAN'T STOP THINKING ABOUT IT... BUY IT!!!</p>
    			<p>Buy Ticket</p>
    		</div>
    	</div>
    </div>

    <div class="events-cards">
    		<%
    			String query1 = "Select * from event";
			    try{
					//conn = DBUtil.loadDriver();
					
			        Class.forName(Driver);
			        conn = DriverManager.getConnection(ConnectionString, user, pwd);
			        String query = "SELECT * from event";
					PreparedStatement ps = conn.prepareStatement(query);
					System.out.println(query);
					ResultSet rs = ps.executeQuery();
					while(rs.next()) {
						%>
						<div class="row">	
							<div class="col s4">
								<div class="card-panel teal lighten-2">
							       <div class="card-content white-text">
							            <span class="card-title"><%=rs.getString("name")%></span>
								            <p><%=rs.getString("description")%></p>
								            </div>
								            <div class="card-action">
								              <p>Date : <%=rs.getString("start_date")%></p>
								              <p>Time : <%=rs.getString("start_time")%></p>
								              <p>Price: <%=rs.getString("price")%> </p>
								    	    </div>
											<div class="card-action">
								              <form action="Purchase" method="Post">
								              		<input type="hidden" name="event_id" value=<%=rs.getString("e_id")%>>
								              		<input type="hidden" name="buyer_id" value=<%=session_id%>>
								              		<input type="number" name="seat">
								              		<button type="submit">Buy Ticket</button> 
								              </form>
								    	    </div>
																			    	    	
							       		</div>
						    		</div>
						    	</div>
						    </div>	 				
						<%
					}
				}
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			%>
    	

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