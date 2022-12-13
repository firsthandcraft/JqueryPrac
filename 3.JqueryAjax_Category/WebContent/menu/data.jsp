<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

[
	<c:forEach var="r" items="${list}" varStatus="stat">
		<c:if test="${not stat.first}">
		,
		</c:if>
		{"num":${r.num},"name":"${r.name}","parent_num":${r.parent_num}}
	</c:forEach>
]