<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Login Page</title>
<link rel="stylesheet" href="css/loginregister.css">
</head>
<body>
	<input type="hidden" id="status"
		value="<%=request.getAttribute("status")%>">


	<div class="wrapper">
		<div class="logo">
			<img
				src="https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-bird-symbols-png-logo-0.png"
				alt="">
		</div>
		<div class="text-center mt-4 name">Login</div>
		<form class="p-3 mt-3" action="LoginServlet" method="post">
			<div class="form-field d-flex align-items-center">
				<span class="far fa-user"></span> <input type="text" name="username"
					id="username" placeholder="Username">
			</div>
			<div class="form-field d-flex align-items-center">
				<span class="fas fa-key"></span> <input type="password"
					name="password" id="password" placeholder="Password">
			</div>
			<button class="btn mt-3" type="submit">Login</button>
		</form>
		<div class="text-center fs-6">
			<a href="#">Forget password?</a> or <a href="register.jsp">Sign
				up</a>
		</div>
	</div>






	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
		var status = document.getElementById("status").value;
		if (status == "failed") {
			Swal.fire({
				title : "Wrong!",
				text : "You clicked the button!",
				icon : "success"
			});
		}else if (status == "success") {
			Swal.fire({
				title : "Good job!",
				text : "You clicked the button!",
				icon : "success"
			});
		}
	</script>
</body>
</html>
