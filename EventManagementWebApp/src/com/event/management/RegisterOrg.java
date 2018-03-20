
package com.event.management;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.event.management.DBUtil;

/**
 * Servlet implementation class RegisterOrg
 */
@WebServlet("/RegisterOrg")
public class RegisterOrg extends HttpServlet {
	private static final long serialVersionUID = 1L;
     /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		response.setContentType("text/html");
        String name=request.getParameter("name");
        String mail=request.getParameter("email");
        long mobile=Long.parseLong(request.getParameter("contact"));
        String gender=request.getParameter("gender");
        String city=request.getParameter("city");
        String password=request.getParameter("password");
        String dob=request.getParameter("dob");
        
        
        PrintWriter out=response.getWriter();
        
		try {
			conn = DBUtil.loadDriver();
			
	        
	        String query = "INSERT INTO organiser_info (name,mail,mobile,gender,city,password,dob) Values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setLong(3, mobile);
			ps.setString(4, gender);
			ps.setString(5, city);
			ps.setString(6, password);
			ps.setString(7, dob);
			int i = ps.executeUpdate();

			if (i > 0) {
				out.println("Organiser Is Successfully Registered !");
				RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
				rd.forward(request, response);
			}
	        
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}


}
