<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h3>ù��° �� ��</h3>
<c:if test="${sessionScope.loginId==null }">
	<a href="${pageContext.request.contextPath }/member/join">ȸ������</a>
	<a href="${pageContext.request.contextPath }/member/login">�α���</a><br/>
</c:if>
<c:if test="${sessionScope.loginId!=null }">
${sessionScope.loginId}�� �α����� <br/>
<a href="${pageContext.request.contextPath }/member/detail?id=${sessionScope.loginId}">������</a>
<a href="${pageContext.request.contextPath }/member/logout">�α׾ƿ�</a>
<a href="${pageContext.request.contextPath }/member/out?id=${sessionScope.loginId}">Ż��</a><br/>
<a href="${pageContext.request.contextPath }/board/list">�Խ���</a>
</c:if>
</body>
</html>