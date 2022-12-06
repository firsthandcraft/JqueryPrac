<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>2.id_list.jsp</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#b1").change(function(){
		var name= $('#b1 option:selected').val();
		var data="id="+name;
		alert(data);
		$.ajax({
			type:"POST",
			url:"/2.JqueryAjax/FindMemberController",
			data:data,
			 success:function(data){
				$("span").text(data);
			},
			error:function(){  
	            //에러가 났을 경우 실행시킬 코드
	            console.log("에러");
			}
		});
	});
});

</script>
</head>
<body>
	<h2>servlet controller 만들기</h2>
	<p>id_list</p>

<form action="" method="post">
    <select name="" id="b1">
    <c:forEach var="list" items="${list}">
    	<option value="${list.id}">${list.id}</option>
    </c:forEach>
    </select>
    <span></span>
</form>
</body>
</html>