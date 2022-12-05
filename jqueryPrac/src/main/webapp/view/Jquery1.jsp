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
<h2 onclick="clickSeoul">클릭하면 사라집니다.</h2>

</body>
<script>
$(document).ready(function(){
	$('h2').click(function(){
		$(this).hide();
	});
	 function clickSeoul() {
		$("h2").css('display','none');	
	}	$('h2').on('click',function(){
		$(this).hide();
	});
	
});
</script>
</html>