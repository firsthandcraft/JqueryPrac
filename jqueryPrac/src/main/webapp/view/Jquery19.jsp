<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>bind,on</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.hide{display:none;}

</style>
<body>
<button class="add">add</button>
<button class="remove">remove</button>
<div></div>
<br>
<p class="e hide">ddddddd</p>

</body>
<script>
$(function(){
	$('.add').on('click',function(){
		$("div").append($('.e'));
		$('.e').removeClass("hide");
	});

});

</script>
</html>