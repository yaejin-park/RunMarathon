<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table th, td{
		text-align: center;
		padding: 10px;
	}
	
	.form-control{
		height: 43px;
	}

</style>

<script type="text/javascript">
$(function(){
	//탈퇴 버튼
	$("#yesBtn").click(function() {
		//비밀번호 서로 불일치
		if($("#pass1").val()!=$("#pass2").val()){
			alert("비밀번호가 서로 일치하지 않습니다");
		}else{
		//비밀번호 서로 일치
			//db비밀번호와 일치한지 확인
			var pass = $("#pass1").val();
			
			location.href = "./index.jsp?go=myPage/deleteMember_ajax.jsp&pass="+pass;
		}
	});
	
});	

</script>

</head>

<body>

<form action="myPage/deleteSuccess.jsp" method="post" class="form-inline">
<input type="hidden" id="findType" name="find-type" value="findId">
<table class="table" style="width: 600px; padding: 30px; margin: 30px;">
<tbody>
	<tr id="question" style="padding: 30px;">
		<td colspan="2" style="font-size: 1.3em; padding: 30px;">
			탈퇴처리를 위해<br>
			비밀번호를 입력해주세요
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="password" class="form-control"  name="pass1" id="pass1" required="required" placeholder="기존 비밀번호" style="width: 412px;">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="password" class="form-control"  name="pass2" id="pass2" required="required" placeholder="비밀번호 확인" style="width: 412px;">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<button type="button" id="yesBtn" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">탈퇴</button>
			<button type="button" id="cancleBtn" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid" onclick="location.href='./index.jsp?go=myPage/myPage.jsp'">취소</button>
		</td>
	</tr>
</tbody>
</table>
</form>
</body>
</html>