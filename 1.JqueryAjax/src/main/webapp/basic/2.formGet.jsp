<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>2.formGet</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//$()�� ������ �Ϻθ� �����ϴµ� ���, $('body')HTML���ϳ��� ��� ���� ������Ʈ ����
$(function(){
	$("#b1").click(function(){
		var name=$(".uname").val();
		var data ="uname="+name;
		alert(data);
		
		
		//ajax �����ϱ�
		//$.ajax() �ż���� Http ��û���� �������� �������� �ҷ����� XMLHttpRequest��ü�� �����Ͽ� 
		// ��ȯ�ϰ� ���ڷδ� ��û�� �ʱ�ȭ �ϰ� ó���ϴµ� ����ϴ� Ű/�� ������ �̷���� ��ü�� �޴´�.
		$.ajax({
			//�����ϱ�
			type:"GET",
			//url��û�� ���� �������� url�� ��� ���ڿ�
			url:"/1.JqueryAjax/WelcomeServlet2",
			//callback �Լ� 
			data:data,
			success:function(data){
				//success ������ ������ ��û�� �����ϸ� ����� �ݹ��Լ�(��������) ��ȯ�� �����ʹ� �ݹ��Լ��� 
				//�Ķ���� ���� �ȴ�. append  �ڽ� ��忡 ���̰�
				$("body").text(data);
				//append ���õ� ����� �������� ���ο� ��ҳ� �������� �߰��Ѵ�.
			}
		
		});
	});
});
</script>
</head>
<body>
	<h2>get ������� ������ ��������</h2>
	<p>WelcomeServlet2������ ����</p>
<form>
<label>Enter your Name</label>
<input type="text" name="uname" class="uname"><br/>
<input type="button" id="b1" value="click"/>
</form>
</body>
</html>