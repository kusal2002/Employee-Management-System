<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Registration Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
		<div class="text-center mt-4 name">Twitter</div>
		<form class="p-3 mt-3" action="RegisterServlet" method="post">
			<div class="form-field d-flex align-items-center">
				<span class="far fa-user"></span> <input type="text" name="username"
					id="username" placeholder="Username">
			</div>
			<div class="form-field d-flex align-items-center">
				<span class="fas fa-key"></span> <input type="text"
					name="email" id="email" placeholder="Email">
			</div>
			<div class="form-field d-flex align-items-center">
				<span class="fas fa-key"></span> <input type="password"
					name="password" id="password" placeholder="Password">
			</div>
			<button class="btn mt-3" type="submit">Register</button>
		</form>
		<div class="text-center fs-6">
			<a href="#">Forget password?</a> or <a href="login.jsp">Sign in</a>
		</div>
	</div>






</body>

<script type="text/javascript">
	var status = document.getElementById("status").value;
	if (status == "success") {
		alert("Success");
	}
</script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</html>
