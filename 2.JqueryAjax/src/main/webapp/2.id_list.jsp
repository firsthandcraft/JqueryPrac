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
	            //������ ���� ��� �����ų �ڵ�
	            console.log("����");
			}
		});
	});
});

</script>
</head>
<body>
	<h2>servlet controller �����</h2>
	<h4>jsonǥ������� �޾ƿ���</h4>
	<p>id_list</p>


    <select id="b1">
    <option value="">���ð�</option>
    <c:forEach var="list" items="${list}">
    	<option value="${list.id}">${list.id}</option>
    </c:forEach>
    </select>
    <span></span>
    <div></div>

</body>
</html>