<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>remove</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
p{background:yellow;}
.container{border:1px solid red;}
</style>
<body>
<div class="container">

<p id="hello">hello</p>
<p id="itsme">it's me</p>

</div>
<button id="button1">remove()</button>
<button id="button2">empty()</button>
<script>
$(function(e){
		$("#button1").click(function(){
			$(".container").remove();
		});
		$("#button2").click(function(){
			$(".container").empty();
		});
});
</script>

</body>

</html>