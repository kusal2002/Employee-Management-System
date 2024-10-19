package com.leave;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnect;

public class LeaveController {

	// Connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	// Insert Data
	public static boolean insertData(int employeeId, String attendanceDate, String status, String leaveType,
			String leaveReason) {

		boolean isSuccess = false;
		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// SQL Query
			String sql = "INSERT INTO EmployeeAttendanceLeave (employee_id, attendance_date, status, leave_type, leave_reason) "
					+ "VALUES ('" + employeeId + "', '" + attendanceDate + "', '" + status + "', '" + leaveType + "', '"
					+ leaveReason + "')";

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

	// Get By ID
	public static List<LeaveModel> getById(String id) {

		int convertedID = Integer.parseInt(id);
		ArrayList<LeaveModel> leaveRecords = new ArrayList<>();

		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// Query
			String sql = "SELECT * FROM EmployeeAttendanceLeave WHERE attendance_id = '" + convertedID + "'";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int attendanceId = rs.getInt(1);
				int employeeId = rs.getInt(2);
				String attendanceDate = rs.getString(3);
				String status = rs.getString(4);
				String leaveType = rs.getString(5);
				String leaveReason = rs.getString(6);

				LeaveModel leave = new LeaveModel(attendanceId, employeeId, attendanceDate, status, leaveType,
						leaveReason, rs.getString(7), rs.getString(8));
				leaveRecords.add(leave);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return leaveRecords;
	}

	// Get All Data
	public static List<LeaveModel> getAllLeaves() {

		ArrayList<LeaveModel> leaves = new ArrayList<>();
		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// Query
			String sql = "SELECT * FROM EmployeeAttendanceLeave";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int attendanceId = rs.getInt(1);
				int employeeId = rs.getInt(2);
				String attendanceDate = rs.getString(3);
				String status = rs.getString(4);
				String leaveType = rs.getString(5);
				String leaveReason = rs.getString(6);

				LeaveModel leave = new LeaveModel(attendanceId, employeeId, attendanceDate, status, leaveType,
						leaveReason, rs.getString(7), rs.getString(8));
				leaves.add(leave);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return leaves;
	}

	// Update Controller
	public static boolean updateData(int attendanceId, String attendanceDate, String status, String leaveType,
			String leaveReason) {

		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// SQL Query
			String sql = "UPDATE EmployeeAttendanceLeave SET attendance_date='" + attendanceDate + "', status='"
					+ status + "', " + "leave_type='" + leaveType + "', leave_reason='" + leaveReason
					+ "' WHERE attendance_id='" + attendanceId + "'";

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
	public static boolean deleteData(int attendanceId) {
		boolean isSuccess = false;

		try {
			// DB Connection Call
			con = DBConnect.getConnection();

			// Using PreparedStatement to avoid SQL injection
			String sql = "DELETE FROM EmployeeAttendanceLeave WHERE attendance_id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, attendanceId);

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
