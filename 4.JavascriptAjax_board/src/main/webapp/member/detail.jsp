<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>detail</title>
</head>
<body>
<h3>상세페이지</h3>

<form action="${pageContext.request.contextPath}/member/detail" method="post" name="f">
    <table border="1">
        <tbody>
            <tr>
                <th>ID</th>
                <td><input type="text" name="id" value="${vo.id}" readonly></td>
            </tr>
            <tr>
                <th>PWD</th>
                <td><input type="text"name="pwd" value="${vo.pwd}"></td>
            </tr>
            <tr>
                <th>NAME</th>
                <td><input type="text"name="name" value="${vo.name}" readonly></td>
            </tr>
            <tr>
                <th>EMAIL</th>
                <td><input type="text"name="email" value="${vo.email} " readonly></td>
            </tr>
            <tr>
            	<th></th>
            	<td>
            		<c:if test="${vo.type=='buyer'}">구매자</c:if>
            		<c:if test="${vo.type=='seller'}">판매자</c:if>
            	</td>
            </tr>
            <tr>
                <th>join</th>
                <td><input type="submit" value="수정"></td>
            </tr>
        </tbody>
    </table>
</form>
</body>
</html>