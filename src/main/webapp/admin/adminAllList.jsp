<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

button {
	font-family: Gugi;
}

.search_bar_top {
	display: inline-block;
}

.cap {
	margin-top: 10px;
	font-size: 25pt;
	text-align: center;
}
</style>
</head>
<body>
	<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	List<AdminApplyDTO> list = dao.getAllMembers();
	int idx = 1;
%>
	<div class="cap">
		<b>전체 회원 목록</b>
	</div>
	<form class="serachform" action="adminMemberSearch.jsp">
		<div align="center" style="margin-top: 10px">
			<div class="search_bar_top">
				<select id="selopt" style="width: 100px; height: 30px">
					<option disabled="disabled" selected="selected">검색옵션</option>
					<option value="name">이름</option>
					<option value="nink">닉네임</option>
					<option value="id">아이디</option>
				</select>
			</div>
			<div class="search_bar_top">
				<input type="text" id="stext" style="width: 200px; height: 30px"
					class="form-control">
			</div>
			<div class="search_bar_top">
				<button type="submit" style="height: 30px">검색</button>
			</div>
		</div>
	</form>
	<div>
		<table class="table table-bordered" style="width: 1800px"
			align="center">
			<thead>
				<tr>
					<th style="width:50px">번호</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>아이디</th>
					<th>핸드폰</th>
					<th>주소</th>
					<th>본인인증질문</th>
					<th>본인인증답변</th>
					<th>회원관리(수정/삭제)</th>
				</tr>
			</thead>
			<tbody>
				<%	for(AdminApplyDTO adt:list) { %>
				<tr>
					<td><%=idx%></td>
					<td><%=adt.getName()%></td>
					<td><%=adt.getNick()%></td>
					<td><%=adt.getId()%></td>
					<td><%=adt.getHp()%></td>
					<td><%=adt.getAddr1()%> <%=adt.getAddr2()%></td>
					<td><%=adt.getAuth1()%></td>
					<td><%=adt.getAuth2()%></td>
					<td>
						<button type="button" class="btn btn-warning btn-sm">수정</button>
						<button type="button" class="btn btn-danger btn-sm btn-del" value="<%=adt.getId()%>">
						 삭제</button>
					</td>
				</tr>
				<% idx++; } %>
			</tbody>
		</table>
	</div>

<script type="text/javascript">
$(function(){	
	$(".btn-del").click(function() {
		var id = $(this).val();
		alert("회원정보를 삭제합니다.");
		//location.href = "./index.jsp?go=admin/adminMemberDelete.jsp&delid="+id;
		location.href = "./index.jsp?go=admin/adminMemberDelete.jsp&menu_one=13&menu_two=30&delid="+id;
	});
});
</script>
</body>
</html>