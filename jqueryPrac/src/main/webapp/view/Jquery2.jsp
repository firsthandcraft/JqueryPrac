<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>mouseover</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<div class="out" style="background:yellow;width:300px" onclick="click">마우스를 여기로 움직이세요.
	<p></p>
	<p>0</p>
</div>

</body>
<script>
$(document).ready(function(){
	var i=0;
	$('.out').mouseover(function(){
		$("p:first",this).text("mouse over");
		$("p:last",this).text(++i);
		$(this).css('background','pink');
	});

	 function click() {
		 for(var i=0;i<11;i++){
			 $("p:last").html('<p>'i'</p>');	
		 }
	});
	
	
	
});


</script>
</html>