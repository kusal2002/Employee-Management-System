package com.employee;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;

public class EmployeeController {

	// Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	public static boolean insertdata(String username, String password, String email, String role) {

		boolean isSuccess = false;
		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// SQL Query
			String sql = "insert into users values(0,'" + username + "','" + password + "','" + email + "','" + role
					+ "')";
			int rs = stmt.executeUpdate(sql);
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;

	}

	public static List<EmployeeModel> getById(String Id) {

		int convertedID = Integer.parseInt(Id);

		ArrayList<EmployeeModel> admin = new ArrayList<>();

		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// Query
			String sql = "select * from users where user_id = '" + convertedID + "'";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int id = rs.getInt(1);
				String username = rs.getString(2);
				String password = rs.getString(3);
				String email = rs.getString(4);
				String role = rs.getString(5);

				EmployeeModel emp = new EmployeeModel(id, username, password, email, role);
				admin.add(emp);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return admin;

	}

	// Get All Data
	public static List<EmployeeModel> getAllAdmin() {

		ArrayList<EmployeeModel> admins = new ArrayList<>();
		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// Query
			String sql = "select * from users";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				EmployeeModel employee = new EmployeeModel();
				employee.setId(rs.getInt("user_id"));
				employee.setUsername(rs.getString("username"));
				employee.setPassword(rs.getString("password"));
				employee.setEmail(rs.getString("email"));
				employee.setRole(rs.getString("role"));
				admins.add(employee);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return admins;

	}

	// Update Controller
	public static boolean updatedata(String id, String username, String password, String email, String role) {

		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// SQL Query
			String sql = "update users set username='" + username + "', password='" + password + "', email='" + email
					+ "', role='" + role + "' " + "where user_id='" + id + "'";

			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	// Delete Data
	public static boolean deletedata(int id) {
		boolean isSuccess = false;

		try {
			// DB Connection Call
			con = DBConnect.getConnection();

			// Using PreparedStatement to avoid SQL injection
			String sql = "DELETE FROM users WHERE user_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);

			int rs = pstmt.executeUpdate();
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// Close resources to avoid memory leaks
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return isSuccess;
	}

}
