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

button.btn-basic, button.btn-update {
	font-size: 10pt;
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
%>
<p><input type="text" style="width:80px; border: none;" id="recordid" value="<%=recordid%>">회원님 완주 정보</p>
<table class="table table-bordered" style="width: 500px;">
	<tr>
		<th>완주 거리</th>
		<td>
			<input type="text" style="width:50px" id="finishcourse">K
		</td>
	</tr>
	<tr>
		<th>완주 시간</th>
		<td>
			<input type="text" style="width:50px" id="finishhour">시간
			<input type="text" style="width:50px" id="finishminute">분
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<button type="button" class="btn-basic btn btn-warning" onclick="goback()">뒤로 가기</button>
			<button type="submit" class="btn-update btn btn-warning savetm">완주 기록 저장</button>
			<button type="button" class="btn-update btn btn-warning getpace">페이스 확인</button>
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

$(".getpace").click(function() {
	var finishcourse = $("#finishcourse").val();
	var finishhour = $("#finishhour").val();
	var finishminute = $("#finishminute").val();
	var recordid = $("#recordid").val();
	location.href = "./index.jsp?go=admin/adminPace.jsp&finishcourse="+finishcourse+"&finishhour="+finishhour+"&finishminute="+finishminute+"&recordid="+recordid;
});


</script>
</body>
</html>