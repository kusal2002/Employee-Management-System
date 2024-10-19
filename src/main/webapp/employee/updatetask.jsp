<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.task.TaskDBUtil"%>
<%@page import="com.task.Task"%>



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
<title>My Tasks</title>
<link rel="shortcut icon" type="image/png"
	href="/Employee_Management_System/assets/images/logos/favicon.png" />
<link rel="stylesheet" href="/Employee_Management_System/assets/css/styles.min.css" />
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
						<h5 class="card-title fw-semibold mb-4">Add New Task</h5>
						<div class="card">
							<div class="card-body">

								<%
								int taskId = Integer.parseInt(request.getParameter("task_id"));
								TaskDBUtil taskdb = new TaskDBUtil();
								Task task = taskdb.getTaskById(taskId);

								if (task != null) {
								%>
								<form action="/Employee_Management_System/updateTaskServlet" method="post">
									<input type="hidden" name="task_id"
										value="<%=task.getTaskid()%>" />

									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Task
											Name</label> <input type="text" class="form-control" name="taskName"
											value="<%=task.getTaskname()%>" id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Description</label>
										<input type="text" class="form-control" name="description"
											value="<%=task.getDescription()%>" id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Status</label>
										<select name="status" class="form-select">
											<option value="Success"
												<%=task.getStatus().equals("Success") ? "selected" : ""%>>Success</option>
											<option value="Pending"
												<%=task.getStatus().equals("Pending") ? "selected" : ""%>>Pending</option>
										</select>
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Due
											Date</label> <input type="date" class="form-control" name="due_date"
											value="<%=task.getDueDate()%>" id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">User
											Id</label> <input type="text" class="form-control" name="user_id"
											value="<%=task.getUserId()%>" id="exampleInputEmail1">
									</div>


									<button type="submit" class="btn btn-primary">Submit</button>
								</form>

								<%
								} else {
								%>
								<p>Task not found.</p>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="/Employee_Management_System/assets/libs/jquery/dist/jquery.min.js"></script>
	<script src="/Employee_Management_System/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/Employee_Management_System/assets/js/sidebarmenu.js"></script>
	<script src="/Employee_Management_System/assets/js/app.min.js"></script>
	<script src="/Employee_Management_System/assets/libs/simplebar/dist/simplebar.js"></script>
</body>

</html>