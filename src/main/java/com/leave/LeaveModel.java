package com.leave;

public class LeaveModel {
	private int attendanceId;
	private int employeeId;
	private String attendanceDate;
	private String status;
	private String leaveType;
	private String leaveReason;
	private String createdAt;
	private String updatedAt;

	public LeaveModel(int attendanceId, int employeeId, String attendanceDate, String status, String leaveType,
			String leaveReason, String createdAt, String updatedAt) {
		super();
		this.attendanceId = attendanceId;
		this.employeeId = employeeId;
		this.attendanceDate = attendanceDate;
		this.status = status;
		this.leaveType = leaveType;
		this.leaveReason = leaveReason;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
	}

	// Getters and Setters

	public int getAttendanceId() {
		return attendanceId;
	}

	public void setAttendanceId(int attendanceId) {
		this.attendanceId = attendanceId;
	}

	public int getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(int employeeId) {
		this.employeeId = employeeId;
	}

	public String getAttendanceDate() {
		return attendanceDate;
	}

	public void setAttendanceDate(String attendanceDate) {
		this.attendanceDate = attendanceDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}
}
