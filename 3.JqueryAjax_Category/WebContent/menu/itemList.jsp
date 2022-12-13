<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
	<c:forEach var="r" items="${list}" varStatus="stat">
		<c:if  test="${not stat.first}">
		,
		</c:if>
		{"num":${r.num},"title":"${r.title}","price":${r.price},"img":"${r.img}",
		"c1":${r.c1},"c2":${r.c2},"c3":${r.c3}}
	</c:forEach>
]