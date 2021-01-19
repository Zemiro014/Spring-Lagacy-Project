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
	<!-- Script to preview image -->
	<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
	
	<!-- Static resources: External files -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/newProductCSS/newProduct.css"/> "/>
	<script src="<c:url value="/resources/js/newProductJS/newProduct.js"/> "></script>
</head>


<body>
	<div class="newProduct">
		<div class="display">
			<table id="mytable" class="table">
				<thead class="thead-dark">
				 <tr> 
				 	<th scope="col">ID</th><th scope="col">Name</th> <th scope="col">Price R$</th><th scope="col">Description</th> <th scope="col">Type</th> <th scope="col">Model</th> <th scope="col">Brand</th>
				 </tr>
				</thead>				  
			</table>			
		</div>		
		<div class="functions">
			<div class="cadastre">
				<form name="new_product" class="form container" role="form" method="post" action="/product/newProduct" enctype="multipart/form-data">
					<div class="filter">
						<div id="div_type" class="form-group col-md-4">
							Select type:
							<select id="product_type" class="form-control productType" name="id_type">
							<option selected value="...">....</option>
							<c:forEach items="${type}" var="Type">
							<option value="${Type.id_type}">${Type.type}</option>
							</c:forEach>
							</select>
						</div>
						<div id ="div_brand" class="form-group col-md-4">
							Select brand:
							<select id="product_brand" class="form-control product_brand" name="id_brand">
								<option selected value="...">....</option>	
							</select>
						</div>
						<div id ="div_model" class="form-group col-md-4">
							Select model:
							<select id="product_model" class="form-control" name="id_model">
								<option selected value="...">....</option>
							</select>
						</div>	
					</div>
					<div class="inputData">
						<div class="row">
						  <div class="col">
						    <input type="text" class="form-control" placeholder="Product Name" aria-label="First name" name="product_name">
						  </div>
						  <div class="col">
						    <input type="text" class="form-control" placeholder="Price" aria-label="Last name" name="product_price" id="price">
						  </div>
						</div> <br>
						<div class="row">
						  <div class="col">
						    <input type="text" class="form-control" placeholder="State" aria-label="First name" name="product_state">
						  </div>
						  <div class="col">
						    <input type="text" class="form-control" placeholder="Description" aria-label="Last name" name="product_descri">
						  </div>
						</div>
						<button type="submit" class="btnSignIn btn btn-primary">Register</button>
					</div>
					
					<div class="inputImage">
						<div class="holder"> 
			                <img id="imgPreview" src="#" alt="pic" /> 
			            </div> 
            			<input type="file" name="file" id="photo" required="true"/> 
					</div>
				</form>
				
				<!-- Light box: will be displayed in a div -->    
				<div class="mw_layer">
					<div class="bg"></div>
					<div id="layer"></div>
				</div>
			</div>
			
			<div class="managment">
				<div class="top">
					<button type="button" class="btn btn-success btn-list">All products</button>
					<button type="button" class="btn btn-warning">Update</button>
					<button type="button" class="btn btn-danger">Delete</button>
				</div>
				<div class="bottom">
					<h6>Managment Advanced</h6>
					<div id="manage" class="btn-group">
						<button type="button" class="btn btn-secondary">TYPE</button>
						<button type="button" class="btn btn-secondary">BRAND</button>
						<button type="button" id="manageModel" class="btn btn-secondary">MODEL</button>
					</div>
				</div>
			</div>
		</div>		
	</div>
</body>
</html>