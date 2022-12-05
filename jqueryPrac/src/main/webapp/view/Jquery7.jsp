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
<style>
.slow{display:block;}
</style>
<body>
<div style="position:relative;">
<p id="target">이것은 <strong>하나의</strong>단락입니다.</p>
<button id="text">text</button>
<button id="html">html</button>
<img id="dog" class="" src="https://i.pinimg.com/originals/10/74/25/107425756bbfd5102867ed0f02c69095.jpg" width="120" height="100"
 style="position:absolute;">
</div>
<script>
$(function(e){
		$("button").click(function(){
			//$("#dog").show("slow");
			$("#dog").animate({
				left:'100px',
				top:"+=100px",
				opacity: '0.5'
			}, 3000,'easeOutElastic');
		});
	
});
</script>

</body>

</html>