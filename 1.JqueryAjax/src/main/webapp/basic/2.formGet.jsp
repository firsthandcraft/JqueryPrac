<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>2.formGet</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//$()는 문서의 일부를 선택하는데 사용, $('body')HTML파일내의 모든 문단 엘리먼트 접근
$(function(){
	$("#b1").click(function(){
		var name=$(".uname").val();
		var data ="uname="+name;
		alert(data);
		
		
		//ajax 시작하기
		//$.ajax() 매서드는 Http 요청으로 원격지의 페이지를 불러오고 XMLHttpRequest객체를 생성하여 
		// 반환하고 인자로는 요청을 초기화 하고 처리하는데 사용하는 키/값 쌍으로 이루어진 객체를 받는다.
		$.ajax({
			//전송하기
			type:"GET",
			//url요청을 보낼 페이지의 url을 담는 문자열
			url:"/1.JqueryAjax/WelcomeServlet2",
			//callback 함수 
			data:data,
			success:function(data){
				//success 서버에 보내진 요청이 성공하면 수행될 콜백함수(서버에서) 반환된 데이터는 콜백함수의 
				//파라미터 값이 된다. append  자식 노드에 붙이고
				$("body").text(data);
				//append 선택된 요소의 마지막에 샤로운 요소나 콘텐츠를 추가한다.
			}
		
		});
	});
});
</script>
</head>
<body>
	<h2>get 방식으로 데이터 가져오기</h2>
	<p>WelcomeServlet2서블릿과 연동</p>
<form>
<label>Enter your Name</label>
<input type="text" name="uname" class="uname"><br/>
<input type="button" id="b1" value="click"/>
</form>
</body>
</html>