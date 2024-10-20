<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("/Employee_Management_System/login.jsp");
}
%>


<%@ page import="java.sql.*"%>
<%
Statement stmt = null;
ResultSet rs = null;
int totalEmployees = 0;
double totalNetPay = 0.0;

try {
	Connection conn = DBConnect.getConnection();

	stmt = conn.createStatement();

	// Get total employees
	String totalEmployeesQuery = "SELECT COUNT(*) AS totalEmployees FROM users"; // Adjust your table name
	rs = stmt.executeQuery(totalEmployeesQuery);
	if (rs.next()) {
		totalEmployees = rs.getInt("totalEmployees");
	}

	// Get total net pay
	String totalNetPayQuery = "SELECT SUM(NetPay) AS totalNetPay FROM Payroll";
	rs = stmt.executeQuery(totalNetPayQuery);
	if (rs.next()) {
		totalNetPay = rs.getDouble("totalNetPay");
	}
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (rs != null)
		rs.close();
	if (stmt != null)
		stmt.close();
}
%>


<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin</title>
<link rel="shortcut icon" type="image/png"
	href="./Employee_Management_System/assets/images/logos/favicon.png" />
<link rel="stylesheet"
	href="/Employee_Management_System/assets/css/styles.min.css" />
</head>

<body>
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
				<!--  Row 1 -->

				<div class="row">

					<div class="col-lg-8 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="row">
								<!-- Total Employees -->
								<div class="col-lg-4">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title mb-9 fw-semibold">Total Employees</h5>
											<h4 class="fw-semibold mb-3"><%=totalEmployees%></h4>
										</div>
									</div>
								</div>

								<!-- Total Net Pay -->
								<div class="col-lg-4">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title mb-9 fw-semibold">Total Net Pay</h5>
											<h4 class="fw-semibold mb-3">
												$<%=String.format("%.2f", totalNetPay)%></h4>
										</div>
									</div>
								</div>
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
		src="/Employee_Management_System/assets/libs/apexcharts/dist/apexcharts.min.js"></script>
	<script
		src="/Employee_Management_System/assets/libs/simplebar/dist/simplebar.js"></script>
	<script src="/Employee_Management_System/assets/js/dashboard.js"></script>
</body>

</html>