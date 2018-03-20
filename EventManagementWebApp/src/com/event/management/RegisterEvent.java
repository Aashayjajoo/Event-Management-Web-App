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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterEvent
 */
@WebServlet("/RegisterEvent")
public class RegisterEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("hello");
		Connection conn = null;
		response.setContentType("text/html");
        String name=request.getParameter("name");
        String venue=request.getParameter("venue");
        String city=request.getParameter("city");
        String start_date=request.getParameter("sdate");
        String start_time=request.getParameter("stime");
        String close_date=request.getParameter("edate");
        String close_time=request.getParameter("etime");
        String cat=request.getParameter("category");
        String loc=request.getParameter("city");
        String seats=request.getParameter("seat");
        double price=Double.parseDouble(request.getParameter("price"));
        String description=request.getParameter("description");
        
        
        PrintWriter out=response.getWriter();
        HttpSession session = request.getSession();
        int session_id = (Integer)session.getAttribute("org_id");
		try {
			conn = DBUtil.loadDriver();
			
	        
	        String query = "INSERT INTO event (name,venue,city,start_date,start_time,close_date,close_time,cat_id,l_id,seats,price,description,org_id) Values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, venue);
			ps.setString(3, city);
			ps.setString(4, start_date);
			ps.setString(5, start_time);
			ps.setString(6, close_date);
			ps.setString(7, close_time);
			ps.setString(8, cat);
			ps.setString(9, loc);
			ps.setString(10, seats);
			ps.setDouble(11, price);
			ps.setString(12, description);
			ps.setInt(13, session_id);
			int i = ps.executeUpdate();

			if (i > 0) {
				out.println("event is successfully created !");
				RequestDispatcher rd = request.getRequestDispatcher("events.jsp");
				rd.forward(request, response);
			}
	        
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
