<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성하기</title>
</head>
<body>
<form action="member/memberadd.jsp" method="post" class="form-inline" name="memberfrm"
	onsubmit="return check(this)">
<table class="table tablr-bordered" style="width: 500px;">
	<caption><b>회원 가입</b></caption>
	<tr>
		<th width="100" bgcolor="#aaa">아이디</th>
		<td>
			<input type="text" name="id" maxlength="8" class="form-control"
				required="required" style="width: 120px;" readonly="readonly">
				<button type="button"  class="btn btn-danger btn-sm" id="btnidcheck">아이디 입력</button>
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">비밀번호</th>
		<td>
			<input type="password" name="pass" class="form-control"
				required="required" style="width: 120px;"
				placeholder="비밀번호">
			<input type="password" name="pass2" class="form-control"
				required="required" style="width: 120px;">	
				
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">이름</th>
		<td>
			<input type="text" name="name" class="form-control"
				required="required" style="width: 120px;">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">핸드폰</th>
		<td>
			<input type="text" name="hp" class="form-control"
				required="required" style="width: 200px;">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">주소</th>
		<td>
			<input type="text" name="addr" class="form-control"
				required="required" style="width: 300px;">
		</td>
	</tr>
	<tr>
		<th width="100" bgcolor="#aaa">이메일</th>
		<td>
			<input type="text" name="email1" class="form-control"
				required="required" style="width: 80px;">
			<b>@</b>
			<input type="text" name="email2" id="email2" class="form-control"
				required="required" style="width: 150px;">	
			<select id="selemail">
				<option value="-">직접입력</option>
				<option value="naver.com">네이버</option>
				<option value="nate.com">네이트</option>
				<option value="gmail.com">구글</option>
				<option value="hanmail.net">다음</option>		
			</select>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2">
			<button type="submit" class="btn btn-default"
			style="width: 100px;">저장하기</button>
			
			<button type="reset" class="btn btn-default"
			style="width: 100px;">다시하기</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>