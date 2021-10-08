<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function () {
	
		
		
	});


</script>
</head>

<body>
<div>
	<table>
		<tbody>
			<tr>
				<th rowspan="3" style="line-height: 0px;">약관동의</th>
				<td>전체동의</td>
			</tr>
			<tr>
				<td>이용약관 동의<span style="color: blue; font-weight: bold;">(필수)</span></td>
			</tr>
			<tr>
				<td>개인정보처리방침 동의<span style="color: blue; font-weight: bold;">(필수)</span></td>
			</tr>
		</tbody>
	
	
	</table>
</div>
<br><br><br>
<hr>
<br><br><br>
<div>
	<form action="join/joinAdd.jsp" method="post">
		<table>
			<tbody>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="name" class="form-control" autofocus="autofocus" required="required">
					</td>
				</tr>
				<tr>
					<th>휴대전화 번호</th>
					<td>
						<select name="hp1">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
						</select>
					</td>
					<td>
						<input type="text" name="hp2" class="form-control" required="required" maxlength="4">
					</td>
					<td>
						<input type="text" name="hp3" class="form-control" required="required" maxlength="4">
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
					<input type="text" name="id" class="form-control" required="required">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
					<input type="password" name="pass" class="form-control" required="required" maxlength="15">
					<input type="password" name="pass" class="form-control" required="required" maxlength="15">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
</body>
</html>