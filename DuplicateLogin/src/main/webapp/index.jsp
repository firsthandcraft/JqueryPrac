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
	<a href="<%=request.getContextPath()%>/IdListController">���̵�� ȸ���˻�</a>
	<a href="<%=request.getContextPath()%>/RegisterController">ȸ������ �ߺ�Ȯ��</a>
<!---- DB 
drop table member cascade constraints;
create table member(
id varchar2(10) primary key,
password varchar2(20),
name varchar2(10),
address varchar2(60)
);

insert into member(id,password,name,address)values('java','1234','�ҼҼ�','����');
insert into member(id,password,name,address)values('oracle','5678','���ָ�','û��');
insert into member(id,password,name,address)values('jsp','1111','�̸���','����');
select * from member;
commit;  -->

</body>
</html>