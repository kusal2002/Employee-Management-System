package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static String url = "jdbc:mysql://localhost:3306/employee_management_system?useSSL=false";
	private static String user = "root";
	private static String pass = "Pllv@2003";
	private static Connection con;

	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("Database Connection is not success");
		}
		return con;
	}

}
