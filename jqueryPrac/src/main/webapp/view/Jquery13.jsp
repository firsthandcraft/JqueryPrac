<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>css/csselement</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.container{display:block;width:300px;height:100px;background:blue;}
</style>
<body>
<div class="container">


</div>
<button id="button1">css(element)</button>
<button id="button2">css(element,style)</button>
<p class="result">결과값</p>
<script>
$(function(e){
		$("#button1").click(function(){
			var color=$(".container").scss('background-color');
			$(".result").text("bgcolor"+color);
		});
		$("#button2").click(function(){
			$(".container").css('background','pink');
		});
});
</script>

</body>

</html>