/**
 * 
 */
		$(document).ready(function(){
			$("#logoutBtn").on("click", function(){
				location.href="/client/logoutClient";
			})
			
			$("#listAllProduct").on("click", function(){
				location.href="/product/listAllProducts";
			})
			
			$("#newProduct").on("click", function(){
				location.href="/product/newProduct";
			})
			
			$("#exibirCifras").on("click", function(){
				location.href="/product/ExibirCifras";
			})
			
			$("#productScreen").on("click", function(){
				location.href="/product/productScreen";
			})
			
			$(".btnBuy").on("click", function(){
				location.href="/product/payment";
			})
		})
		
		function myFunction(id_product) {
			debugger;
			 dataToSend["type_product"]=id_product;
			$.ajax({
				url : "/product/fileDown",
				type : "post",
				dataType : "json",
				data:dataToSend,
				success : function(data)
			    {
		            $.each(data, function(index,item) 
		           	{
		            	alert("Aqui")
		            });
			    },
				error: function() { alert("Error to get model !!") },
			})
		}