<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var makeTbl=function(obj){
	var html= "<table id='_t"+obj.num+"'border='1'>";
	html+="<tr><th>num</th><td>"+obj.num+"</td></tr>";
	html+="<tr><th>update</th><td><input type='button' value='edit'/><input type='button' value='delete' num='"+obj.num+"'pwd='"+obj.pwd+"'/></td></tr>";
	html+="<tr><th>title</th><td>"+obj.title+"</td></tr>";
	html+="<tr><th>writer</th><td>"+obj.writer+"</td></tr>";
	html+="<tr><th>date</th><td>"+obj.u_date+"</td></tr>";
	html+="<tr><th>img</th><td><img src='"+obj.path+"'width:200 height=200/></td></tr>";
	html+="</table>";
	//div#imgList에 
	$("#imgList").append(html);
	
}
var makeList = function(arr){
	for(i=0;i<arr.length;i++){
		makeTbl(arr[i]);
	}
}
$(function(){
	$("#upload_form").hide();
	
	$.ajax({
		url:'${pageContext.request.contextPath}/ImgList',
		type:'GET',
		success:function(result){
			var arr = $.parseJSON(result);
			makeList(arr);
		},
		error:function(){
			$("#imgList").text("upload_form error");
		}
	});
	
	$("#addbtn").click(function(){
		$("#title").val("");
		$("#writer").val("");
		$("#pwd").val("");
		$("#file").val("");
		$("#upload_form").show();
	});
	
	$("#upload_btn").click(function(){
		var form=$("#upload_form")[0];
		var formData= new FormData(form);		
		$.ajax({
			url: '${pageContext.request.contextPath }/WriteController',
            data: formData,
            processData: false, 
			contentType: false, 
            type: 'POST',
            success: function(result){
            	var obj = $.parseJSON(result);
 				makeTbl(obj);
            },
			error:function(){
				$("#imgList").text("upload_btn error");
			}
		});
		$("#upload_form").hide();
	});
	$(document).on("click","input[value='delete']",function(){
		var pwd = prompt("글 비밀번호");
		var pwd2=$(this).attr("pwd");
		var num=$(this).attr("num");
		console.log("num : "+ num);
		if(pwd==pwd2){
			$.ajax({
				url:'${pageContext.request.contextPath}/DelController',
				data:"num="+num,
				type:'POST',
				success : function(result){
					var obj=$.parseJSON(result);
					if(obj.num==0){
						alert("삭제가 정상 처리되지 않음");
					}else{
						$("#t_"+obj.num).remove();
					};
				},
				error:function(){
					$("#imgList").text("delete error");
				}
			});
		} else{alert("비밀번호 불일치");}
	});
});

</script>
</head>
<body>
<h3>이미지 게시판</h3>

<button id="addbtn">이미지 올리기</button>

<form method="post" id="upload_form" enctype="multipart/form-data">
<table border="1" >
    <tr>
        <th>제목</th>
        <td><input type="text" id="title" name="title"></td>
    </tr>
    <tr>
        <th>게시자</th>
        <td><input type="text" id="writer" name="writer"></td>
    </tr>
    <tr>
        <th>글비밀번호</th>
        <td><input type="text" id="pwd" name="pwd"></td>
    </tr>
    <tr>
        <th>이미지</th>
        <td><input type="file" id="file" name="file"></td>
    </tr>
    <tr>
        <td colspan="2"><input type="button" id="upload_btn" value="올리기"></td>
    </tr>
</table>
</form>

<div id="imgList"></div>

</body>
</html>