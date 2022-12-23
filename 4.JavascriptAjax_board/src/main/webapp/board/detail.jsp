<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.rep_class{
	border:2px solid black;
}
</style>
<script type="text/javascript">
const mkdiv = (obj) => {
	let el = document.createElement("div");
	el.setAttribute("id", obj.num);
	el.setAttribute("class", "rep_class");
	let html = "";
	for(let key in obj){
		html += key + ": "+ obj[key] + "<br/>";
	}
	el.innerHTML = html;
	return el;
}

const mklist = () => {
	const xhttp = new XMLHttpRequest();
	xhttp.onload = () => {
	  //���� ������ ������ ó�� �ڵ� �ۼ�
	  let arr = JSON.parse(xhttp.responseText);
	  let div = document.getElementById("repList");
	  div.innerHTML = "";
	  for(let obj of arr){
		  let chdiv = mkdiv(obj);
		  div.appendChild(chdiv);
	  }
	}

	let param = "parent=${vo.num}";
	xhttp.open("post", "${pageContext.request.contextPath }/board/replist");

	//request ����� content type�� application���� ����
	xhttp.setRequestHeader("Content-type", 
			"application/x-www-form-urlencoded");
	// 4. ��û����
	xhttp.send(param);
}
window.onload = () => {
	mklist();
}

const a = () => {
	const xhttp = new XMLHttpRequest();
	xhttp.onload = () => {
		let obj = JSON.parse(xhttp.responseText);
		if(obj.flag){
			mklist();
			f.title.value="";
			f.content.value="";
		}else{
			alert('��� �߰� ����');
		}
	}
	let param = "writer=${sessionScope.loginId}";
	param += "&title="+f.title.value;
	param += "&content="+f.content.value;
	param += "&parent=${vo.num}";
	
	xhttp.open("post", "${pageContext.request.contextPath }/board/repadd");
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhttp.send(param);
}
</script>
</head>
<body>
<c:set var="str">readonly</c:set>
<c:if test="${sessionScope.loginId==vo.writer }">
<c:set var="str"></c:set>
</c:if>
<h3>��������</h3>
<a href="${pageContext.request.contextPath }/board/list">�۸��</a><br/>
<form action="${pageContext.request.contextPath }/board/detail" method="post">
<table border="1">
<tr><th>�۹�ȣ</th>
<td><input type="text" name="num" value="${vo.num }" readonly></td></tr>
<tr><th>�ۼ���</th>
<td><input type="text" name="writer" value="${vo.writer }" readonly></td></tr>
<tr><th>�ۼ���</th>
<td><input type="text" name="w_date" value="${vo.w_date }" readonly></td></tr>
<tr><th>����</th>
<td><input type="text" name="title" value="${vo.title }" ${str }></td></tr>
<tr><th>����</th>
<td><textarea cols="45" rows="15" name="content" ${str }>${vo.content }</textarea></td></tr>
<!-- �߰� -->
<c:if test="${sessionScope.loginId==vo.writer }">
<tr><th>����/����</th>
<td>
	<input type="submit" value="edit">
	<input type="button" value="delete" onclick="del()">
</td></tr>
</c:if>
<!-- �߰� -->
</table>
</form><br/>
<h3>����ۼ�</h3>
<form name="f">
����: <input type="text" name="title"><br/>
����: <input type="text" name="content"><br/>
<input type="button" value="����ۼ�" onclick="a()">
</form>
<h3>��۸��</h3>
<div id="repList"></div>
</body>
</html>