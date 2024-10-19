<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Tasks</title>
<link rel="shortcut icon" type="image/png"
	href="/Employee_Management_System/assets/images/logos/favicon.png" />
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
				<div class="card">
					<div class="card-body">
						<h5 class="card-title fw-semibold mb-4">Add New Payroll</h5>
						<div class="card">
							<div class="card-body">
								<form action="insertpayroll"
									method="post">
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Employee
											ID</label> <input type="number" class="form-control"
											name="employeeID" id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Pay
											Date</label> <input type="date" class="form-control" name="payDate"
											id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Basic
											Salary</label> <input type="number" class="form-control" step="0.01"
											name="basicSalary" id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Allowances</label>
										<input type="number" class="form-control" step="0.01"
											name="allowances" id="exampleInputEmail1">
									</div>

									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Deductions</label>
										<input type="number" class="form-control" step="0.01"
											name="deductions" id="exampleInputEmail1">
									</div>


									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Net
											Pay</label> <input type="number" class="form-control" step="0.01"
											name="netPay" id="exampleInputEmail1">
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