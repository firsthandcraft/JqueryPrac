<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>memberGet��� ������ ��������</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[type=button]").click(function(){
		var id = $(".id").val();
		var data="id="+id;
		alert(data);
		$.ajax({
			type:"GET",
			url:"/1.JqueryAjax/WelcomeServlet4",
			data:data,
			success:function(data){
				$("div").text(data);
			},
			error:function(){
				$("div").text("error");
			}
		});
	});

	
});
</script>
</head>
<body>
	<h2>ȸ������ ������ ��������</h2>
	<p>WelcomeServlet4������ ����</p>
	<form>
     	�̸�:
     	<input type="text" name="id" class="id">
     	<input type="button" class="btn" value="ȸ������ �˻�">
    </form>
    <div>test</div>
</body>
</html>