package com.payroll;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.db.DBConnect;

public class PayrollController {

	// Database Connection components
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	private static final SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	// Insert Payroll Data
	public static boolean insertPayrollData(int employeeID, String payDate, double basicSalary, double allowances,
			double deductions, double netPay) {
		boolean isSuccess = false;
		try {
			// DB Connection Call
			con = DBConnect.getConnection();

			// SQL Query using PreparedStatement to prevent SQL Injection
			String sql = "INSERT INTO Payroll (EmployeeID, PayDate, BasicSa1ary, Allowances, Deductions, NetPay) VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, employeeID);
			pstmt.setString(2, payDate);
			pstmt.setDouble(3, basicSalary);
			pstmt.setDouble(4, allowances);
			pstmt.setDouble(5, deductions);
			pstmt.setDouble(6, netPay);

			int rowsAffected = pstmt.executeUpdate();
			isSuccess = rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	// Get Payroll Data by ID
	public static List<PayrollModel> getPayrollById(int payrollID) {
		ArrayList<PayrollModel> payrollList = new ArrayList<>();

		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// SQL Query
			String sql = "SELECT * FROM Payroll WHERE PayrollID = " + payrollID;
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int payrollId = rs.getInt("PayrollID");
				int employeeId = rs.getInt("EmployeeID");
				String payDate = rs.getString("PayDate");
				//String payDate = rs.getString("payDateStr");
				// Date payDate = dateFormat.parse(payDateStr);
				double basicSalary = rs.getDouble("BasicSalary");
				double allowances = rs.getDouble("Allowances");
				double deductions = rs.getDouble("Deductions");
				double netPay = rs.getDouble("NetPay");

				PayrollModel payroll = new PayrollModel(payrollId, employeeId, payDate, basicSalary, allowances,
						deductions, netPay);
				payrollList.add(payroll);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return payrollList;
	}

	// Get All Payroll Data
	public static List<PayrollModel> getAllPayrolls() {
		ArrayList<PayrollModel> payrolls = new ArrayList<>();

		try {
			// DB Connection Call
			con = DBConnect.getConnection();
			stmt = con.createStatement();

			// SQL Query
			String sql = "SELECT * FROM Payroll";
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int payrollId = rs.getInt("PayrollID");
				int employeeId = rs.getInt("EmployeeID");
				String payDate = rs.getString("PayDate");
				//String payDate = rs.getString("payDateStr");
				// Date payDate = dateFormat.parse(payDateStr);
				double basicSalary = rs.getDouble("BasicSa1ary");
				double allowances = rs.getDouble("Allowances");
				double deductions = rs.getDouble("Deductions");
				double netPay = rs.getDouble("NetPay");

				PayrollModel payroll = new PayrollModel(payrollId, employeeId, payDate, basicSalary, allowances,
						deductions, netPay);
				payrolls.add(payroll);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return payrolls;
	}

	// Update Payroll Data
	public static boolean updatePayrollData(int payrollID, double basicSalary, double allowances, double deductions,
			double netPay) {
		try {
			// DB Connection Call
			con = DBConnect.getConnection();

			// SQL Query using PreparedStatement to prevent SQL Injection
			String sql = "UPDATE Payroll SET BasicSa1ary = ?, Allowances = ?, Deductions = ?, NetPay = ? WHERE PayrollID = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setDouble(1, basicSalary);
			pstmt.setDouble(2, allowances);
			pstmt.setDouble(3, deductions);
			pstmt.setDouble(4, netPay);
			pstmt.setInt(5, payrollID);

			int rowsAffected = pstmt.executeUpdate();
			isSuccess = rowsAffected > 0;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}

	// Delete Payroll Data
	public static boolean deletePayrollData(int payrollID) {
		boolean isSuccess = false;

		try {
			// DB Connection Call
			con = DBConnect.getConnection();

			// SQL Query using PreparedStatement to avoid SQL Injection
			String sql = "DELETE FROM Payroll WHERE PayrollID = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, payrollID);

			int rowsAffected = pstmt.executeUpdate();
			isSuccess = rowsAffected > 0;
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
