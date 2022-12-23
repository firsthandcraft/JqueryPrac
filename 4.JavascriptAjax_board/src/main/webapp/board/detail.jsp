<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>BoardDetail</title>
<style type="text/css">
.rep_class{border:1px solid #000;}

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
<c:set var = "str" >readonly</c:set>
<c:if test="${sessionScope.loginId==vo.getwriter}">
<c:set var = "str" ></c:set>
</c:if>
<a href="${pageContext.request.contextPath}/board/list">�۸��</a>
<form action="${pageContext.request.contextPath}/board/detail" method="post">
<table border="1">
    <tbody>
        <tr>
            <th>�۹�ȣ</th>
            <td><input type="text" name="num" value="${vo.num}" readonly></td>
        </tr>
        <tr>
            <th>�ۼ���</th>
            <td><input type="text" name="writer" value="${vo.writer}" readonly></td>
        </tr>
        <tr>
            <th>�ۼ���</th>
            <td><input type="text" name="w_date"value="${vo.w_date}" readonly></td>
        </tr>
        <tr>
            <th>����</th>
            <td><input type="text" name="title"value="${vo.title}"${str}></td>
        </tr>
        <tr>
            <th>����</th>
            <td><textarea name="content" id="" cols="30" rows="10">${vo.content}</textarea></td>
        </tr>
        <tr>
            <th>����</th>
			<td>
			<c:if test="${sessionScope.loginId==vo.getwriter}">
			<input type="submit" value="edit">
			<input type= "button" value="delete" onclick="del()">
			</c:if>
			</td>
		</tr>
	</tbody>
</table>
</form>
<h4>��� �ۼ�</h4>
<form name="f">
	���:<input type="text" name="title"><br>
	����:<input type="text" name="content">
	<input type= "button" value="����ۼ�" onclick="a()">
</form>
<h4>��� ���</h4> 
<div id="replist"></div>
</body>
</html>