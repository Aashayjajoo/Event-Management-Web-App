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
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		response.setContentType("text/html");
        String name=request.getParameter("name");
        String mail=request.getParameter("email");
        long mobile=Long.parseLong(request.getParameter("contact"));
        String city=request.getParameter("city");
        String password=request.getParameter("password");
        String dob=request.getParameter("dob");
        
        
       // PrintWriter out=response.getWriter();
        HttpSession session = request.getSession();
        int session_id = (Integer)session.getAttribute("org_id");
        try {
			conn = DBUtil.loadDriver();
			String query = "UPDATE organiser_info SET name='"+name+"',mail='"+mail+"',mobile='"+mobile+"',city='"+city+"',password='"+password+"',dob='"+dob+"' where org_id="+session_id;
			PreparedStatement ps = conn.prepareStatement(query);
			int rs = ps.executeUpdate();
			if(rs>0) {
				RequestDispatcher rd = request.getRequestDispatcher("profile.jsp");
				rd.forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
