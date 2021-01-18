<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
	<head>
		<!-- Meta -->
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<meta http-equiv="X-UA-compatible" content="ie=edge">
		<title>Main Screen</title>
		
		<!--  Cloud features -->
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
		<meta name = "viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<!-- Link to image in navbar -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
		
							<!-- Static resources: External files -->
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mainScreenCSS/footer.css"/> "/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mainScreenCSS/gallery.css"/> "/>
		<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/mainScreenCSS/bannerCarroussel.css"/> "/>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
  		
  		<!-- JavaScript Bundle with Popper -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	</head>

	<script type="text/javascript">
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
	</script>	
	
<style>
body
{
	background-color: white;
}
li.dropdown 
{
 	display: inline-block;
}

.dropdown-content 
{
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a 
{
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover 
{
	background-color: #f1f1f1;
}

.dropdown:hover .dropdown-content 
{
  	display: block;
}

.cell-phone
{
	padding-top:2%;
	padding-left:0.5%;
	height:50%;
	width:100%;
	overflow-y: scroll;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
				0 6px 20px 0 rgba(0, 0, 0, 0.19);
	text-align: center;
}
.cell-phone ul
{
	display:inline-block;
}
.cell-phone ul li
{
	float:left;
	display:inline-block;
	background:#1b1b1b;
	margin:7 17px;
}

.pc
{
	padding-left:0.5%;
	padding-top:2%;
	height:50%;
	width:100%;
	overflow-y: scroll;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
				0 6px 20px 0 rgba(0, 0, 0, 0.19);
	text-align: center;
}
.pc ul
{
	display:inline-block;
}
.pc ul li
{
	float:left;
	display:inline-block;
	background:#1b1b1b;
	margin:7 17px;
}
.pc ul li a, .cell-phone ul li a
{
	border:none;
	background-color: #f2f2f2;;
	color:black;
	opacity:0.7;
}
	
.title-cell-phone
{
	height:10%;
	text-align: center;
}

.card
{
border:none;
}
.card:hover
{
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 
				0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>
<body>
<nav class="navbar navbar-expand-lg navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="#">HTmicron</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	    <ul class="navbar-nav mr-auto">
	      <li class="nav-item active">
	        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item dropdown">
	        <a class="nav-link dropbtn" href="#">About us</a>
	        <div class="dropdown-content">
		      <a class="dropdown-item" href="#" >Our history</a>
		      <a class="dropdown-item" href="#">Our teams</a>
	   		</div>	
	      </li>
	       <li class="nav-item dropdown">
	        <a class="nav-link dropbtn" href="#">Products</a>
	        <div class="dropdown-content">
		      <a class="dropdown-item" href="#" id="newProduct">About Products</a>
		      <a class="dropdown-item" href="#" id="exibirCifras">Exibir Cifras</a>
	   		</div>        
	      </li>
	      
	       <li class="nav-item">
	        <a class="nav-link" href="#">Contacts</a>       
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Support</a>       
	      </li>
	    </ul> 
	
	    <form class="form-inline my-2 my-lg-0">
	      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
	      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	    </form>    
	 
	  <ul class="nav justify-content-end">   
		  <li class="nav-link active dropdown">
		    <a class="navbar-brand dropbtn" href="#">
	    		<img  src="/resources/images/avatar2.jpg"  width="30" height="30" class="d-inline-block align-top" alt=""> <c:if test="${client != null }">Hi.. ${client.user_}</c:if>
	    	</a>
	    	<div class="dropdown-content">
		      <a class="dropdown-item" href="#" id="logoutBtn">Log Out</a>
		      <a class="dropdown-item" href="#">More</a>
	   		</div>	    
		  </li>
	 </ul> 
</div>
</nav>

<!--  Banner -->
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
      <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
      <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
      <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="/resources/images/destaque1.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/>

        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Featured product</h1>
            <p>High quality product on sale with 50% discount.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="/resources/images/destaque2.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/>

        <div class="container">
          <div class="carousel-caption">
            <h1>Featured product</h1>
            <p>High quality product on sale with 50% discount.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <img src="/resources/images/destaque3.jpg" class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/>

        <div class="container">
          <div class="carousel-caption text-end">
            <h1>Featured product</h1>
            <p>High quality product on sale with 50% discount.</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </a>
  </div>
<!-- End Banner -->

<!--Inicio aqui -->
<main class="product-area" onload="getImages()">
	<div class="title-cell-phone">
		<h4>Mobile Session</h4>
	</div>
	<div class="cell-phone" >
		<ul>		
			<c:forEach items="${ListCellPhones}" var="cellPhone">
				<li>
					<div class="card" style="width: 18rem;">
					  <img src="/resources/uploadFiles/${cellPhone.img_path}" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">${cellPhone.product_name}</h5>
					    <p class="card-text">${cellPhone.product_descri}</p>
					    <p class="card-text"><b>Price: ${cellPhone.product_price}0 R$</b></p>					     
					    <a href="#" class="btn btn-primary">Buy</a>
					  </div>
					</div>
					</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="title-cell-phone">
		<h4>Computer Session</h4>
	</div>
	<div class="pc">
		<ul>		
			<c:forEach items="${ListComputers}" var="computer">
				<li>
					<div class="card" style="width: 18rem;">
					  <img src="${computer.img_path}" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">${computer.product_name}</h5>
					    <p class="card-text">${computer.product_descri}</p>
					    <p class="card-text"><b>Price: ${computer.product_price}0 R$</b></p>
					    <a href="#" class="btn btn-primary">Buy</a>
					  </div>
					</div>
					</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="title-cell-phone"></div>
	<div class="pc">
		<ul>		
			<c:forEach items="${ListTVs}" var="tv">
				<li>
					<div class="card" style="width: 18rem;">
					  <img src="${tv.img_path}" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title">${tv.product_name}</h5>
					    <p class="card-text">${tv.product_descri}</p>
					    <p class="card-text"><b>Price: ${tv.product_price}0 R$</b></p>
					    <a href="#" class="btn btn-primary">Buy</a>
					  </div>
					</div>
					</li>
			</c:forEach>
		</ul>
	</div>
	
	<div class="title-cell-phone"></div>
	<div class="pc">
		<ul>
			<li>
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">Product 1</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Buy</a>
				  </div>
				</div>
			</li>

			<li>
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">Product 2</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Buy</a>
				  </div>
				</div>
			</li>

			<li>
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">Product 3</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Buy</a>
				  </div>
				</div>
			</li>

			<li>
				<div class="card" style="width: 18rem;">
				  <img src="..." class="card-img-top" alt="...">
				  <div class="card-body">
				    <h5 class="card-title">Product 4</h5>
				    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				    <a href="#" class="btn btn-primary">Buy</a>
				  </div>
				</div>
			</li>
		</ul>
	</div>
</main>
<!--  End Aqui -->

<!-- footer--------------------------------- -->
	<footer id="footerContact" class="footer1">
	
		<!-- up-section--------------------------------- -->
		<div class="up-section">
			<!-- logo--------------------------------- -->
			<a href="#" class="f-logo"> HTmicron </a>
			<!-- list--------------------------------- -->
			<!-- 1--------------------------------- -->
			<ul>
			<h1>Company</h1>
				<li> <a href="#">Teams</a></li>
				<li> <a href="#">Services</a></li>
				<li> <a href="#">Contact Us</a></li>
				<li> <a href="#">Support</a></li>
			</ul>
			<!-- 2--------------------------------- -->
			<ul>
			<h1>About</h1>
				<li> <a href="#">Team & Company</a></li>
				<li> <a href="#">Location</a></li>
				<li> <a href="#">About</a></li>
				<li> <a href="#">Our Services</a></li>
			</ul>
			<!-- Contact-us-list ------------->
			<ul>
			<h1>Contact Us</h1>
				<li> <p>+512222222222</p></li>
				<li> <p>São Leopoldo Centro</p></li>
				<li> <p>P´roximo ao Bourbon</p></li>
			</ul>
		</div>
		<!-- down-section--------------------------------- -->
		<div class="dwn-section">
		<!-- 1--------------------------------- -->
			<ul>
			<h1>Company</h1>
				<li> <a href="#">Teams</a></li>
				<li> <a href="#">Services</a></li>
				<li> <a href="#">Contact Us</a></li>
				<li> <a href="#">Support</a></li>
			</ul>
			<!-- 2--------------------------------- -->
			<ul>
			<h1>About</h1>
				<li> <a href="#">Team & Company</a></li>
				<li> <a href="#">Location</a></li>
				<li> <a href="#">About</a></li>
				<li> <a href="#">Our Services</a></li>
			</ul>
			<!-- Social ------- -->
			<div class="social">
				<h1> Social</h1>
				<div class="social-icons">					
					<a href="#"> <i class="fab fa-facebook-f"></i></a>
					<a href="#"><i class="fab fa-twitter"></i></a>
					<a href="#"><i class="fab fa-instagram"></i></a>
					<a href="#"><i class="fab fa-youtube"></i></a>			
				</div>
			</div>
			<div class="search">
				<!-- heading -->
				<h1>E-mail</h1>
				<!-- input-box -->
				<input type="email" placeholder="Enter Your Email"/>
			</div>
		</div>
		<p class="copyright">All rights reserved by JK-Design </p>
	</footer>
	
</body>
</html>