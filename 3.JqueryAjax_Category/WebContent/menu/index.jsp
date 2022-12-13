<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var c1=0,c2=0,c3=0;
//-2.makeSelect 함수 
var makeSelect=function(arr,loc){
	var html="<select class ='s' type='"+loc+"'>";
	html +="<option value=''>선택</option>";
	for(var i=0; i<arr.length;i++){
		
		html +="<option value='"+arr[i].num+"'>"+arr[i].name+"</option>";
	}
	html+="</select>";
	$("#"+loc).html(html);
};
var makeList=function(arr){
	var html="";
	for(i=0;i<arr.length;i++){
		html +="<table border='1'><tr><td>"+arr[i].title+"</td><td>"+arr[i].price+"원</td></tr>"
		html +="<tr><td colspan='2'><img src='"+arr[i].img+"'width=150 height=150></td></tr></table>"
	}
	$("#content").html(html);
};
//-1 
$(function(){
	$.ajax({
		url:'${pageContext.request.contextPath}/CateController',
		type:'GET',
		data:"type=cate1",
		success:function(result){
			var arr=$.parseJSON(result);
			makeSelect(arr,"cate_1");
		}
	});
	$(document).on("change",".s",function(){
		//매개변수(parameter)란 함수의 정의에서 전달받은 인수를 함수 내부로 전달하기 위해 사용하는 변수를 의미합니다.
		//change() 메소드는 해당하는 요소의 value에 변화가 생길 경우 이를 감지하여 등록된 callback함수를 동작시킵니다.
		//해석하면 .s select 에서 바뀐 부분이 있으면 함수 실행
		var type=$(this).attr("type");
		var sp=type.split("_");
		var x= parseInt(sp[1])+1;
		var num=$(this).val();
		switch(x){
			case 2:
				c1=num;
				c2=0;
				c3=0;
				$("#cate_3").html("");
			break;
			case 3:
				c2=num;
				c3=0;
			break;
			case 4:
				c3=num;
			break;
			
		};
		$.ajax({
			url:'${pageContext.request.contextPath}/CateController',
			type:'get',
			data:"type=cate"+x+"&pNum="+num,
			success:function(result){
				var arr=$.parseJSON(result);
				makeSelect(arr,"cate_"+x);
			}
		});
	});
$("#search").click(function(){
	if(c1==0){
		alert("카네고리를 선택하세요.");
		return;
	}
	$.ajax({
		url:'${pageContext.request.contextPath}/GetByCateController',
		type:'get',
		data:"c1="+c1+"&c2="+c2+"&c3="+c3,
		success:function(result){
			var arr=$.parseJSON(result);
			makeList(arr);
		}
	});
	
});	


$("#additem").click(function(){
	alert(c1+"/"+c2+"/"+c3);
	if(c1==0||c2==0||c3==0){
		alert("모든 카데고리를 선택하세요");
		return;
	}
	var form=$("#f")[0];
	var formData=new FormData(form);
	formData.append("c1",c1);
	formData.append("c2",c2);
	formData.append("c3",c3);
	$.ajax({
		url:'${pageContext.request.contextPath}/AddItemController',
		data:formData,
		type:"POST",
		processData: false,
		contentType: false,
		success:function(result){
			alert("상품등록완료");
		}
	});
	c1=0;
	c2=0;
	c3=0;
	$(".a").val("");
	$(".select").val([]);
});

});
</script>
</head>
<body>
<h3>상품등록</h3>
    
<form id="f"action=""method="post" entype="multipart/form-data">
    <table border="1">
        <tr>
            <th>상품명</th>
            <td><input type="text" name="title" class="a"></td>
        </tr>
        <tr>
            <th>가격</th>
            <td><input type="text"name="price" class="a"></td>
        </tr>
        <tr>
            <th>이미지</th>
            <td><input type="file"name="file" class="a"></td>
        </tr>
        <tr>
            <td colspan="2"><input id="additem" type="button" value="save"></td>
        </tr>
    </table>
</form>
<form>
	<table border="1">
        <tr>
            <td width="250"id="cate_1">
            </td>
            <td width="250"id="cate_2">
            </td>
            <td width="250"id="cate_3"> 
            </td>
            <td>
                <input type="button" value="검색" id="search">
            </td>
        </tr>
        <tr>
        	<td colspan="4" id="content"></td>
        </tr>
    </table>
</form>
</body>
</html>