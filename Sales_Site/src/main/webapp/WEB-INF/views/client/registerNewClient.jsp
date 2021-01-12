<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
	<head>
	 	<title>Registering new client</title>
	 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	 	
	</head>	
	<style>	
		body
		{
			padding-top: 50px;
			background-color:#c8d1da;
		}
		.btn
		{
			border:none;
			background-color:white;
			color:black;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
						0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}
		.container
		{
			
			height:395px;
		}
		input:hover
		{
		}
	</style>
	
<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();


$(document).ready(function(){
	$(".btn_Confirm").on("click", function(){
		  		  
		  var formObj = $("form[name='newClient_form']");
		  
		  formObj.attr("action", "/client/registerNewClient");
		  //formObj.attr("method", "post");
		  formObj.submit();
		});	
})
</script>

<body>

<form name="newClient_form" role="form" method="post" class="needs-validation container" novalidate>

	<div class="form-row">
    <div class="col-md-4 mb-3">
      <label for="validationTooltip01">First name</label>
      <input type="text" class="form-control" id="validationTooltip01 first_Name" placeholder="First name" value="Mark" required name="first_Name">
      <div class="valid-tooltip">
        Looks good!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationTooltip02">Second name</label>
      <input type="text" class="form-control" id="validationTooltip02 second_Name" placeholder="Second name" value="Otto" required name="second_Name">
      <div class="valid-tooltip">
        Looks good!
      </div>
    </div>
    <div class="col-md-4 mb-3">
      <label for="validationTooltipUsername">Username</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="validationTooltipUsernamePrepend">@</span>
        </div>
        <input type="text" class="form-control" id="validationTooltipUsername" placeholder="Username" aria-describedby="validationTooltipUsernamePrepend" required name="user_">
        <div class="invalid-tooltip">
          Please choose a unique and valid username.
        </div>
      </div>
    </div>
  </div>
    
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationTooltip03">CPF</label>
      <input type="text" class="form-control" id="validationTooltip03" placeholder="cpf" required name="cpf">
      <div class="invalid-tooltip">
        Please provide a valid CPF.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationTooltip04">Cell phone</label>
      <input type="text" class="form-control" id="validationTooltip04" placeholder="(51)111000222" required>
      <div class="invalid-tooltip">
        Please provide a valid Cell phone.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationTooltip05">Home phone</label>
      <input type="text" class="form-control" id="validationTooltip05" placeholder="35001100" required>
      <div class="invalid-tooltip">
        Please provide a valid Home phone.
      </div>
    </div>
  </div>
  
  <div class="form-row">
    <div class="col-md-6 mb-3">
      <label for="validationTooltip03">City</label>
      <input type="text" class="form-control" id="validationTooltip03" placeholder="City" required>
      <div class="invalid-tooltip">
        Please provide a valid city.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationTooltip04">State</label>
      <input type="text" class="form-control" id="validationTooltip04" placeholder="State" required>
      <div class="invalid-tooltip">
        Please provide a valid state.
      </div>
    </div>
    <div class="col-md-3 mb-3">
      <label for="validationTooltip05">Zip</label>
      <input type="text" class="form-control" id="validationTooltip05" placeholder="Zip" required>
      <div class="invalid-tooltip">
        Please provide a valid zip.
      </div>
    </div>
  </div>
	  
  <div class="form-row">
			 <div class="form-group col-md-6">
			 <label for="inputEmail4">Email</label>
			 <input type="email" class="form-control" id="inputEmail4" placeholder="Email" name="email">
			 </div>
			<div class="form-group col-md-6">
			 <label for="inputPassword4">Password</label>
			<input type="password" class="form-control" id="inputPassword4" placeholder="Password" name="password">
			</div>
  </div>
  	  <button type="button" class="btn btn-warning btn_Cancel">Cancel</button>
	  <button class="btn btn-primary btn_Confirm" type="submit">Confirm</button>
</form>	
</body>
</html>