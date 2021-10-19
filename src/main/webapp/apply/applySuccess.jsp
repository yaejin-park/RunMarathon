<%@page import="data.dto.ApplyDTO"%>
<%@page import="data.dao.ApplyDAO"%>
<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = (String)session.getAttribute("sessionId");
	
	MemberDAO dao = new MemberDAO();
	String name = dao.getName(id);
	
	ApplyDAO adao = new ApplyDAO();
	ApplyDTO dto = adao.getApply(id);
%>
<body>
<div style="margin: 0 auto; width: 100%; font-size: 1.1em;" >
	<b><%=name%>님의 <%=dto.getMarathon()%> 신청 내역</b>
	<br><br>
</div>
<form class="form-inline" name="joinfrm">
<div>
	<table class="table" style="width: 760px; float: left;">
		<tbody>
			<tr>
				<th width="30%">이름</th>
				<td><%=dto.getName() %></td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td><%=dto.getHp()%></td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td><%=dto.getAddr1()%> <%= dto.getAddr2()%></td>				
			</tr>
			
			<tr>
				<th>코스</th>
				<td><%=dto.getCourse()%></td>
			</tr>
			<tr>
				<th>일정</th>
				<td><%=dto.getTime()%></td>
			</tr>
			<tr>
				<th>참여인원</th>
				<td><%=dto.getPerson()%>명</td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td>무통장입금 비트은행 901-123-41234-02</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" class="btn btn-add" onclick="location.href='index.jsp?go=apply/applyModify.jsp&menu_one=8&menu_two=9&type=2'">수정</button>
					<button type="button" class="btn btn-add" onclick="location.href='index.jsp'">메인페이지</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>
</body>
</html>