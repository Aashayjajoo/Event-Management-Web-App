package com.event.management;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginBuyer
 */
@WebServlet("/LoginBuyer")
public class LoginBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginBuyer() {
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
		String mail = request.getParameter("mail");
		String password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		int b_id = 0;
		try{
			conn = DBUtil.loadDriver();
		if (BuyerLoginValidate.eValidate(mail, password)) {
				HttpSession session = request.getSession();
				String query = "SELECT b_id from buyer_info WHERE mail=?";
				PreparedStatement ps = conn.prepareStatement(query);
				ps.setString(1, mail);
				System.out.println(query);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					b_id = rs.getInt("b_id");
				}
				System.out.println(b_id);
				session.setAttribute("b_id", b_id);
				RequestDispatcher rd = request.getRequestDispatcher("buyticket.jsp");
				rd.forward(request, response);
			} else {
				System.out.println("ERROR");
				//RequestDispatcher rd = request.getRequestDispatcher("signin.jsp");
				//rd.include(request, response);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.close();
	}
	

}