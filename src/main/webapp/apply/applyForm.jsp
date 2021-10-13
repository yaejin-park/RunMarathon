<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	th{
		width: 100px;
	}
	
	.course{
		margin-right: 20px;
		width: 60px;
	}
	
</style>
</head>
<body>
<form action="apply/applyAction.jsp" method="post" class="form-inline" name="joinfrm">
<div>
	<table class="table table-bordered" style="width: 760px; float: left;">
		<tbody>
			<tr>
				<td colspan="2">
					<input type="checkbox" id="getData">회원정보와 동일
				</td>
			</tr>
			<tr>
				<th style="width: 30%">이름</th>
				<td>
					<input type="text" name="name" class="form-control" autofocus="autofocus" required="required">
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="hp1" id="hp1" class="form-control" required="required" maxlength="4" style="width: 100px;" value="">
					<select id="selHp1" class="form-control" style="width: 100px; background-color: #BDD6FF">
						<option value="-" selected="selected">직접입력</option> 
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<b>-</b>
					<input type="text" name="hp2" id="hp2" class="form-control" required="required" maxlength="4" style="width: 160px; width: 100px;">
					<b>-</b>
					<input type="text" name="hp3" id="hp3" class="form-control" required="required" maxlength="4" style="width: 160px; width: 100px;">
				</td>
			</tr>

			
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="addr1" id="addr1" class="form-control" required="required"  placeholder="주소" readonly="readonly">
					<button type="button" class="btn btn-info" id="searchAddr">주소검색</button>
					<br><br>
					<input type="text" name="addr2" id="addr2" class="form-control" required="required"  placeholder="상세주소 입력" style="width: 300px;">
				</td>					
			</tr>
			
			<tr>
				<th>코스</th>
				<td>
					<button type="button" id="course42" value="42K" class="btn btn-default course">42K</button>
					<button type="button" id="course25" value="25K" class="btn btn-default course">25K</button>
					<button type="button" id="course15" value="15K" class="btn btn-default course">15K</button>
				</td>
			</tr>
			<tr>
				<th>시간</th>
				<td>
					<select name="time" id="time" class="form-control">
						<option value="-" disabled="disabled">선택</option>
						<option value="18:00">18:00</option>
						<option value="18:30">18:30</option>
						<option value="19:00">19:00</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" id="joinYes" class="btn btn-info" style="height: 52px; width: 160px; font-size: 1.1em;">회원가입하기</button>&nbsp;&nbsp;
					<button type="reset" id="joinNo" class="btn btn-default" style="height: 52px; width: 130px; font-size: 1.1em;">취소</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>
</body>
</html>