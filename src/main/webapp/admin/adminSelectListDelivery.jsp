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
	request.setCharacterEncoding("UTF-8");
	String deliver =request.getParameter("deliver");
%>
<form action="./index.jsp?go=admin/adminDelivery.jsp" method="post">
	<div class="cap">
		<b><%=deliver%> 기념품 발송정보 입력</b>
	</div>
	<div id="backform">
		<button type="button" class="btn btn-warning" onclick="gogo()">참가현황관리로 돌아가기</button>
		<button type="submit" class="btn btn-warning">기념품 발송정보 저장</button>
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
					<th>운송장 번호</th>
				</tr>
			</thead>
			<tbody>
				<%	List<AdminApplyDTO> list = dao.getSelectMembers(deliver);
					for(AdminApplyDTO adt:list) { %>
				<tr>
					<td><%=adt.getAidx()%></td>
					<td><%=adt.getAid()%></td>
					<td><%=adt.getAname()%></td>
					<td><%=adt.getAhp()%></td>
					<td><%=adt.getAaddr1()%></td>
					<td><%=adt.getAaddr2()%></td>
					<td><input type="text" style="width:100px" id="checkid" value=""></td>
					<td><input type="text" style="width:100px" id="delivernum" value=""></td>
				</tr>
				<% } %>
			</tbody>
		</table>
	</div>
</form>

 
<script type="text/javascript">
	function gogo() {
		location.href = "./index.jsp?go=admin/adminContestList.jsp?&menu_one=13&menu_two=31";
	}

/* 	$("#sendinfo").click(function(){
		var marathon=$(this).val();
		//alert(tname);
		location.href='./index.jsp?go=admin/adminSelectListMember.jsp?marathon='+marathon;
	}); */

</script>
</body>
</html>