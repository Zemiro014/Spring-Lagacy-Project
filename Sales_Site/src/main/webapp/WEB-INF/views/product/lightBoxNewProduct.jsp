<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>

<script>
function deleteArticle(idx)
{
	 $.ajax({
		   type:'post',
		   url:'/product/deleteProduct',
		   data: ({id_product:id_product}),
		   success:function(data){
			   console.log(data);
			  if(data.status == "success"){
				  alert("Has been deleted.");
				  location.reload();
			}
		}
	});
}
</script>			

	<table style="width: 580px;">					

		<caption>View Product</caption>						

		<tr>
			<th>ID</th>						

			<td>${getProduct.id_product}</td>

			<th>State</th>

			<td>${getProduct.product_state}</td>

			<th>Product Type</th>

			<td>${getProduct.id_type}</td>
			
			<th>Product Brand</th>

			<td>${getProduct.id_brand}</td>
			
			<th>Product Model</th>

			<td>${getProduct.id_model}</td>			
			
		</tr>

		<tr>
			<th>Product Name</th>			<!-- colspan is a row merge property. -->

			<td colspan="3">${getProduct.product_name}</td>
			
			<th>Product Price</th>
			
			<td>${getProduct.product_price}</td>
		</tr>

		<tr>
			<th height="300px;">Description</th>
			<td  colspan="5"><pre>${getProduct.product_descri}</pre></td>
		</tr>
	</table>

	<a href="#" onclick="deleteArticle('${getProduct.id_product}')">Delete</a>

	<a href="#" onclick="closeContent()" style="float: right;">Cancel</a> 
