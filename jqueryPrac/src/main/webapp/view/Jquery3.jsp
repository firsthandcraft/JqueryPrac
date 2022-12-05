<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<input type="text" placeholder="아이디" name="name">

</body>
<script>
$(document).ready(function(){
	$('input').focus(function(){
		$(this).css('background','pink');
	});
	$('input').blur(function(){
		$(this).css('background','#fff');
	});
	
});


</script>
</html>