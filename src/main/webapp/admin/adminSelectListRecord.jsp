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
</head>
<body>
<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	request.setCharacterEncoding("UTF-8");
	String recordid =request.getParameter("recordid");
%>
	<div">
		<input type="text" style="width:100px;" id="recordid" value="<%=recordid%>"> 회원님 완주 정보
	</div>
	<div>
		<b>완주 시간</b>
		<input type="text" style="width:100px" id="finishhour">시간
		<input type="text" style="width:100px" id="finishminute">분
	</div>
	<div id="backform">
		<button type="button" class="btn-basic btn btn-warning" onclick="goback()">뒤로 가기</button>
		<button type="submit" class="btn-update btn btn-warning savetm">완주 기록 저장</button>
	</div>
<script type="text/javascript">
function goback() {
	history.back();
}

$(".savetm").click(function() {
	var finishhour = parseInt($("#finishhour").val());
	var finishminute = parseInt($("#finishminute").val()/60);
	var recordid = $("#recordid").val();
	//alert(finishminute);
	//alert("완주 정보를 저장했습니다." + finishhour + finishminute + recordid);
	location.href = "./index.jsp?go=admin/adminRecord.jsp&finishhour="+finishhour+"&finishminute="+finishminute+"&recordid="+recordid;
});

</script>
</body>
</html>