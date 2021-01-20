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
		 var dataToSend = {};
		dataToSend["id_type"] = $("#listProduct_type").val();
		dataToSend["id_brand"] = $("#listProduct_brand").val();
		
		$('#mytable tbody').empty();
		$.ajax({
			url : "/product/listAllProducts",
			type : "post",
			dataType : "json",
			data: dataToSend,
			success : function(data)
		    {
	            $.each(data, function(index,item) 
	           	{
	            	$('.table').append(
	            						'<tbody><tr> <td> <a href="#layer" onclick="openContent('+(item.id_product)+')">'+(item.id_product)+'</a></td> <td><a href="#layer" onclick="openContent('+(item.id_product)+')">'+(item.product_name)+'</a> </td> <td>'+(item.product_price)+'</td> <td>'+(item.product_descri)+'</td><td>'+(item.id_type)+'</td> <td>'+(item.id_model)+'</td> <td>'+(item.id_brand)+'</td></tr></tbody>'
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

function openContent(id_product)
		{	
			 $('.mw_layer').addClass('open');	
			 $.ajax({	
				   type:'post',	
				   url:'/product/countProduct',	
				   data: ({id_product:id_product}),	
				   success:function(data){	
					 $('#layer').html(data);
				   }
			});	
		}
		
		
/* Jquery Multi Part*/

$(document).ready(function() { 
    $(".btnSignIn").click(function(event) { 
        // Stop default form Submit.
        event.preventDefault(); 
        // Call Ajax Submit. 
        ajaxSubmitForm(); 
    });
 
});
 
function ajaxSubmitForm() 
{ 
    // Get form
    var form = $('#fileUploadForm')[0]; 
    var data = new FormData(form); 
 
    $("#btnSignIn").prop("disabled", true);
 
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/product/newProduct",
        data: data,
 
        // prevent jQuery from automatically transforming the data into a query string
        processData: false,
        contentType: false,
        cache: false,
        timeout: 1000000,
        success: function(data) {
 			
            alert("Situation: Registration was successful ",data);
        },
        error: function(data) { 
            alert("Error to register!! ",data); 
        }
    });
 
}