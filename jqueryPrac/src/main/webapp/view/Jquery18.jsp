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
.highlight{width:80px;text-align:center;margin:5px;border:2px solid #999;}
.italic{font-style:italic;}
</style>
<body>
<button class="highlight">highlight</button>
<br>
<p>스타일은 서식지정 작업을 ㅇㄴㅁㄹㅇㄻ;럼ㄴ아링넒ㄴㅇ럼ㄴ 런앎ㄴㄹㄹ만든ㅂ니다. 웹 사이드 에 매력적인 모양을 공하ㅏ기 위해 ㅡㄷ타일을 만ㅇㅎ이 사용합니다.\ㅇ
은 html과 css에 대한 봏ㅇ느 지식과 약간의 자바스크립트를 가지고 있어햐한다. </p>

</body>
<script>
$(function(){
	$('.highlight').mouseover(function(){
		$('p').css({
			'background-color':'pink',
			'font-weight':'bold',
			'color':'blue'
			
		});
	});

});

</script>
</html>