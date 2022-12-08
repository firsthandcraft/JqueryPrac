<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
[
	<c:forEach var="i" items="${imgs}" varStatus="status">
		<!-- varStatus : �Ʒ��� if�� �ֱ� ���� ����, �� ������ ù��° ���¸� ����ϱ� ���� ������ varStatus�� �־���. -->
		<c:if test="${not status.first}">
		,
		</c:if>
		{"num":${i.num},"writer":"${i.writer}", "pwd":"${i.pwd}", "title":"${i.title}", "path":"${i.path}", "u_date":"${i.u_date}"
		,"reps":[
			<c:forEach var="i" items="${reps}"varStatus="status">
			<c:if test="${not status.first}">
			,
			</c:if>
			{"num":${i.num},"writer":"${i.writer}","content":"${i.content}","img_num":${i.img_num}}
			</c:forEach>
		]
		}
	</c:forEach>
]