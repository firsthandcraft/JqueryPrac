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
<h3>첫번째 웹 앱</h3>
<c:if test="${sessionScope.loginId==null }">
	<a href="${pageContext.request.contextPath }/member/join">회원가입</a>
	<a href="${pageContext.request.contextPath }/member/login">로그인</a><br/>
</c:if>
<c:if test="${sessionScope.loginId!=null }">
${sessionScope.loginId}님 로그인중 <br/>
<a href="${pageContext.request.contextPath }/member/detail?id=${sessionScope.loginId}">내정보</a>
<a href="${pageContext.request.contextPath }/member/logout">로그아웃</a>
<a href="${pageContext.request.contextPath }/member/out?id=${sessionScope.loginId}">탈퇴</a><br/>
<a href="${pageContext.request.contextPath }/board/list">게시판</a>
</c:if>
</body>
</html>