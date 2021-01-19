<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Model</title>
	
	<!-- Libs -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	
	<!-- Static resources: External files -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/manageModelCSS/manageModel.css"/> "/>
	<script src="<c:url value="/resources/js/manageModelJS/manageModel.js"/> "></script>
		
</head>

<body>
<div class="modelManager">
	<h4> Creat New Model</h4>
	<form class="container">		
		<div id="Option-radio-type">
			<h6>Select Type</h6>		
			<c:forEach items="${type}" var="Type">							
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="product_type_id" id="${Type.type}" value="${Type.id_type}" checked>
				  <label class="form-check-label" for="${Type.type}"> ${Type.type}</label>
				</div>
			</c:forEach>
		</div>
		
		<div id="Option-radio-brand">
			<h6>Select Brand</h6>
			<c:forEach items="${brand}" var="Brand">							
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="brand_product" id="${Brand.brand}" value="${Brand.id_brand}" checked>
				  <label class="form-check-label" for="${Brand.brand}"> ${Brand.brand}</label>
				</div>
			</c:forEach>
		</div>
		
		<br>
		
		<div class="col inputModel">
	    	<input type="text" class="form-control" placeholder="Enter model" aria-label="model" name="model">
	  </div>
	  
	   <br>
	   
	  <div id="btns">
	  	<button type="button" class="btn btn-secondary btn-cancel">Cancel</button>
	   	<button type="button" class="btn btn-primary btn-confirm">Confirm</button>	   	
	  </div>
	</form>
	
	<div class="monitor">
		<div class="display">
			<table id="mytable" class="table">
				<thead class="thead-dark">
				 <tr> 
				 	<th scope="col">ID</th><th scope="col">MODEL</th> <th scope="col">PRODUCT_TYPE_ID</th>
				 </tr>
				</thead>				  
			</table>
		</div>
		<div class="functions">
			<div id="div_brand" class="form-group col-md-4">
				List Models Of:
				<select id="product_brand" class="form-control" name="id_brand">
					<option selected value="...">....</option>
					<c:forEach items="${brand}" var="Brand">
						<option value="${Brand.id_brand}">${Brand.brand}</option>
					</c:forEach>
				</select>
			</div>
			<button type="button" class="btn btn-success btn-list">List all model</button>
			<button type="button" class="btn btn-warning">Update</button>
			<button type="button" class="btn btn-danger">Delete</button>
		</div>
	</div>
</div>

	<!-- Light box: will be displayed in a div -->
    
	<div class="mw_layer">
		<div class="bg"></div>
		<div id="layer"></div>
	</div>
	
</body>
</html>