<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>2.id_list.jsp</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#b1").change(function(){
		var name= $('#b1 option:selected').val();
		var data="id="+name;
		alert(data);
		$.ajax({
			type:"POST",
			url:"/2.JqueryAjaxDuplicateLogin01/FindMemberController",
			data:data,
			 success:function(data){
				 alert(data);
				 m=$.parseJSON(data);
				$("div").html(m.id+"/"+m.address+"/"+m.name);
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
	<h4>json표기법으로 받아오기</h4>
	<p>id_list</p>


    <select id="b1">
    <option value="">선택값</option>
    <c:forEach var="list" items="${list}">
    	<option value="${list.id}">${list.id}</option>
    </c:forEach>
    </select>
    <span></span>
    <div></div>

</body>
</html>