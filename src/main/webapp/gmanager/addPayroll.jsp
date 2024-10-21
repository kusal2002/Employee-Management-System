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
<script>
    // Function to auto-calculate Net Pay
    function calculateNetPay() {
        // Get the values from the input fields
        let basicSalary = parseFloat(document.getElementById('basicSalary').value) || 0;
        let allowances = parseFloat(document.getElementById('allowances').value) || 0;
        let deductions = parseFloat(document.getElementById('deductions').value) || 0;

        // Calculate the Net Pay
        let netPay = basicSalary + allowances - deductions;

        // Set the calculated net pay to the netPay input field
        document.getElementById('netPay').value = netPay.toFixed(2);
    }
</script>
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
										<label for="employeeID" class="form-label">Employee ID</label> 
										<input type="number" class="form-control" name="employeeID" id="employeeID" required>
									</div>
									<div class="mb-3">
										<label for="payDate" class="form-label">Pay Date</label> 
										<input type="date" class="form-control" name="payDate" id="payDate" required>
									</div>
									<div class="mb-3">
										<label for="basicSalary" class="form-label">Basic Salary</label> 
										<input type="number" class="form-control" step="0.01" name="basicSalary" id="basicSalary" oninput="calculateNetPay()" required>
									</div>
									<div class="mb-3">
										<label for="allowances" class="form-label">Allowances</label>
										<input type="number" class="form-control" step="0.01" name="allowances" id="allowances" oninput="calculateNetPay()">
									</div>
									<div class="mb-3">
										<label for="deductions" class="form-label">Deductions</label>
										<input type="number" class="form-control" step="0.02" name="deductions" id="deductions" oninput="calculateNetPay()">
									</div>

									<div class="mb-3">
										<label for="netPay" class="form-label">Net Pay</label> 
										<input type="number" class="form-control" step="0.01" name="netPay" id="netPay" readonly>
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
