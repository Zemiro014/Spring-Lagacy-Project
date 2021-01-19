/**
 * 
 */

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
	            						'<tbody><tr> <td> <a href="#layer" onclick="openContent('+(item.id_product)+')">'+(item.id_product)+'</a></td> <td>'+(item.product_name)+'</td> <td>'+(item.product_price)+'</td> <td>'+(item.product_descri)+'</td><td>'+(item.type)+'</td> <td>'+(item.model)+'</td> <td>'+(item.brand)+'</td></tr></tbody>'
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

function openContent(idx){
	 $('.mw_layer').addClass('open');
	 $.ajax({
		   type:'post',
		   //url:'content.do',
		   url:'count.do', // content.do -> count.do
		   data: ({idx:idx}),
		   success:function(data){
		   $('#layer').html(data);
		   }
	});
}