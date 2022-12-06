<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>step1</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//http://www.tcpschool.com/xml/xml_dom_xmlHttpRequest
function getFormServer(){
	var req;
	
	if(window.XMLHttpRequest){
		//XMLHttpRequest
		/*XMLHttpRequest 객체는 서버로부터 XML 데이터를 전송받아 처리하는 데 사용됩니다.
		  이 객체를 사용하면 웹 페이지가 전부 로딩된 후에도 서버에 데이터를 요청하거나 서버로부터 데이터를 전송받을 수 있습니다.
		  즉, 웹 페이지 전체를 다시 로딩하지 않고 일부분만을 갱신할 수 있게 됩니다.*/
		req=new XMLHttpRequest(); // XMLHttpRequest 객체를 생성함.
	} else {
		req= new ActiveXObject("Microsoft.XMLHTTP");
		//ActiveXObject
	}
	
	req.onreadystatechange=function(){// onreadystatechange 이벤트 핸들러를 작성함.
		//onreadystatechange
	   // 서버상에 문서가 존재하고 요청한 데이터의 처리가 완료되어 응답할 준비가 완료되었을 때	
		if(req.readyState==4 && req.status==200){
			//readyState 프로퍼티는 XMLHttpRequest 객체의 현재 상태를 나타냅니다.
			/* 1. UNSENT (숫자 0) : XMLHttpRequest 객체가 생성됨.
			 2. OPENED (숫자 1) : open() 메소드가 성공적으로 실행됨.
			 3. HEADERS_RECEIVED (숫자 2) : 모든 요청에 대한 응답이 도착함.
			 4. LOADING (숫자 3) : 요청한 데이터를 처리 중임.
			 5. DONE (숫자 4) : 요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨.*/
			 //status 프로퍼티는 서버의 문서 상태를 나타냅니다.
			 /*- 200 : 서버에 문서가 존재함.
			 - 404 : 서버에 문서가 존재하지 않음.*/
			document.getElementById("target").innerHTML=req.responseText;
			//responseText
			
		}
	}
	req.open("GET","testfile1.txt",true);
	req.send();
}
</script>
</head>
<body>
	<div id="target" style="width:300px; height:60px;border:1px solid #333"></div>
	<button type="submit" onclick="getFormServer()">Get Data</button>
	<!-- button은 reset, submit,button이 있다. -->
</body>
</html>