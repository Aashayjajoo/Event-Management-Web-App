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
	

     int session_id = (Integer)session.getAttribute("org_id");
     String name = null;
 	 String venue = null; 
 	 String city = null;
 	 String start_date = null;
 %>
	
<% 	 try{
			//conn = DBUtil.loadDriver();
			
         Class.forName(Driver);
         conn = DriverManager.getConnection(ConnectionString, user, pwd);
         String query = "SELECT name,venue,city,start_date from event WHERE org_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, session_id);
			System.out.println(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
			name = rs.getString("name");
	        venue=rs.getString("venue");
	        city=rs.getString("city");
	        start_date=rs.getString("start_date");
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
	<title>Events</title>
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
                    <li><a href="profile.jsp">profile</a></li>
                    <li><a href="events.jsp">events</a></li>
                    <li><a href="logout.jsp">logout</a></li>
                  </ul>
            </div>
        </div>
    </div>
   
   	 <div class="page-title">
    	<div class="row">
    		<div class="col s12">
    			<p>Your Events</p>
    		</div>
    	</div>
    </div>
    
    <div class="add-button">
    					<a class="btn-floating btn-large waves-effect waves-light red" href="create_event.jsp"><i class="material-icons">add</i></a>
    				</div>
    <div class="event-section">
    
     <div class="row">
         <div class="container">
             <div class="col s12">
               <ul class="tabs">
                 <li class="tab col s3"><a class="active" href="#test1">Active Events</a></li>
                 
               </ul>
             </div>
             <% 	 try{
			//conn = DBUtil.loadDriver();
			
         Class.forName(Driver);
         conn = DriverManager.getConnection(ConnectionString, user, pwd);
         String query = "SELECT name,venue,location.city,start_date from event natural join location WHERE org_id=? ";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, session_id);
			System.out.println(query);
			ResultSet rs = ps.executeQuery();
			%>
			
			
	
              <div id="test1" class="col s12">
              	<table class="highlight">

        <thead>
          <tr>
              <th>Name</th>
              <th>Venue</th>
              <th>City</th>
              <th>Start Date</th>
          </tr>
        </thead>

        <tbody>
        <%
              while(rs.next()) { 
             %>
             <TR>
<TD><%=rs.getString(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>
</TR>
<% } %>
<%
             }catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
%>
          
        </tbody>
      </table>
        
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
</html>