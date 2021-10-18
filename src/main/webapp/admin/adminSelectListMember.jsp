<%@page import="java.net.URLEncoder"%>
<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.0.js"></script>


<style type="text/css">
#tbl {
	margin-top: 10px;
}

#tbl *, #recordTable * {
	text-align: center;
}

#tbl th {
	background-color: skyblue;
}

td {
	white-space: normal;
}

.search_bar_top {
	display: inline-block;
}

.cap {
	margin-top: 10px;
	font-size: 25pt;
	text-align: center;
}

.info_text{display:inline-block;}
</style>
</head>
<body>
<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	request.setCharacterEncoding("UTF-8");
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
					<th>참가코스</th>
					<th>참가시간</th>
					<th>참가인원수</th>
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
					<td><%=adt.getAcourse()%></td>
					<td><%=adt.getAtime()%></td>
					<td><%=adt.getAperson()%></td>
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