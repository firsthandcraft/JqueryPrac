<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>addform</title>
</head>
<body>
<h3>글작성</h3>
<a href="${pageContext.request.contextPath }/board/list">글목록</a><br/>
<form action="${pageContext.request.contextPath }/board/add" method="post">
<table border="1">
<tr><th>작성자</th>
<td><input type="text" name="writer" 
value="${sessionScope.loginId }" readonly></td></tr>
<tr><th>제목</th>
<td><input type="text" name="title" ></td></tr>
<tr><th>내용</th>
<td><textarea rows=15 cols=45 name="content"></textarea></td></tr>
<tr><th>작성</th>
<td><input type="submit" value="저장" ></td></tr>
</table>
</form>
</body>
</html>