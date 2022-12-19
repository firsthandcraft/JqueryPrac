<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>addform</title>
</head>
<body>
<h3>글작성</h3>

<a href="${pageContext.request.contextPath}/board/list">글목록</a>
<form action="${pageContext.request.contextPath}/board/add" method="post"></form>
<table border="1">
    <tbody>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" value="${sessionScope.loginId}" readonly></td>
        </tr>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title" ></td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" id="" cols="30" rows="10"></textarea></td>
        </tr>
        <tr>
            <th>작성</th>
            <td><input type="submit" value="저장"></td>
        </tr>
    </tbody>
</table>
</body>
</html>