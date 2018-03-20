package com.event.management;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;

public class DBUtil {
	
private static Connection con;

    private static final String Driver = "com.mysql.jdbc.Driver";
    private static final String ConnectionString = "jdbc:mysql://localhost:3306/event_management";
    private static final String user = "root";
    private static final String pwd = "";

    /**
     * to load the database base driver
     * @return a database connection
     * @throws SQLException throws an exception if an error occurs
     */
    public static Connection loadDriver() throws SQLException {
        try {
            Class.forName(Driver);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex.getMessage());
        }
        con = DriverManager.getConnection(ConnectionString, user, pwd);
        return con;
    }
}
