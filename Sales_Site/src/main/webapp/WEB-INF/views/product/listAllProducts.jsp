<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>

<script type="text/javascript">
		$(document).ready(function(){
			
			$(".newProduct").on("click", function(){
				location.href="/product/newProduct";
			})
		})
</script>
<style>
body
{
	padding-top: 2%;
	padding-left: 9%;
	padding-right:5%;
}
.box 
{
	height:50%;
	width:100%;
	overflow-y: scroll;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
						0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.btn
{
	border:none;
	background-color:white;
	color:black;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
				0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>
<body>		
<div class="box">
	<div class="filters">
	
	</div>
	<form class="container" role="form">				
		<table class="table">
			<thead class="thead-dark">
			 <tr> 
			 <th scope="col">#</th><th scope="col">Name</th> <th scope="col">Price R$</th><th scope="col">Description</th> <th scope="col">Type</th> <th scope="col">Model</th> <th scope="col">Brand</th>
			 </tr>
			</thead>
						  
			<c:forEach items="${product}" var="product">
			<tbody>
			<tr>
			<th scope="row"> <a href="#"><c:out value="${product.id_product}"/></a></th>
			<td><c:out value="${product.product_name}"/></td>
			<td><c:out value="${product.product_price}"/></td>
			<td><c:out value="${product.product_descri}"/></td>
			<td><c:out value="${product.type}"/></td>
			<td><c:out value="${product.model}"/></td>
			<td><c:out value="${product.brand}"/></td>					     
			</tr>
			</tbody>
			</c:forEach>				  
		</table>
	</form>
</div><br>
<div class="boxButton">
	<div class="buttons">
		<button class="btn btn-primary newProduct" type="submit">New</button>
		<button class="btn btn-warning" type="submit">Update</button>
		<button class="btn btn-danger" type="submit">Delete</button>
	</div>
	<form>
	</form>
</div>			
</body>
</html>