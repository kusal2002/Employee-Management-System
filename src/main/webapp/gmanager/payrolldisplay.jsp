
<%@page import="com.payroll.PayrollModel"%>
<%@page import="com.payroll.PayrollController"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("/Employee_Management_System/login.jsp");
}
%>
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
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">

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
					<div class="col-lg-12 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body p-4">
								<div class="row align-items-end">
									<div class="col">

										<h5 class="card-title fw-semibold mb-4">Payroll</h5>
									</div>
									<div class="col ">
										<a href="/Employee_Management_System/gmanager/addPayroll.jsp">
											<button type="button" class="btn btn-primary m-1 float-end">Add
												Payroll</button>
										</a>
									</div>

								</div>

								<div class="table-responsive">
									<table class="table text-nowrap mb-0 align-middle">
										<thead class="text-dark fs-4">
											<tr>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Payroll ID</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Employee ID</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Pay Date</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Basic Salary</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Allowances</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Deductions</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Net Pay</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Action</h6>
												</th>
											</tr>
											</tr>
										</thead>
										<tbody>
											<%
											PayrollController payrolldb = new PayrollController();
											List<PayrollModel> payrolls = payrolldb.getAllPayrolls();

											if (payrolls != null && !payrolls.isEmpty()) {
												for (PayrollModel payroll : payrolls) {
											%>

											<tr>


												<td class="border-bottom-0"><h6
														class="fw-semibold mb-0">
														<%=payroll.getPayrollID()%>
													</h6></td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1">
														<%=payroll.getEmployeeID()%>
													</h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1">
														<%=payroll.getPayString()%>
													</h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1">
														<%=payroll.getBasicSalary()%>
													</h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1">
														<%=payroll.getAllowances()%>
													</h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1">
														<%=payroll.getDeductions()%>
													</h6>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1">
														<%=payroll.getNetPay()%>
													</h6>
												</td>

												<td class="border-bottom-0 align-items-center"><a
													href="updatepayroll.jsp?payrollID=<%=payroll.getPayrollID()%>&employeeID=<%=payroll.getEmployeeID()%>&payDate=<%=payroll.getPayString()%>&basicSalary=<%=payroll.getBasicSalary()%>&allowances=<%=payroll.getAllowances()%>&deductions=<%=payroll.getDeductions()%>&netPay=<%=payroll.getNetPay()%>">
														<button type="button" class="btn btn-success m-2">Edit</button>
												</a> <%-- <form action="/Employee_Management_System/DeletePayrollServlet"
														method="post" style="display: inline;">
														<input type="hidden" name="id" value="${payroll.payrollID}">
														<button type="submit" class="btn btn-danger m-2">Delete</button>
													</form> --%> <a
													href="/Employee_Management_System/gmanager/deletepayroll.jsp?payrollID=<%=payroll.getPayrollID()%>"
													onclick="return deletefunc(this);">
														<button type="button" class="btn btn-danger m-2">Delete</button>
												</a></td>

											</tr>


											<%
											}
											} else {
											%>
											<p>No tasks available.</p>
											<%
											}
											%>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
	function deletefunc(link) {
	    Swal.fire({
	        title: "Are you sure?",
	        text: "You won't be able to revert this!",
	        icon: "warning",
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "Yes, delete it!"
	    }).then((result) => {
	        if (result.isConfirmed) {
	            // Proceed with the deletion
	            window.location.href = link.href;
	        } else {
	            // If user cancels, do nothing
	            return false;
	        }
	    });
	    return false; // Prevent immediate link navigation
	}
		
	</script>

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