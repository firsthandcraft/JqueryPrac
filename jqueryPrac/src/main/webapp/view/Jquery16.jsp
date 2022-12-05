<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>each</title>
<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
.container{display:block;width:300px;height:100px;background:blue;}
.addclass{background:tomato;}
</style>
<script>
    $(function(){
        var $nodes=$('#root').children();
        alert('Number of nodes is'+$nodes.length);
        var text="";
        $('#root').children().each(function(){
        	txt+=$(this).text();
        });
        alert(txt);        
    });
</script>
<body>
  <div id="root">
        <div>Darjeeling</div>
        <div>Assam</div>
        <div>Kerala</div>
    </div>
</body>

</html>