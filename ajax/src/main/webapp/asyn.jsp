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
//�񵿱� ��ü ����
	var xhr;//����� ��ü
	function createXMLHttpRequest(){
		if(window.ActiveXObject){//ms �� ��� 
			xhr=new ActiveXObject("Microsoft.XMLHTTP");
			//alert("ms");
		}else{
			xhr= new XMLHttpRequest();
			//alert("non-ms");
		}
	}
	function startRequest(){
		createXMLHttpRequest();
		xhr.onreadystatechange=callback;//������ ������ ���� ����� �޼��带 ����ϴ� ����
		//onreadstateChange = �������� ó��
		
		xhr.open("get","ASynServlet",true);
		xhr.send(null);
	}
	function callback(){
		if(xhr.readyState==4){//����Ϸ��4
			if(xhr.status==200){//.���� ���� ���� ���´� 200
				document.getElementById("result").innerHTML=xhr.responseText;

			}
		}
	}
</script>
</head>
<body>
<input type="button" value="�񵿱��׽�Ʈ" onclick="startRequest()"/>
<span id="result"></span>
</body> 
</html>