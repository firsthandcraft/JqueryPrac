<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>subwayTax</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#line").change(function(){
		var line= $('#line option:selected').val();
		var data="line="+line;
		alert(data);
		$.ajax({
			type:"GET",
			url:"/1.JqueryAjax/WelcomeServlet5",
			data:data,
			 success:function(data){
				$("span").text(data);
			},
			error:function(){  
	            //������ ���� ��� �����ų �ڵ�
	            console.log("����");
			}
		});
	});
});
</script>
</head>
<body>
	<h2>select��</h2>
	<p>WelcomeServlet5������ ����</p>

    <form>
        <select name="line" id="line">
            <option value="">����</option>
            <option value="01">1ȣ��</option>
            <option value="02">2ȣ��</option>
            <option value="03">3ȣ��</option>
            <option value="04">4ȣ��</option>
            <option value="05">5ȣ��</option>
        </select>
    </form>
    <span></span>
</body>
</html>