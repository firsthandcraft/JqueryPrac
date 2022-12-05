<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>append/prepend</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.slow{display:block;}
</style>
<body>
<div style="position:relative;">

<p id="target">I would like today</p>
<button id="append">append</button>
<button id="prepend">prepend</button>
<button id="appendto">appendto</button>
<button id="prependto">prependto</button>

</div>
<script>
$(function(e){
		$("#append").click(function(){
			$("#target").append("append");
		});
		$("#prepend").click(function(){
			$("#target").prepend("prepend");
		});
		$("#appendto").click(function(){
			$("#appendto").appendTo("p");
		});
		$("#prependto").click(function(){
			$("#prependto").prependTo("p");
		});

	
});
</script>

</body>

</html>