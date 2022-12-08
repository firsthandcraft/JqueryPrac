<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$("#upload_form").hide();
	$("#addbtn").click(function(){
		$("#title").val('');
		$("#writer").val('');
		$("#pwd").val('');
		$("#file").val('');
		$("#upload_form").show();	
		//$("#upload_form").toggle();	
	});
	var save =function(){
		var form=$("#upload_form")[0];
		var formData = new FormData(form);
		$.ajax({
			url:'${pageContext.request.contextPath}/WriteController',
			data:formData,
			processData:false,
			contentType:false,
			type:'POST',
			success:function(result){
				var obj=$.parseJSON(result);
				var html=makeTbl(obj);
				$("#imglist").append(html);
			}
		});
		$("#upload_form").hide();
	}
});
</script>
</head>
<body>
<h3>이미지 게시판</h3>
<label><input type="button" id="addbtn"value="이미지 올리기"></label>
<form id ="upload_form" method="POST" action="" enctype="multipart/form=data">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title"></td>
		</tr>
		<tr>
			<th>게시자</th>
			<td><input type="text" name="writer" id="writer"></td>
		</tr>
		<tr>
			<th>글 비밀번호</th>
			<td><input type="text" name="pwd" id="pwd"></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="file" id="file"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="save" id="upload_btn"></td>
		</tr>
	</table>
	<input type="hidden" id="num">
</form>
<div id="imglist"></div>
</body>
</html>