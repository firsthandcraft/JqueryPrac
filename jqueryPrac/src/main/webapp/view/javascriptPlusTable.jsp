<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>

</style>
<body>
<form class="container">
<p class="case1">case 1</p>
<input type="button" value="create" onclick="createTable()"/>
<input type="button" value="clear" onclick="clearTable()"/>
<span id="tableView"></span>

<hr>
<p class="case2">case 2</p>
<table border="1" id="tableView">
	<thead>
		<tr>
			<th>이름</th>
			<th>나이</th>
		</tr>
	</thead>
	<tbody id="tbody">
		<tr>
			<td>박소영</td>
			<td>20</td>
		</tr>
		<tr>
			<td>배현우</td>
			<td>20</td>
		</tr>
	</tbody>
	<tfoot>
		<tr>
			<td>합계</td>
			<td></td>
		</tr>
	</tfoot>
</table>

<input type="button" value="create" onclick="createTable()"/>
<input type="button" value="create" onclick="clearTable()"/>


</form>

</body>

<script>
function createTable(){
	var table="<table border="1">";
	table+="<tr><td>남야린</td><td>21</td></tr>":
	table+="<tr><td>정희퐉</td><td>25</td></tr>":
	table+="</table>":
	document.getElementById("tableView").innerHTML=table;
};
function clearTable(){
	document.getElementById("tableView").innerHTML="";
};

function createTbody(){
	document.getElementById("tbody").innerHTML=
	"<tr>
		<td>박소영</td>
		<td>20</td>
	</tr>";
};
function clearTbody(){
	document.getElementById("tbody").innerHTML=""";
};

</script>

</html>