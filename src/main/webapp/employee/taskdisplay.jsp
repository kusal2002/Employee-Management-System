<%@page import="com.task.TaskDBUtil"%>
<%@page import="com.task.Task"%>
<%@ page import="java.util.List"%>

<%
if (session.getAttribute("name") == null) {
	response.sendRedirect("/Employee_Management_System/login.jsp");
}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Employee</title>
<link rel="shortcut icon" type="image/png"
	href="/Employee_Management_System/assets/images/logos/favicon.png" />
<link rel="stylesheet"
	href="/Employee_Management_System/assets/css/styles.min.css" />
</head>

<body>
	<input type="hidden" id="taskstatus"
		value="<%=session.getAttribute("taskstatus")%>">
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

										<h5 class="card-title fw-semibold mb-4">My Task</h5>
									</div>
									<div class="col ">
										<a href="/Employee_Management_System/employee/createtask.jsp">
											<button type="button" class="btn btn-primary m-1 float-end">Add
												New Task</button>
										</a>
									</div>

								</div>



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
												<th class="border-bottom-0">
													<h6 class="fw-semibold mb-0">Action</h6>
												</th>
											</tr>
										</thead>
										<tbody>
											<%
											int userId = Integer.parseInt((String) session.getAttribute("id"));
											TaskDBUtil taskdb = new TaskDBUtil();
											List<Task> tasks = taskdb.getAll(userId);

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
												<td class="border-bottom-0 align-items-center"><a
													href="/Employee_Management_System/employee/updatetask.jsp?task_id=<%=task.getTaskid()%>">
														<button type="button" class="btn btn-success m-2">Edit</button>
												</a> <a
													href="/Employee_Management_System/employee/deleteTask.jsp?task_id=<%=task.getTaskid()%>"
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
		var status = document.getElementById("taskstatus").value;
		if (status == "failed") {
			Swal.fire({
				title : "Update Failed!",
				text : "Could not update your task.",
				icon : "error"
			});
		} else if (status == "success") {
			Swal.fire({
				title : "Update Successful!",
				text : "Your task has been updated.",
				icon : "success"
			});
		}
		// Clear the session status attribute after showing the alert
	<%session.removeAttribute("taskstatus");%>

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

</html>