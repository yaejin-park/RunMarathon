<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="questionBoard/questionAction.jsp" method="post">
	<table class="table table-bordered" style="width: 800px;">
		<caption>Question</caption>
		<thead>
			<colgroup>
				<col width="150px">
				<col width="*">
			</colgroup>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" class="form-control" required="required" style="width: 130px;">
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>
					<input type="text" name="subject" class="form-control" required="required" style="width: 600px;">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="password" class="form-control" required="required" style="width: 130px;">
				</td>
			</tr>
		</thead>
		
		<tr>
			<td colspan="2">
				<input type="text" name="content" class="form-control" required="required" style="width: 780px; height: 300px;">		
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-warning" style="width: 120px;">저장하기</button>
				<button type="button" class="btn btn-warning" style="width: 120px;" onclick="location.href='index.jsp?go=questionBoard/questionList.jsp'">목록</button>
			</td>
		</tr>
	</table>   
</form>