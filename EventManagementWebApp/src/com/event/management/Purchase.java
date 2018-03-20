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
 * Servlet implementation class Purchase
 */
@WebServlet("/Purchase")
public class Purchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Purchase() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String e_id = request.getParameter("event_id");
		String b_id = request.getParameter("buyer_id");
		String seats_booked = request.getParameter("seat");
		
		Connection conn = null;
		response.setContentType("text/html");
         PrintWriter out=response.getWriter();
        
		try {
			conn = DBUtil.loadDriver();
			
	        
	        String query = "INSERT INTO tickets (e_id,b_id,seats_booked) Values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, e_id);
			ps.setString(2, b_id);
			ps.setString(3, seats_booked);
			int i = ps.executeUpdate();

			if (i > 0) {
				out.println("Successfully Booked !");
				RequestDispatcher rd = request.getRequestDispatcher("buyticket.jsp");
				rd.forward(request, response);
			}
	        
	        
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
