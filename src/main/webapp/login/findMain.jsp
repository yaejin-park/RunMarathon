<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
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
	//핸드폰 선택 이벤트
	$("#selHp1").change(function() {
		$("#hp1").val($(this).val());
		$("#hp2").focus();
	});
	
	//휴대폰 중간칸 쓰면 포커스 이동
	$("#hp2").keyup(function() {
		if($(this).val().length==4){
			$("#hp3").focus();
		} 
	});	
});	
</script>
</head>

<body>
<form action="login/findResult.jsp" method="post" class="form-inline">
<table class="table" style="width: 600px; padding: 30px; margin: 30px;">
<thead>
	<tr>
		<th>아이디 찾기</th>
		<th>비밀번호 찾기</th>
	</tr>
<thead>

<tbody>
	<tr id="question" style="padding: 30px;">
		<td colspan="2" style="font-size: 1.3em; padding: 30px;">
			가입 당시 작성한 정보를<br>
			입력해 주세요.
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="text" class="form-control"  name="name" required="required" placeholder="이름" style="width: 412px;">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="text" name="hp1" id="hp1" class="form-control" required="required" maxlength="4" style="width: 80px;" value="" placeholder="010">
			<select id="selHp1" class="form-control" style="width: 100px; background-color: #eeeeee">
				<option value="-" selected="selected" disabled="disabled">직접입력</option> 
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="016">016</option>
				<option value="017">017</option>
				<option value="018">018</option>
				<option value="019">019</option>
			</select>
			<b>-</b>
			<input type="text" name="hp2" id="hp2" class="form-control" required="required" maxlength="4" style="width: 140px; width: 100px;">
			<b>-</b>
			<input type="text" name="hp3" id="hp3" class="form-control" required="required" maxlength="4" style="width: 140px; width: 100px;">
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<select name="selAuth" id="selAuth" class="form-control">
						<option value="-" disabled="disabled" selected="selected">본인확인 질문</option>
						<option value="character">좋아하는 캐릭터는?</option>
						<option value="school">초등학교 이름은?</option>
						<option value="movie">좋아하는 영화는?</option>
						<option value="freind">친한 친구의 이름은?</option>
						<option value="hobby">나의 취미는?</option>
			</select>
			<input type="text" name="auth" class="form-control" required="required" maxlength="20" placeholder="답변" style="width: 250px;">
			
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit" id="findBtn" class="btn btn-default" style="width: 412px; height: 45px; border: 2px grey solid">확인</button>
		</td>
	</tr>
</tbody>
</table>
</form>
</body>
</html>