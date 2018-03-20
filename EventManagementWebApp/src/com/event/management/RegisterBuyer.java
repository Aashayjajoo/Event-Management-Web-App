package com.event.management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterBuyer
 */
@WebServlet("/RegisterBuyer")
public class RegisterBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterBuyer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
			
	        
	        String query = "INSERT INTO buyer_info (name,mail,mobile,city,gender,dob,password) Values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, mail);
			ps.setLong(3, mobile);
			ps.setString(4, city);
			ps.setString(5, gender);
			ps.setString(6, dob);
			ps.setString(7, password);
			int i = ps.executeUpdate();

			if (i > 0) {
				
				RequestDispatcher rd = request.getRequestDispatcher("buyersignin.jsp");
				rd.forward(request, response);
			}
	        
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
