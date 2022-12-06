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
		/*XMLHttpRequest ��ü�� �����κ��� XML �����͸� ���۹޾� ó���ϴ� �� ���˴ϴ�.
		  �� ��ü�� ����ϸ� �� �������� ���� �ε��� �Ŀ��� ������ �����͸� ��û�ϰų� �����κ��� �����͸� ���۹��� �� �ֽ��ϴ�.
		  ��, �� ������ ��ü�� �ٽ� �ε����� �ʰ� �Ϻκи��� ������ �� �ְ� �˴ϴ�.*/
		req=new XMLHttpRequest(); // XMLHttpRequest ��ü�� ������.
	} else {
		req= new ActiveXObject("Microsoft.XMLHTTP");
		//ActiveXObject
	}
	
	req.onreadystatechange=function(){// onreadystatechange �̺�Ʈ �ڵ鷯�� �ۼ���.
		//onreadystatechange
	   // ������ ������ �����ϰ� ��û�� �������� ó���� �Ϸ�Ǿ� ������ �غ� �Ϸ�Ǿ��� ��	
		if(req.readyState==4 && req.status==200){
			//readyState ������Ƽ�� XMLHttpRequest ��ü�� ���� ���¸� ��Ÿ���ϴ�.
			/* 1. UNSENT (���� 0) : XMLHttpRequest ��ü�� ������.
			 2. OPENED (���� 1) : open() �޼ҵ尡 ���������� �����.
			 3. HEADERS_RECEIVED (���� 2) : ��� ��û�� ���� ������ ������.
			 4. LOADING (���� 3) : ��û�� �����͸� ó�� ����.
			 5. DONE (���� 4) : ��û�� �������� ó���� �Ϸ�Ǿ� ������ �غ� �Ϸ��.*/
			 //status ������Ƽ�� ������ ���� ���¸� ��Ÿ���ϴ�.
			 /*- 200 : ������ ������ ������.
			 - 404 : ������ ������ �������� ����.*/
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
	<!-- button�� reset, submit,button�� �ִ�. -->
</body>
</html>