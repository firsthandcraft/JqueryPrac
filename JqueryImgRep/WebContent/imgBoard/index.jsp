<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
//makeTbl함수 .  리스트 데이터 추출
//스크립트로 테이블을 삽입시 자동적으로 tbody 가 삽입된다.
var makeTbl=function(obj){
	var html="<table id='t_"+obj.num+"' border='1'>";
	html+="<tr><th>num</th><td><input type='text'name='num' value='"+obj.num+"'></td></tr>";
	html+="<tr><th>update</th><td><input type='button' value='edit' num='"+obj.num+"' pwd='"+obj.pwd+"' >";
	html+="<input type='button' value='delete' num='"+obj.num+"' pwd='"+obj.pwd+"'></td></tr>";
	html+="<tr><th>title</th><td><input type='text' value='"+obj.title+"'></td></tr>";
	html+="<tr><th>date</th><td><input type='text' value='"+obj.u_date+"'></td></tr>";
	html+="<tr><th>img</th><td><img src='"+obj.path+"' width=200 height=200></td></tr>";
	html+="<tr><th>댓글</th><td><input type='text'id='r_"+obj.num+"'></td></tr>";		
	html+="<tr><th>작성자</th><td><input type='text'id='w_"+obj.num+"'>";		
	html+="<input type='button' num='"+obj.num+"' value='작성' class='rep'>";
	html+="<div id='reps_"+obj.num+"'>";
			if(obj.reps!="undefined"&&obj.reps!=null){
				for(x=0;x<obj.reps.length;i++){
					html+="댓글 :"+obj.reps[x].content+"(작성자 :"+obj.reps[x].writer+")<br>";
					
				};
			};
	html+="</div>";		
	html+="</td></tr>";		
	html+="</table>";
	return html;
}
//makeTbl 함수 호출
var makeList=function(arr){
	for(i=0,i<arr.length;i++;){
		var html=makeTbl(arr[i]);
		$("#imglist").append(html);
	};
};

//등록 함수
var save =function(){
	var form=$("#upload_form")[0];
	var formData = new FormData(form);
	$.ajax({
		url:'${pageContext.request.contextPath}/WriteController',
		data: formData,
		processData: false,
		contentType: false,
		type: 'POST', 
		success:function(result){
			var obj=$.parseJSON(result);
			var html=makeTbl(obj);
			$("#imglist").append(html);
		},
		error:function(){
			console.log("save error");
		}
	});
	$("#upload_form").hide();
};
//수정 함수
var edit=function(){
	 var num=$("#num").val();
	 var title=$("#title").val();
	 var writer=$("#writer").val();
	 var pwd=$("#pwd").val();
	 var data="num="+num+"&title="+title+"&writer="+writer+"&pwd="+pwd;
	$.ajax({
		url:'${pageContext.request.contextPath}/EditController',
		data:data,
		type:'POST',
		success:function(result){
			var obj = $.parseJSON(result);
			var html=makeTbl(obj);
			$('#t_'+obj.num).replaceWith(html);//t_테이블 넘버를 가져오고 html 의 makeTbl함수 호출하고 바꾼다
			editReps(num);//editReps함수 호출
		},
		error:function(){
			console.log("edit error");
		}
	});
	$('#upload_btn').val("save");
	$('#upload_form').hide();

}
//editReps함수
var editReps=function(num){
	var data="img_num="+num;
	$.ajax({
		url:'${pageContext.request.contextPath}/GetReps',
		data:data,
		type:'get',
		success:function(result){
			var reps=$.parseJSON(result);
			printReps(num,reps);//printReps함수 호출 reps는 댓글에 관한 거임
		},
		error:function(){
			console.log("img_num error");
		}
	});
};
var printReps= function(num,reps){
	var html="";
	for(i=0;i<reps.length;i++){
		html+="댓글 : "+reps[i].content+"(작성자 : "+reps[i].writer+")<br>";
	}
	$("#reps_"+num).html(html);
};
//
$(function(){

});
//
$(function(){
	$("#upload_form").hide();
	
	$.ajax({
        url: '${pageContext.request.contextPath }/ImgList',
        type: 'get',
        success: function(result){
        	var arr = $.parseJSON(result);
        	makeList(arr);
        },
		error:function(){
			console.log("ajax error");
		}
	});
	$("#addbtn").click(function(){
		$("#title").val('');
		$("#writer").val('');
		$("#pwd").val('');
		$("#file").val('');
		//$("#upload_form").show();	
		$("#upload_form").toggle();	
	});	
	$("#upload_btn").click(function(){
		var btn_txt=$("#upload_btn").val();
		if(btn_txt=="save"){
			save();
		}else{
			edit();
		};
});
$(document).on("click","input[value='delete']",function(){
	var pwd=prompt("글비밀번호입력");
	var pwd2=$(this).attr("pwd");
	var num=$(this).attr("num");
	if(pwd==pwd2){
		$.ajax({
			url:'${pageContext.request.contextPath}/DelController',
			data:"num="+num,
			type:'POST',
			success:function(result){
				var obj=$.parseJSON(result);
				if(obj.num==0){
					alert("삭제가 정상 처리되지 않았습니다.");
				}else{
					$('#t_'+obj.num).remove();
				}
			},
			error:function(){
				console.log("input[value='delete'] error");
			}
		});
	} else{
		alert("비밀번호 불일치");
	}
});
$(document).on("click","input[value='edit']",function(){
	var pwd=prompt("글비밀번호입력");
	var pwd2=$(this).attr("pwd");
	var num=$(this).attr("num");
	if(pwd==pwd2){
		$.ajax({
			url:'${pageContext.request.contextPath}/GetController',
			data:"num="+num,
			type:'post',
			success:function(result){
				var obj=$.parseJSON(result);
				$('#num').val(obj.num);
				$('#title').val(obj.title);
				$('#writer').val(obj.writer);
				$('#pwd').val(obj.pwd);
				$('#upload_btn').val("edit");
				$('#upload_form').show();
			},
			error:function(){
				console.log("input[value='edit'] error");
			}
		});
	} else{
		alert("비밀번호 불일치");
	}
});	
$(document).on("click",".rep",function(){
	var img_num=$(this).attr("num");//""안써서 오류
	var writer=$("#w_"+img_num).val();
	var content=$("#r_"+img_num).val();
	var data="img_num="+img_num+"&writer="+writer+"&content="+content;
	$.ajax({
		url:'${pageContext.request.contextPath}/RepController',
		data:data,
		
		type:'post',
		success:function(result){
			var arr=$.parseJSON(result);
			printReps(img_num,arr);
		},
		error:function(){
			console.log("rep error");
		}
	});
	$('#w_'+img_num).val();
	$('#r_'+img_num).val();
});		
});
</script>
</head>
<body>
<h3>이미지 게시판</h3>
<label><input type="button" id="addbtn"value="이미지 올리기"></label>
<form id ="upload_form" method="POST" action="" enctype="multipart/form=data">
	<table border="1">
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" id="title"></td>
		</tr>
		<tr>
			<th>게시자</th>
			<td><input type="text" name="writer" id="writer"></td>
		</tr>
		<tr>
			<th>글 비밀번호</th>
			<td><input type="text" name="pwd" id="pwd"></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="file" id="file"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="save" id="upload_btn"></td>
		</tr>
	</table>
	<input type="hidden" id="num">
</form>
<div id="imglist"></div>

</body>
</html>