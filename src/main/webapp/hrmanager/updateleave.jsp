<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WorkNest</title>
<link rel="shortcut icon" type="image/png"
	href="/Employee_Management_System/assets/images/logos/favicon.png" />
<link rel="stylesheet"
	href="/Employee_Management_System/assets/css/styles.min.css" />
</head>

<body>

	<%
	String attendanceId = request.getParameter("attendance_id");
	String employeeId = request.getParameter("employee_id");
	String attendanceDate = request.getParameter("attendance_date");
	String status = request.getParameter("status");
	String leaveType = request.getParameter("leave_type");
	String leaveReason = request.getParameter("leave_reason");
	%>
	<!--  Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		<!-- Sidebar Start -->
		<%@include file="../layout/sidebar.jsp"%>
		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<%@include file="../layout/header.jsp"%>

			<!--  Header End -->
			<div class="container-fluid">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title fw-semibold mb-4">Enter Leave Details</h5>
						<div class="card">
							<div class="card-body">
								<form action="updateleave" method="post">
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Attendance
											ID</label> <input type="number" class="form-control"
											name="attendance_id" id="exampleInputEmail1"
											value="<%=attendanceId%>" readonly>
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Employee
											ID</label> <input type="number" class="form-control"
											name="employee_id" id="exampleInputEmail1"
											value="<%=employeeId%>" readonly>
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Attendance
											Date</label> <input type="date" class="form-control"
											name="attendance_date" id="exampleInputEmail1"
											value="<%=attendanceDate%>" required>
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Status</label>
										<select name="status" class="form-select">
											<option value="Present"
												<%="Present".equals(status) ? "selected" : ""%>>Present</option>
											<option value="Absent"
												<%="Absent".equals(status) ? "selected" : ""%>>Absent</option>
											<option value="Leave"
												<%="Leave".equals(status) ? "selected" : ""%>>Leave</option>
										</select>
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Leave
											Type (if on Leave):</label> <select name="leave_type"
											class="form-select">
											<option value="none"
												<%="none".equals(leaveType) ? "selected" : ""%>>None</option>
											<option value="Sick Leave"
												<%="Sick Leave".equals(leaveType) ? "selected" : ""%>>Sick
												Leave</option>
											<option value="Casual Leave"
												<%="Casual Leave".equals(leaveType) ? "selected" : ""%>>Casual
												Leave</option>
											<option value="Paid Leave"
												<%="Paid Leave".equals(leaveType) ? "selected" : ""%>>Paid
												Leave</option>
											<option value="Unpaid Leave"
												<%="Unpaid Leave".equals(leaveType) ? "selected" : ""%>>Unpaid
												Leave</option>
										</select>
									</div>

									<div class="mb-3">
										<%
										if (leaveReason.equals("null")) {
										%>
										<label for="exampleInputEmail1" class="form-label">Leave
											Reason (if applicable)</label> <input type="text"
											class="form-control" step="0.01" name="leave_reason"
											value="none" id="exampleInputEmail1">
										<%
										} else {
										%>
										<label for="exampleInputEmail1" class="form-label">Leave
											Reason (if applicable)</label> <input type="text"
											class="form-control" step="0.01" name="leave_reason"
											value="<%=leaveReason%>" id="exampleInputEmail1">

										<%
										}
										%>
									</div>
									<button type="submit" class="btn btn-primary">Submit</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="/Employee_Management_System/assets/libs/jquery/dist/jquery.min.js"></script>
	<script
		src="/Employee_Management_System/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/Employee_Management_System/assets/js/sidebarmenu.js"></script>
	<script src="/Employee_Management_System/assets/js/app.min.js"></script>
	<script
		src="/Employee_Management_System/assets/libs/simplebar/dist/simplebar.js"></script>
</body>

</html>