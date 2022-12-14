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
			url:"/2.jqueryAjaxDuplicateLogin02/FindMemberController",
			data:data,
			success:function(data){
				console.log(data);
				$("div").text(data);
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
	<h3>회원가입 중복확인</h3>
	<form>
		<input type="text" name="id"placeholder="아이디">
		<input type="button" class="duplicateCheck"value="중복확인" ><br/>
		<input type="text" name="password"placeholder="비번"><br/>
		<input type="text" name="name"placeholder="이름"><br/>
		<input type="text" name="address"placeholder="주소"><br/>
		<input type="button" class="enroll" value="회원가입" onclick="nullCheck()"><br/>
	</form>
	<div></div>
</body>
</html>