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
		<table id="tbl" class="table table-bordered" style="width: 1400px"
			align="center">
			<thead>
				<tr>
					<th style="width:50px">번호</th>
					<th>이름</th>
					<th>닉네임</th>
					<th>아이디</th>
					<th>패스워드</th>
					<th>핸드폰</th>
					<th colspan="2">주소</th>
					<th>본인인증질문</th>
					<th>본인인증답변</th>
					<th>회원관리(수정/삭제)</th>
				</tr>
			</thead>
			<tbody>
				<%	for(AdminApplyDTO adt:list) { %>
				<tr>
					<td><%=adt.getIdx()%></td>
					<td><%=adt.getName()%></td>
					<td><%=adt.getNick()%></td>
					<td><%=adt.getId()%></td>
					<td><%=adt.getPass()%></td>
					<td><%=adt.getHp()%></td>
					<td><%=adt.getAddr1()%></td>
					<td><%=adt.getAddr2()%></td>
					<td><%=adt.getAuth1()%></td>
					<td><%=adt.getAuth2()%></td>
					<td>
						<button type="button" class="btn btn-warning btn-sm">수정</button>
						<button type="button" class="btn btn-danger btn-sm"
							onclick="delfunc('<%=adt.getId()%>')">삭제</button>
					</td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
	
	
	<!-- 삭제 Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">삭제 확인</h4>
				</div>
				<div class="modal-body form-inline">
					<input type="hidden" id="delid"><br> <b>삭제 비밀번호:</b> <input
						type="password" id="delpass" class="form-control"
						style="width: 120px;">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default delbtn"
						data-dismiss="modal">삭제</button>
				</div>
			</div>

		</div>
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