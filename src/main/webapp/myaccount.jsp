<!doctype html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.db.DBConnect"%>
<%@page import="java.sql.Connection"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Account</title>
<link rel="shortcut icon" type="image/png"
	href="/Employee_Management_System/assets/images/logos/favicon.png" />
<link rel="stylesheet"
	href="/Employee_Management_System/assets/css/styles.min.css" />
</head>

<body>

	<input type="hidden" id="status" value="<%=session.getAttribute("updatestatus")%>">
	
	<!-- Body Wrapper -->
	<div class="page-wrapper" id="main-wrapper" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed">
		
		<!-- Sidebar Start -->
		<%@include file="./layout/sidebar.jsp"%>
		<!-- Sidebar End -->
		
		<!-- Main wrapper -->
		<div class="body-wrapper">
			<!-- Header Start -->
			<%@include file="./layout/header.jsp"%>
			<!-- Header End -->
			
			<div class="container-fluid">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title fw-semibold mb-4">My Profile</h5>
						<div class="card">
							<div class="card-body">

								<%
								String name = (String) session.getAttribute("name");
								if (name == null) {
									response.sendRedirect("login.jsp");
								}

								try {
									Connection con = DBConnect.getConnection();
									String query = "SELECT * FROM users WHERE username = ?";
									PreparedStatement ps = con.prepareStatement(query);
									ps.setString(1, name);
									ResultSet rs = ps.executeQuery();

									if (rs.next()) {
								%>

								<form action="/Employee_Management_System/UpdateProfileServlet"
									method="post">
									<input type="text" name="id" hidden
										value="<%=rs.getString("user_id")%>">
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">User
											Name</label> <input type="text" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp" readonly
											name="username" value="<%=rs.getString("username")%>">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email</label>
										<input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											name="email" value="<%=rs.getString("email")%>">
									</div>
									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Password</label>
										<input type="password" class="form-control" name="password"
											value="<%=rs.getString("password")%>"
											id="exampleInputPassword1">
									</div>
									<input type="text" name="role" hidden
										value="<%=rs.getString("role")%>">
									<button type="submit" class="btn btn-primary">Update
										My Data</button>
								</form>

								<%
									}
									ps.close();
									con.close();
								} catch (Exception e) {
									e.printStackTrace();
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

	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			Swal.fire({
				title : "Update Failed!",
				text : "Could not update your profile.",
				icon : "error"
			});
		} else if (status == "success") {
			Swal.fire({
				title : "Update Successful!",
				text : "Your profile has been updated.",
				icon : "success"
			});
		}
		// Clear the session status attribute after showing the alert
		<% session.removeAttribute("updatestatus"); %>
	</script>
</body>

</html>
