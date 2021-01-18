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
</head>
<style>
body
{
	color:white;
}
.newProduct
{
	background-color:#c8d1da;
	margin: auto;
	width: 100%;
	height: 100vh;	
}
.display
{
	position:absolute;
	top:1%;
	width: 99%;
	height:68%;
	background-color:white;
	left:0.5%;
	right:0.5%;
	border-style: ridge;
	overflow-y: auto;
}
.functions
{
	position:relative;
	top:70%;
	width: 99%;
	height:30%;
	background-color:#c8d1da;
	left:0.5%;
	right:0.5%;
}
.cadastre
{
	top:0;
	position:absolute;
	width: 70%;
	height:100%;
	background-color:#c8d1da;
	text-align: center;

}
.container
{
	top:0;
	position:absolute;
	width: 100%;
	height:100%;
	background-color:#c8d1da;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
				0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
.filter
{
	top:0;
	position:absolute;
	width: 30%;
	height:100%;
	background-color:#34404d;
}
.filter div
{
	width: 96%;
	padding-left:2%;
	padding-right:2%;
}
.inputData
{
	top:0;
	position:absolute;
	width: 50%;
	height:100%;
	background-color:#34404d;
	left:30%;
	padding-top:2%;
}
.inputData input
{
	width: 96%;
	padding-top:2%;
	padding-left:2%;
	padding-right:2%;
}
.inputImage
{
	padding-top:2%;
	top:0;
	position:absolute;
	width: 20%;
	height:100%;
	background-color:#34404d;
	right:0;
	margin: auto;
  	text-align: center;
}
.holder 
{
	top:0;
	height: 60%; 
	width: 100%; 
	border: 2px solid black;
	background-color:red;
}
img 
{ 
	max-width: 100%; 
   	max-height: 100%; 
   	min-width: 100%; 
   	min-height: 100%;
   	background-color:white;
} 
input[type="file"]
{ 
 margin-top: 5px; 
}
.btnSignIn
{
	position:absolute;
	top:75%;
	width:40%;
	right:30%;
}
input[type=file]
{ 
	color:transparent;
}
.managment
{
	top:0;
	position:absolute;
	width: 30%;
	height:100%;
	background-color:#c8d1da;
	right:0;
}
.top
{
	top:0;
	position:absolute;
	width: 100%;
	height:40%;
	background-color:#c8d1da;
	right:0;
	display: flex;
	align-items: center;
	justify-content: center;
	border-style: ridge;
}
.btn-success, .btn-warning, .btn-danger, .btn-secondary
{
	border-style: 3px dotted black;	
	background-color:#c8d1da;
	color:black;
	border-radius:5px;
	border-bottom:2px solid rgba(0,0,0,0.3);
	font-weight:600;
}
.btn-success, .btn-warning, .btn-danger, .btn-secondary
{
	margin-right: 3%;
	widht:10%;
}
.bottom
{
	top:40%;
	position:absolute;
	width: 100%;
	height:60%;
	background-color:#c8d1da;
	right:0;
}
.bottom h6
{
	text-align: center;
}
#manage
{
	padding-top:3%;
	position: absolute;
	width:70%;
	right:15%;
	left:15%;
	height:50%;
	background-color:#c8d1da;	
	display: flex;
	align-items: center;
	justify-content: center;
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
	
			$(".btnNewProduct").on("click", function(){
				  var price = $("#price").val();
				  var float_number = parseFloat(price);
				  $("#price").attr("value",float_number)
				  
				  var formObj = $("form[name='new_product']");
				  
				  formObj.attr("action", "/product/newProduct");
				  formObj.submit();
				});			
})


$(document).ready(function(){

	$(".productType").change(function(){
		
		$("#product_brand").empty();
		$.ajax({
			url : "/product/listBrand",
			type : "post",
			dataType : "json",
			success : function(data)
		    {
	            $.each(data, function(index,item) 
	           	{
	            	var brand_ = item.brand;
	            	var id_Brand = item.id_brand;
	            	
	            	debugger;
	            	$('#product_brand').append('<option selected="" value="'+(id_Brand)+'">'+(brand_)+'</option>');
	            });
		    },
			error: function() { alert("Error to get model !!") },
		})
	})
	
	$( ".product_brand" ).change(function() {
	    var data_to_send = {};
		data_to_send["id_type"] = $("#product_type").val();
		data_to_send["id_brand"] = $("#product_brand").val();
		
		$("#product_model").empty();
			$.ajax({
				url : "/product/listModel",
				type : "post",
				dataType : "json",
				data: data_to_send,
				success : function(data)
			    {
		            $.each(data, function(index,item) 
		           	{		            	
		            	var id_Model = item.model_id;
		            	var model_ = item.model;
		            	debugger;
		            	$('#product_model').append('<option selected="" value="'+(id_Model)+'">'+(model_)+'</option>');
		            });
			    },
				error: function() { alert("Error to get model !!") },
			})
		})	
		
		$('#manageModel').on('click', function(){
			location.href="/product/manageModel";
		})
		
		$(".btn-list").on('click', function(){
		$('#mytable tbody').empty();
		$.ajax({
			url : "/product/listAllProducts",
			type : "post",
			success : function(data)
		    {
	            $.each(data, function(index,item) 
	           	{	            	
	            	debugger;
	            	$('.table').append(
	            						'<tbody><tr> <td>'+(item.id_product)+'</td> <td>'+(item.product_name)+'</td> <td>'+(item.product_price)+'</td> <td>'+(item.product_descri)+'</td><td>'+(item.type)+'</td> <td>'+(item.model)+'</td> <td>'+(item.brand)+'</td></tr></tbody>'
	            						);
	            });
		    },
			error: function() { alert("Error to get list all model !!") },
		})
	})
	
		$("#files").change(function() {
			  filename = this.files[0].name
			  console.log(filename);
			});
})

$(document).ready(() => { 
                $("#photo").change(function () { 
                    const file = this.files[0]; 
                    if (file) { 
                        let reader = new FileReader(); 
                        reader.onload = function (event) { 
                            $("#imgPreview") 
                              .attr("src", event.target.result); 
                        }; 
                        reader.readAsDataURL(file); 
                    } 
                }); 
            }); 
</script>
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