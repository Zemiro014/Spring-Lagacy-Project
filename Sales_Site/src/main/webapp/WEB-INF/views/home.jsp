<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
	<title>Home</title>
	
	<!-- Modern combined and minimized CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- Additional themes -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
		<!-- Static resources: External files -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/homeCSS/home.css"/> "/>
	<script src="<c:url value="/resources/js/homeJS/home.js"/> "></script>
</head>

<body>
<div class="login-box">
<h1> Login </h1>	
			<form class="container" name='homeForm' method="post" action="/client/loginClient">
				<c:if test="${client == null}">
					<div class="textbox form-group has-feedback">
						<i class="fas fa-lock"></i>
						<input class="form-control" type="text" id="user_" name="user_" placeholder="User">
					</div>
					<div class="textbox form-group has-feedback">
						<i class="fas fa-lock"></i>
						<input class="form-control" type="password" id="password" name="password" placeholder="Password">
					</div>
					<div class="textbox form-group has-feedback">
						<button class="btn btn-success" type="submit">login</button>
						<button class="btn btn-warning" id="registerBtn" type="button">Sign Up</button>
					</div>
				</c:if> 
				
				<c:if test="${client != null }">
					<div class="form-group has-feedback">
						<p>${client.user_} Welcome.</p>
						<button class="btn btn-success" id="memberUpdateBtn" type="button">Member information modification</button>
						<button class="btn btn-success" id="logoutBtn" type="button">Log out</button>
					</div>
				</c:if>
				<c:if test="${msg == false}">
					<p style="color: red;">Login failed! Please check your User and your Password.</p>
				</c:if> 
			</form>
	</div>
</body>
</html>
