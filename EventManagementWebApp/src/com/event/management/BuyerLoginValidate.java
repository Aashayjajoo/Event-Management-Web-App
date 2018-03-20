package com.event.management;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BuyerLoginValidate {

	
	private static boolean status = false;
	static Connection conn = null;

	public static boolean eValidate(String mail, String password) {

		//password = HashPassword.hashed(password);
		try {
			conn = DBUtil.loadDriver();
			PreparedStatement ps = conn.prepareStatement("SELECT mail,password FROM buyer_info WHERE mail=? and password=?");
			ps.setString(1, mail);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			System.out.println("loginvalid");
			status = rs.next();

		} catch (Exception ex) {
			System.out.println(ex);
		}
		return status;
	}

}	

