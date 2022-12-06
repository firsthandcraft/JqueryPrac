<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인 하기</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function(){
	$(".sbtn").click(function(){
		var name=$(".uname").val();
		var pwd =$(".password").val();
		//var dbId ="uname="+name;
		//var dbPw ="password="+password;
		var data = 'uname='+name+'&password='+pwd;
		alert(data);
		$.ajax({
			type:"POST",
			url:"/1.JqueryAjax/WelcomeServlet3",
			   //data:  {name : "dbId", pwd : "dbPw"},
				data: data,
			   success:function(data){
				//
				$(".result").text(data);
			},
			error:function(){  
	            //에러가 났을 경우 실행시킬 코드
	            console.log("에러");
			}
		});
	});
	
});
</script>
</head>
<body>
	<h2>로그인 하기</h2>
	<p>WelcomeServlet3서블릿과 연동</p>
    <form>
        <input type="text" name="uname" class="uname" placeholder="아이디입력">
        <input type="password" name="password" class="password"placeholder="비번입력">
        <input type="button" value="전송" class="sbtn" >
    </form>
    <div class="result"></div>
</body>
</html>