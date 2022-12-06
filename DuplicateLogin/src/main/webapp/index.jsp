<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
</head>
<body>
	<a href="<%=request.getContextPath()%>/IdListController">아이디로 회원검색</a>
	<a href="<%=request.getContextPath()%>/RegisterController">회원가입 중복확인</a>
<!---- DB 
drop table member cascade constraints;
create table member(
id varchar2(10) primary key,
password varchar2(20),
name varchar2(10),
address varchar2(60)
);

insert into member(id,password,name,address)values('java','1234','소소손','수서');
insert into member(id,password,name,address)values('oracle','5678','손주만','청라');
insert into member(id,password,name,address)values('jsp','1111','이명지','용인');
select * from member;
commit;  -->

</body>
</html>