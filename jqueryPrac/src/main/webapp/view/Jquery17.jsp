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
.bold{font-weight:bold;}
.italic{font-style:italic;}
</style>
<body>
<span class="bold buttons">볼드</span>
<span class="italic buttons">이텔릭</span>

</body>
<!-- bind, on   -->
<script>
$(function(){
	$('.bold').bind('click',function(){
		alert('볼드버튼');
	});
	$('.italic').bind('click',function(){
		alert("italic button");
	});
});

</script>
</html>