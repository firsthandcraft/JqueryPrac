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
.addclass{background:tomato;}
</style>
<body>
<div class="container">
<p class="result">예제 단락입니다.</p>
</div>
<button id="button">addclass()</button>
<script>
$(function(e){
		$("#button").click(function(){
			$(".container").addClass('addclass');
		});
});
</script>

</body>

</html>