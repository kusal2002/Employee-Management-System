<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.task.TaskDBUtil"%>
<%@page import="com.task.Task"%>
<%@ page import="java.util.List"%>

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
					<div class="col-lg-4 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body p-4">
								<div class="mb-4">
									<h5 class="card-title fw-semibold">Recent Transactions</h5>
								</div>
								<ul class="timeline-widget mb-0 position-relative mb-n5">
									<li
										class="timeline-item d-flex position-relative overflow-hidden">
										<div class="timeline-time text-dark flex-shrink-0 text-end">09:30</div>
										<div
											class="timeline-badge-wrap d-flex flex-column align-items-center">
											<span
												class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
											<span class="timeline-badge-border d-block flex-shrink-0"></span>
										</div>
										<div class="timeline-desc fs-3 text-dark mt-n1">Payment
											received from John Doe of $385.90</div>
									</li>
									<li
										class="timeline-item d-flex position-relative overflow-hidden">
										<div class="timeline-time text-dark flex-shrink-0 text-end">10:00
											am</div>
										<div
											class="timeline-badge-wrap d-flex flex-column align-items-center">
											<span
												class="timeline-badge border-2 border border-info flex-shrink-0 my-8"></span>
											<span class="timeline-badge-border d-block flex-shrink-0"></span>
										</div>
										<div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">
											New sale recorded <a href="javascript:void(0)"
												class="text-primary d-block fw-normal">#ML-3467</a>
										</div>
									</li>
									<li
										class="timeline-item d-flex position-relative overflow-hidden">
										<div class="timeline-time text-dark flex-shrink-0 text-end">12:00
											am</div>
										<div
											class="timeline-badge-wrap d-flex flex-column align-items-center">
											<span
												class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
											<span class="timeline-badge-border d-block flex-shrink-0"></span>
										</div>
										<div class="timeline-desc fs-3 text-dark mt-n1">Payment
											was made of $64.95 to Michael</div>
									</li>
									<li
										class="timeline-item d-flex position-relative overflow-hidden">
										<div class="timeline-time text-dark flex-shrink-0 text-end">09:30
											am</div>
										<div
											class="timeline-badge-wrap d-flex flex-column align-items-center">
											<span
												class="timeline-badge border-2 border border-warning flex-shrink-0 my-8"></span>
											<span class="timeline-badge-border d-block flex-shrink-0"></span>
										</div>
										<div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">
											New sale recorded <a href="javascript:void(0)"
												class="text-primary d-block fw-normal">#ML-3467</a>
										</div>
									</li>
									<li
										class="timeline-item d-flex position-relative overflow-hidden">
										<div class="timeline-time text-dark flex-shrink-0 text-end">09:30
											am</div>
										<div
											class="timeline-badge-wrap d-flex flex-column align-items-center">
											<span
												class="timeline-badge border-2 border border-danger flex-shrink-0 my-8"></span>
											<span class="timeline-badge-border d-block flex-shrink-0"></span>
										</div>
										<div class="timeline-desc fs-3 text-dark mt-n1 fw-semibold">New
											arrival recorded</div>
									</li>
									<li
										class="timeline-item d-flex position-relative overflow-hidden">
										<div class="timeline-time text-dark flex-shrink-0 text-end">12:00
											am</div>
										<div
											class="timeline-badge-wrap d-flex flex-column align-items-center">
											<span
												class="timeline-badge border-2 border border-success flex-shrink-0 my-8"></span>
										</div>
										<div class="timeline-desc fs-3 text-dark mt-n1">Payment
											Done</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-lg-8 d-flex align-items-stretch">
						<div class="card w-100">
							<div class="card-body p-4">
								<h5 class="card-title fw-semibold mb-4">Recent Transactions</h5>
								<div class="table-responsive">
									<table class="table text-nowrap mb-0 align-middle">
										<thead class="text-dark fs-4">
											<tr>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Task Id</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Task Title</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Task Description</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Status</h6>
												</th>
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Due Date</h6>
												</th>

											</tr>
										</thead>
										<tbody>
											<%
											TaskDBUtil taskdb = new TaskDBUtil();
											List<Task> tasks = taskdb.getAll();

											if (tasks != null && !tasks.isEmpty()) {
												for (Task task : tasks) {
											%>
											<tr>


												<td class="border-bottom-0"><h6
														class="fw-semibold mb-0"><%=task.getTaskid()%></h6></td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-1"><%=task.getTaskname()%></h6>
												</td>
												<td class="border-bottom-0">
													<p class="mb-0 fw-normal"><%=task.getDescription()%></p>
												</td>
												<td class="border-bottom-0">
													<div class="d-flex align-items-center gap-2">
														<%
														if (task.getStatus().equals("Pending")) {
														%>
														<span class="badge bg-warning rounded-3 fw-semibold">Pending</span>
														<%
														} else if (task.getStatus().equals("Success")) {
														%>
														<span class="badge bg-primary rounded-3 fw-semibold">Success</span>
														<%
														} else {
														%>
														<span class="badge bg-primary rounded-3 fw-semibold">Not
															Set</span>
														<%
														}
														%>
													</div>
												</td>
												<td class="border-bottom-0">
													<h6 class="fw-semibold mb-0 fs-4"><%=task.getDueDate()%></h6>
												</td>
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