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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Dokdo&family=Gaegu&family=Gugi&family=Nanum+Brush+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

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
</style>
</head>
<body>
	<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	
	String tname = request.getParameter("tname");	
%>
	<div class="cap">
		<b>참가 회원 목록</b>
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
		<table id="tbl" class="table table-bordered" style="width: 1400px"
			align="center">
			<thead>
				<tr>
					<th style="width: 50px">번호</th>
					<th>참가대회</th>
					<th>아이디</th>
					<th>이름</th>
					<th >주소</th>
					<th>핸드폰</th>
					<th>참가코스</th>
					<th>참가시간</th>
					<th>참가인원수</th>
					<th>참가현황</th>
				</tr>
			</thead>
			<tbody>
				<%	List<AdminApplyDTO> list = dao.getSelectMembers(tname);
					for(AdminApplyDTO adt:list) { %>
				<tr>
					<td><%=adt.getAidx()%></td>
					<td><%=adt.getAmarathon()%></td>
					<td><%=adt.getAid()%></td>
					<td><%=adt.getAname()%></td>
					<td><%=adt.getAaddr()%></td>
					<td><%=adt.getAhp()%></td>
					<td><%=adt.getAcourse()%></td>
					<td><%=adt.getAtime()%></td>
					<td><%=adt.getAperson()%></td>
					<td>
						<button type="button" class="btn btn-default btn-sm">기념품
							발송</button>
						<button type="button" class="btn btn-success btn-sm">참가 기록</button>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		function delfunc(id) {
			$("#delid").val(id);
			$("#myModal2").modal();

			// 삭제 버튼 이벤트
			$("button.delbtn").click(
					function() {
						// id, pass 읽기
						var id = $("#delid").val();
						var pass = $("#delpass").val();

						// 삭제파일 호출
						location.href = "admin/adminMemberDelete.jsp?id=" + id
								+ "&pass=" + pass;
					});
		}
	</script>
</body>
</html>