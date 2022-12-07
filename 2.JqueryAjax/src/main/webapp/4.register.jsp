<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>register</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$(".duplicateCheck").click(function(){
		var id = $("input[name=id]").val();
		
		var data="id="+id+"&type="+"a";
		alert(data);
		$.ajax({
			type:"GET",
			url:"${pageContext.request.contextPath}/FindIDController",
			data:data,
			success:function(data){
				console.log(data);
				var result=$.parseJSON(data);
				var str = "�ߺ��� ���̵��Դϴ�."
				if(result.flag){
					str="��밡���� ���̵��Դϴ�.";
				}
				$("#res").text(str);
			},
			error:function(){
				$("div").text("error");
			}
		});
	});
	
	
});
</script>
</head>
<body>
	<h3>ȸ������ �ߺ�Ȯ��</h3>
	<form action="<%=request.getContextPath()%>/RegisterController">
		<input type="text" name="id"placeholder="���̵�" id="id">
		<input type="button" class="duplicateCheck"value="�ߺ�Ȯ��" ><br/>
		<span id="res"></span>
		<input type="text" name="password"placeholder="���"><br/>
		<input type="text" name="name"placeholder="�̸�"><br/>
		<input type="text" name="address"placeholder="�ּ�"><br/>
		<input type="submit" class="enroll" value="ȸ������" onclick="nullCheck()"><br/>
	</form>
	<div></div>
</body>
</html>