
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
						<h5 class="card-title fw-semibold mb-4">Update User</h5>
						<div class="card">
							<div class="card-body">


								<%
								String id = request.getParameter("id");
								String username = request.getParameter("username");
								String password = request.getParameter("password");
								String email = request.getParameter("email");
								String rolee = request.getParameter("role");
								%>

								<form action="employeeupdate" method="post">
								 <input type="text" class="form-control" name="id"
											value="<%=id%>" id="exampleInputEmail1" hidden>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">User
											Name</label> <input type="text" class="form-control" name="username"
											value="<%=username%>" id="exampleInputEmail1">
									</div>

									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email</label>
										<input type="text" class="form-control" name="email"
											value="<%=email%>" id="exampleInputEmail1">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Role</label>
										<select name="role" class="form-select">
											<!-- <option value="1">Admin</option>
											<option value="2">General Manager</option>
											<option value="3">HR Manager</option>
											<option value="4">Employee</option> -->
											<option value="1"
												<%="1".equals(rolee) ? "selected" : ""%> >Admin</option>
											<option value="2"
												<%="2".equals(rolee) ? "selected" : ""%>>General
												Manager</option>
											<option value="3"
												<%="3".equals(rolee) ? "selected" : ""%>>HR Manager</option>
											<option value="4"
												<%="4".equals(rolee) ? "selected" : ""%>>Employee</option>

										</select>
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