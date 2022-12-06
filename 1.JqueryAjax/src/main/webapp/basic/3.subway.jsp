<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>subwayTax</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#line").change(function(){
		var line= $('#line option:selected').val();
		var data="line="+line;
		alert(data);
		$.ajax({
			type:"GET",
			url:"/1.JqueryAjax/WelcomeServlet5",
			data:data,
			 success:function(data){
				$("span").text(data);
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
	<h2>select로</h2>
	<p>WelcomeServlet5서블릿과 연동</p>

    <form>
        <select name="line" id="line">
            <option value="">선택</option>
            <option value="01">1호선</option>
            <option value="02">2호선</option>
            <option value="03">3호선</option>
            <option value="04">4호선</option>
            <option value="05">5호선</option>
        </select>
    </form>
    <span></span>
</body>
</html>