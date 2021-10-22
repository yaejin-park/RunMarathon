<%@page import="data.dao.QuestionDAO"%>
<%@page import="data.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	QuestionDTO dto = new QuestionDTO();
	QuestionDAO dao = new QuestionDAO();
	String idx = request.getParameter("idx");
	String currentPage = request.getParameter("currentPage");
	dto = dao.getData(idx);
%>

<form action="questionBoard/updateAction.jsp" method="post">
	<input type="hidden" name="idx" value="<%=idx%>">
	<input type="hidden" name="currentPage" value="<%=currentPage%>">
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
					<input type="text" name="writer" class="form-control" required="required" style="width: 130px;"
					readonly="readonly" value="<%=dto.getWriter() %>">
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>
					<input type="text" name="subject" class="form-control" required="required" style="width: 600px;" value="<%=dto.getSubject() %>">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="password" class="form-control" required="required" style="width: 130px;" value="<%=dto.getPass() %>">
				</td>
			</tr>
		</thead>
		
		<tr>
			<td colspan="2">
				<textarea name="content" class="form-control" required="required" style="width: 780px; height: 300px;"><%=dto.getContent() %></textarea>		
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" class="btn btn-add" style="width: 120px;">저장</button>
				<button type="button" class="btn btn-add" style="width: 120px;" 
				onclick="location.href='index.jsp?go=questionBoard/questionList.jsp&menu_one=12&menu_two=19'">목록</button>
			</td>
		</tr>
	</table>   
</form>