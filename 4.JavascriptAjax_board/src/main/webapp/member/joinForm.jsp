<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>join</title>
<script type="text/javascript">
const check=()=>{
	const xhttp=new XMLHttpRequest();
	xhttp.onload=()=>{
		let obj = JSON.parse(xhttp.responseText);
		let div = document.getElementById("ch_res");
		div.innerHTML=obj.msg;//�����׽�Ʈ
		if(obj.flag){
			f.flag.value='true';
		}
	}
	let param="id="+f.id.value;
	//���۹��, ���������� ����
	xhttp.open("post","${pageContext.request.contextPath}/member/idcheck");//�����ϴ� ���
	//post,header ����
	xhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	//��û�� ����
	xhttp.send(param);
	
	
}
const a =()=>{
	if(f.flag.value!='true'){
		alert("���̵� �ߺ�üũ �Ͻÿ�");
		return;
	}
	if(f.pwd.value==''){
		alert("�н����� �Է�");
		return;
	}
	f.submit();
}
</script>
</head>
<body>
<h3>ȸ������</h3>

<form action="${pageContext.request.contextPath}/member/join" method="post" name="f">
    <table border="1">
        <tbody>
            <tr>
                <th>ID</th>
                <td>
	                <input type="text" name="id">
	                <button type="button" onclick="check()">�ߺ�üũ</button>
	                <span id="ch_res"></span>
	           </td>
            </tr>
            <tr>
                <th>PWD</th>
                <td><input type="text"name="pwd"></td>
            </tr>
            <tr>
                <th>NAME</th>
                <td><input type="text"name="name"></td>
            </tr>
            <tr>
                <th>EMAIL</th>
                <td><input type="text"name="email"></td>
            </tr>
            <tr>
                <th>type</th>
                <td><label>������<input type="radio" checked value="1" name="type"></label>
                	<label>�Ǹ���<input type="radio" value="2" name="type"></label></td>
            </tr>
            <tr>
                <th>join</th>
                <td><input type="button" value="join" onClick="a()"><a href="${pageContext.request.contextPath}/member/loginForm.jsp">�α���</a></td>
            </tr>
        </tbody>
    </table>
    <input type="hidden" value="false" name="flag" >
</form>

</body>
</html>