<%@page import="java.util.List"%>
<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();

	String marathon =request.getParameter("marathon");
%>

	<div class="cap">
		<b><%=marathon%> 참가회원 목록</b>
	</div>
	<div id="backform">
		<button type="button" class="btn btn-warning" onclick="gogo()">참가현황관리로 돌아가기</button>
	</div>
	<div>
		<table id="tbl" class="table table-bordered" style="width: 1400px"
			align="center">
			<thead>
				<tr>
					<th style="width: 50px">번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>핸드폰</th>
					<th colspan="2">주소</th>
					<th>아이디 확인</th>
					<th>완주 시간</th>
				</tr>
			</thead>
			<tbody>
				<%	List<AdminApplyDTO> list = dao.getSelectMembers(marathon);
					for(AdminApplyDTO adt:list) { %>
				<tr>
					<td><%=adt.getAidx()%></td>
					<td><%=adt.getAid()%></td>
					<td><%=adt.getAname()%></td>
					<td><%=adt.getAhp()%></td>
					<td><%=adt.getAaddr1()%></td>
					<td><%=adt.getAaddr2()%></td>
					<td><input type="text"></td>
					<td><input type="text"></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>



 
<script type="text/javascript">
function gogo() {
	location.href = "./index.jsp?go=admin/adminContestList.jsp?&menu_one=13&menu_two=31";
}
</script>
</body>
</html>
