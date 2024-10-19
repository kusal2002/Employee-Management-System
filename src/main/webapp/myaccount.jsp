<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>WorkNest</title>
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
		<%@include file="./layout/sidebar.jsp"%>
		<!--  Sidebar End -->
		<!--  Main wrapper -->
		<div class="body-wrapper">
			<!--  Header Start -->
			<%@include file="./layout/header.jsp"%>

			<!--  Header End -->
			<div class="container-fluid">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title fw-semibold mb-4">My Profile</h5>
						<div class="card">
							<div class="card-body">
								<form>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">User Name</label> <input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp">
									</div>
									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email</label> <input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp">
									</div>
									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Password</label>
										<input type="password" class="form-control"
											id="exampleInputPassword1">
									</div>
									<button type="submit" class="btn btn-primary">Update My Data</button>
								</form>
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