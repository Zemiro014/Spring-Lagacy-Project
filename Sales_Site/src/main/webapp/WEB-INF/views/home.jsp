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
</head>

<script type="text/javascript">
	$(document).ready(function(){		
		$("#registerBtn").on("click",function(){
			location.href="client/registerNewClient";
		})
		$("#memberUpdateBtn").on("click",function(){
			location.href="client/memberUpdateView";
		})
	})
</script>
<style>
	body
	{
	  margin: 0;
	  padding: 0;
	  font-family: sans-serif;
	  background-color:#c8d1da;
	  background-size: cover;
	}
	.container
	{
		background-color:#060708;
		border-radius:10px;
	}
	.login-box{
	  width: 280px;
	  position: absolute;
	  top: 50%;
	  left: 50%;
	  transform: translate(-50%,-50%);
	  color: white;
	}
	.login-box h1{
	  float: left;
	  font-size: 40px;
	  border-bottom: 6px solid #4caf50;
	  margin-bottom: 50px;
	  padding: 13px 0;
	}
	.textbox{
	  width: 100%;
	  overflow: hidden;
	  font-size: 20px;
	  padding: 8px 0;
	  margin: 8px 0;
	  border-bottom: 1px solid #4caf50;
	}
	.textbox i{
	  width: 26px;
	  float: left;
	  text-align: center;
	}
	.textbox input{
	  border: none;
	  outline: none;
	  background: none;
	  color: white;
	  font-size: 18px;
	  width: 80%;
	  float: left;
	  margin: 0 10px;
	}
	.btn{
	  width: 100%;
	  background: none;
	  border: 2px solid #4caf50;
	  color: white;
	  padding: 5px;
	  font-size: 18px;
	  cursor: pointer;
	  margin: 12px 0;
	}
</style>
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
