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
<span class="bold buttons">����</span>
<span class="italic buttons">���ڸ�</span>

</body>
<!-- bind, on   -->
<script>
$(function(){
	$('.bold').bind('click',function(){
		alert('�����ư');
	});
	$('.italic').bind('click',function(){
		alert("italic button");
	});
});

</script>
</html>