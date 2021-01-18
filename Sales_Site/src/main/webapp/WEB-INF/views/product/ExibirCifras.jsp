<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<!-- Script to preview image -->
	<script src= "https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script> 
</head>
<style>
span[data-chord]:before {
    position    : relative;
    top         : -1em;
    display     : inline-block;
    content     : attr(data-chord);
    width       : 0;
    font-family:Arial, Helvetica, sans-serif;
    font-weight : bold;
}

p.song.show-chords span {
  position: relative;
  top: -1em;
  display:inline-block;
  width: 0;
  overflow:visible;
  text-shadow:#CCC -1px 1px;
  color:red;
  font-weight:bold;
  font-family:Arial, Helvetica, sans-serif;
}
</style>

<script>

$(document).ready(function(){

	$("#tonalidades").change(function(){
		$(".nota1").empty();
		$(".nota2").empty();
		$(".nota3").empty();
		$(".nota4").empty();
		$(".nota5").empty();
		$(".nota6").empty();
		$(".nota7").empty();
		var dataTosend = {};
		dataTosend["tom"] = $("#tonalidades").val();
		
		$.ajax({
			url : "/product/listSequenciaHarmonico",
			type : "post",
			dataType : "json",
			data: dataTosend,
			success : function(data)
		    {
	            $.each(data, function(index,item) 
	           	{	            	
	            	$('.nota1').append('<span class="chord">'+(item.primeiro)+'</span>');
	            	$('.nota2').append('<span class="chord">'+(item.segundo)+'</span>');
	            	$('.nota3').append('<span class="chord">'+(item.terceiro)+'</span>');
	            	$('.nota4').append('<span class="chord">'+(item.quarto)+'</span>');
	            	$('.nota5').append('<span class="chord">'+(item.quinto)+'</span>');
	            	$('.nota6').append('<span class="chord">'+(item.sexto)+'</span>');
	            	$('.nota7').append('<span class="chord">'+(item.setimo)+'</span>');
	            });
		    },
			error: function() { alert("Erro ao buscar sequencia harmonica !!") },
		})
	})
})
</script>
<body>
<br>
	<div id="div_type" class="form-group col-md-4">
		Selecione o tom
		<select id="tonalidades" class="form-control" name="tom">
			<option selected value="...">....</option>
			<c:forEach items="${tonalidades}" var="tons">
			<option value="${tons.tom}">${tons.tom}</option>
			</c:forEach>
		</select>
	</div>
	<br><br><br> <br><br>
	<p class="song show-chords">Oh <a class="nota1"><span class="chord">C</span></a>Pátria nunca mais esquecere<a class="nota3"><span class="chord">Em</span></a>mos</span> os he<a class="nota2"><span class="chord">Dm</span></a>rois de 4 de Feverei<a class="nota6"><span class="chord">Am</span></a>ro</p>
	
	<p class="song show-chords"> Oh <a class="nota1"><span class="chord">C</span></a>Pátria nós saudamos os teus fi<a class="nota5"><span class="chord">G</span></a>lhos tombados pela nossa independê<a class="nota4"><span class="chord">F</span></a>ncia </p>
	
</body>
</html>