<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>attr</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.slow{display:block;}
</style>
<body>
<div style="position:relative;">
<img id="dog" src="https://i.pinimg.com/originals/10/74/25/107425756bbfd5102867ed0f02c69095.jpg"></img>
<p id="target">.</p>
<button id="src">src</button>

</div>
<script>
$(function(e){
		$("#src").click(function(){
			alert($("#dog").attr("src"));
		});

	
});
</script>

</body>

</html>