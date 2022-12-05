<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//비동기 객체 선언
	var xhr;//통신의 주체
	function createXMLHttpRequest(){
		if(window.ActiveXObject){//ms 일 경우 
			xhr=new ActiveXObject("Microsoft.XMLHTTP");
			//alert("ms");
		}else{
			xhr= new XMLHttpRequest();
			//alert("non-ms");
		}
	}
	function startRequest(){
		createXMLHttpRequest();
		xhr.onreadystatechange=callback;//서버의 응답이 오면 수행될 메서드를 등록하는 행위
		//onreadstateChange = 상태제한 처리
		
		xhr.open("get","ASynServlet",true);
		xhr.send(null);
	}
	function callback(){
		if(xhr.readyState==4){//응답완료는4
			if(xhr.status==200){//.정상 응답 받은 상태는 200
				document.getElementById("result").innerHTML=xhr.responseText;

			}
		}
	}
</script>
</head>
<body>
<input type="button" value="비동기테스트" onclick="startRequest()"/>
<span id="result"></span>
</body> 
</html>