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
.slow{display:block!important;}
</style>
<body>

<button>마우스 클릭하면 이미지</button>
<img id="dog" class="" src="https://i.pinimg.com/originals/10/74/25/107425756bbfd5102867ed0f02c69095.jpg" width="120"style="display:none">

<script>
$(function(e){
		$("button").click(function(){
			//$("#dog").show("slow");
			$("#dog").toggleClass("slow");
		});
	
});
</script>

</body>

</html>