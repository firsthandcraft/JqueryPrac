<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<script type="text/javascript">
function createTable(){
   var table="<table border='1'>";
   table+="<tr> <td>1</td> <td>아이유</td> </tr>";
   table+="<tr> <td>2</td> <td>손연재</td> </tr>";
   table+="<table>";
   document.getElementById("tableView").innerHTML=table;
}

function clearTable(){
   document.getElementById("tableView").innerHTML=""; //공백처리
}

function createTbody(){
   document.getElementById("tb").innerHTML="<tr> <td>아이유</td> <td>11</td> </tr>";
}

function clearTbody(){
   document.getElementById("tb").innerHTML="";
}
</script>
</head>
<body>
case1: <input type="button" value="create" onclick="createTable()">
      <input type="button" value="clear" onclick="clearTable()">
<span id="tableView"></span>

<hr>

case2: <br><br>
<table border="1">
   <thead>
   <!-- <thead>태그는 HTML 테이블에서 헤더 콘텐츠(header content)들을 하나의 그룹으로 묶을 때 사용합니다. -->
      <tr>
         <th>이름</th> <th>나이</th>
      </tr>
   </thead>
   
   <tbody id="tb"></tbody>
   <!-- <tbody> 요소는 표의 여러 행(<tr>)을 묶어서 표 본문을 구성합니다. -->
   
   <tfoot>
   <!-- 표 바닥글 요소 -->
      <tr>
         <td><input type="button" value="create" onclick="createTbody()"></td>
         <td><input type="button" value="clear" onclick="clearTbody()"></td>
      </tr>
   </tfoot>
   
</table>
</body>

</html>