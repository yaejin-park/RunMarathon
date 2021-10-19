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
p {
	padding: 10px;
}

th, td {
	font-size: 12pt;
}

th {
	width: 100px;
}

button.btn-basic, button.btn-add {
	font-size: 10pt;
}

#qq {
	font-size: 9pt;
	color: red;
}
</style>
</head>
<body>
<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	request.setCharacterEncoding("UTF-8");
	String deliverid =request.getParameter("deliverid");
%>
<p><input type="text" style="width:80px; border: none;" id="deliverid" value="<%=deliverid%>">회원님 기념품 발송정보 입력</p>
<table class="table table-bordered" style="width: 500px;">
	<tr>
		<th>운송장 번호</th>
		<td>
			<input type="text" style="width:200px" id="delivernum">
		</td>
	</tr>
	<tr>
		<td colspan="2" id="qq">운송장번호 10자리를 입력해주세요.</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<button type="button" class="btn-basic btn btn-warning" onclick="goback()">뒤로 가기</button>
		<button type="submit" class="btn-add btn btn-warning savedn">기념품 발송정보 저장</button>
		</td>
	</tr>
</table>
<script type="text/javascript">
function goback() {
	history.back();
}

$(".savedn").click(function() {
	var dnum = $("#delivernum").val();
	var deliverid = $("#deliverid").val();
	alert("운송장 번호를 저장했습니다.");
	location.href = "./index.jsp?go=admin/adminDelivery.jsp&dnum="+dnum+"&deliverid="+deliverid;
});

</script>
</body>
</html>