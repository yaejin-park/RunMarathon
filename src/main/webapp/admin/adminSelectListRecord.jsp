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
<style>
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
	String recordid =request.getParameter("recordid");
	String hidCourse = request.getParameter("hidCourse");
%>
<p><input type="text" style="width:80px; border: none;" id="recordid" value="<%=recordid%>">회원님 완주 정보</p>
<table class="table table-bordered" style="width: 500px;">
	<tr>
		<th>완주 시간</th>
		<td>
			<input type="text" style="width:50px" id="finishhour">시간
			<input type="text" style="width:50px" id="finishminute">분
		</td>
	</tr>
	<tr>
		<td colspan="2" id="qq">완주시간이 1시간 미만이라면 시간 값은 0으로 입력해주세요</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<button type="button" class="btn-basic btn btn-warning" onclick="goback()">뒤로 가기</button>
			<button type="submit" class="btn-add btn btn-warning savetm">완주 기록 저장</button>
		</td>
	</tr>
</table>
<script type="text/javascript">
function goback() {
	history.back();
}

$(".savetm").click(function() {
	var finishcourse = $("#finishcourse").val();
	var finishhour = $("#finishhour").val();
	var finishminute = $("#finishminute").val();
	var recordid = $("#recordid").val();
	alert(recordid+"회원님의 완주 정보를 저장했습니다.");
	location.href = "./index.jsp?go=admin/adminRecord.jsp&finishcourse="+finishcourse+"&finishhour="+finishhour+"&finishminute="+finishminute+"&recordid="+recordid;
});

</script>
</body>
</html>