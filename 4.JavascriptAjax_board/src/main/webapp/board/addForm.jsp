<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>addform</title>
</head>
<body>
<h3>���ۼ�</h3>

<a href="${pageContext.request.contextPath}/board/list">�۸��</a>
<form action="${pageContext.request.contextPath}/board/add" method="post"></form>
<table border="1">
    <tbody>
        <tr>
            <th>�ۼ���</th>
            <td><input type="text" name="writer" value="${sessionScope.loginId}" readonly></td>
        </tr>
        <tr>
            <th>����</th>
            <td><input type="text" name="title" ></td>
        </tr>
        <tr>
            <th>����</th>
            <td><textarea name="content" id="" cols="30" rows="10"></textarea></td>
        </tr>
        <tr>
            <th>�ۼ�</th>
            <td><input type="submit" value="����"></td>
        </tr>
    </tbody>
</table>
</body>
</html>