package com.payroll;


public class PayrollModel {
	private int payrollID;
	private int employeeID;
	private String payString;
	private double basicSalary;
	private double allowances;
	private double deductions;
	private double netPay;

	// Constructor
	public PayrollModel(int payrollID, int employeeID, String payString, double basicSalary, double allowances,
			double deductions, double netPay) {
		this.payrollID = payrollID;
		this.employeeID = employeeID;
		this.payString = payString;
		this.basicSalary = basicSalary;
		this.allowances = allowances;
		this.deductions = deductions;
		this.netPay = netPay;
	}

	// Getters and Setters
	public int getPayrollID() {
		return payrollID;
	}

	public void setPayrollID(int payrollID) {
		this.payrollID = payrollID;
	}

	public int getEmployeeID() {
		return employeeID;
	}

	public void setEmployeeID(int employeeID) {
		this.employeeID = employeeID;
	}

	public String getPayString() {
		return payString;
	}

	public void setPayString(String payString) {
		this.payString = payString;
	}

	public double getBasicSalary() {
		return basicSalary;
	}

	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}

	public double getAllowances() {
		return allowances;
	}

	public void setAllowances(double allowances) {
		this.allowances = allowances;
	}

	public double getDeductions() {
		return deductions;
	}

	public void setDeductions(double deductions) {
		this.deductions = deductions;
	}

	public double getNetPay() {
		return netPay;
	}

	public void setNetPay(double netPay) {
		this.netPay = netPay;
	}
}
