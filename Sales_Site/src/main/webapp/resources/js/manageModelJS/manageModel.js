/**
 * 
 */

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
	            							'<tbody><tr> <td> <a href="#layer" onclick="openContent('+(item.model_id)+')">'+(item.model_id)+'</a></td> <td>'+(item.model)+'</td> <td>'+(item.product_type_id)+'</td> </tr></tbody>'
	            						);
	            });
		    },
			error: function() { alert("Error to get list all model !!") },
		})
	})
	
	$(".btn-confirm").on('click', function(){
	    var dataToSend = {};
	    dataToSend["product_type_id"] = $("input[name='product_type_id']:checked").val();
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