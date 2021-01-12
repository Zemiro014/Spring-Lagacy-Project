<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Model</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<style>
	body
	{	
		padding:none;
		margin:0px;	
	}
	.modelManager
	{
		background-color:#c8d1da;
		margin: auto;
		width: 100%;
		height: 100vh;
		border-style: ridge;
		border-radius:10px;
	}
	.modelManager h4
	{
		padding-left:4%;
	}
	.container
	{
		position:relative;
		background-color:#c8d1da;
		height:90%;
		width:18%;
		top:0;
		right:40%;
		border-radius:10px;
	}
	.monitor
	{
		position:relative;
		background-color:#c8d1da;
		height:90%;
		width:80%;
		top:-90%;
		right:-19.5%;
		border-radius:10px;
	}
	.display
	{
		background-color:white;
		position:absolute;
		height:82%;
		width:100%;
		margin: auto;
		border-radius:10px;
		overflow-y: auto;
	}
	.functions
	{
		border-style: outset;
		position:absolute;
		right:0;
		top:82.5%;
		height:14%;
		width:100%;
		display: flex;
		align-items: center;
		justify-content: center;
		border-radius:10px;
	}
	#Option-radio-type, #Option-radio-brand
	{
		border-style: ridge;
		width:90%;
		height:35%;
		border-radius:10px;
		background-color:#d2d9e1;
		padding-left:2%;
		padding-top:1%;
		right:5%;
	}
	
	#Option-radio-type h6, #Option-radio-brand h6
	{
		text-align:center;	
	}
	#Option-radio-type
	{
		position:absolute;	
		top:1%;
	}
	#Option-radio-brand
	{
		position:absolute;
		top:37%;
	}
	.inputModel
	{
		position:absolute;
		height: 55px;
		width: 90%;
		border-style: ridge;
		padding-top:1.8%;
		padding-left:0.5%;
		padding-right:0.5%;
		right:5%;
		top:73.5%;
		border-radius:10px;
	}
	#btns
	{	
		position:absolute;
		right:50%;
		top:87%;
		border-radius:10px;
		width:30%;
		display:flex;
	}
	.btn-secondary, .btn-primary, .btn-success, .btn-warning, .btn-danger
	{
		border-style: 3px dotted black;	
		background-color:#c8d1da;
		color:black;
		border-radius:5px;
		border-bottom:2px solid rgba(0,0,0,0.3);
		font-weight:600;
	}
	.btn-success, .btn-warning, .btn-danger, #div_brand
	{
		margin-right: 3%;
		widht:20%;		
	}
	#product_brand
	{
	
		width:40%;
	}
	.btn-secondary, .btn-primary
	{
		margin-right: 3%;
	}
	
	#mytable {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#mytable td, #mytable th {
  border: 1px solid #ddd;
  padding: 8px;
}

#mytable tr:nth-child(even){background-color: #f2f2f2;}

#mytable tr:hover {background-color: #ddd;}

#mytable th 
{
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}

#mytable .thead-dark tr
{
position: sticky;
}
</style>

<script type="text/javascript">
$(document).ready(function(){

	$(".btn-list").on('click', function(){
		var dataToSend = {};
	    dataToSend["id_brand"] = $("#product_brand").val();
	    debugger;
		$('#mytable tbody').empty();
		$.ajax({
			url : "/product/listAllModel",
			type : "post",
			data : dataToSend,
			success : function(data)
		    {
	            $.each(data, function(index,item) 
	           	{	            	
	            
	            	$('.table').append(
	            							'<tbody><tr> <td>'+(item.model_id)+'</td> <td>'+(item.model)+'</td> <td>'+(item.product_type_id)+'</td> </tr></tbody>'
	            						);
	            });
		    },
			error: function() { alert("Error to get list all model !!") },
		})
	})
	
	$(".btn-confirm").on('click', function(){
	    var dataToSend = {};
	    dataToSend["product_type_id"] = $("input[name='type_product']:checked").val();
	    dataToSend["id_brand"] = $("input[name='brand_product']:checked").val();
	    dataToSend["model"] = $("input[name='model']").val();
		$.ajax({
			url:"/product/manageModel",
			type:"post",
			dataType : "json",
			data:dataToSend,
		})
	})
	
	$(".btn-cancel").on('click', function(){
		$("input[name='model']").val('');
	})
})
</script>
<body>
<div class="modelManager">
	<h4> Creat New Model</h4>
	<form class="container">		
		<div id="Option-radio-type">
			<h6>Select Type</h6>		
			<c:forEach items="${type}" var="Type">							
				<div class="form-check">
				  <input class="form-check-input" type="radio" name="type_product" id="${Type.type}" value="${Type.id_type}" checked>
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
	
</body>
</html>