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
   table+="<tr> <td>1</td> <td>������</td> </tr>";
   table+="<tr> <td>2</td> <td>�տ���</td> </tr>";
   table+="<table>";
   document.getElementById("tableView").innerHTML=table;
}

function clearTable(){
   document.getElementById("tableView").innerHTML=""; //����ó��
}

function createTbody(){
   document.getElementById("tb").innerHTML="<tr> <td>������</td> <td>11</td> </tr>";
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
   <!-- <thead>�±״� HTML ���̺��� ��� ������(header content)���� �ϳ��� �׷����� ���� �� ����մϴ�. -->
      <tr>
         <th>�̸�</th> <th>����</th>
      </tr>
   </thead>
   
   <tbody id="tb"></tbody>
   <!-- <tbody> ��Ҵ� ǥ�� ���� ��(<tr>)�� ��� ǥ ������ �����մϴ�. -->
   
   <tfoot>
   <!-- ǥ �ٴڱ� ��� -->
      <tr>
         <td><input type="button" value="create" onclick="createTbody()"></td>
         <td><input type="button" value="clear" onclick="clearTbody()"></td>
      </tr>
   </tfoot>
   
</table>
</body>

</html>