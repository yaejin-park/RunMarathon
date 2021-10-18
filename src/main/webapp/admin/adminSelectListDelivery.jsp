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
	String deliverid =request.getParameter("deliverid");
%>
	<div">
		<input type="text" style="width:100px;" id="deliverid" value="<%=deliverid%>"> 회원님 기념품 발송정보 입력
	</div>
	<div>
		<b>운송장 번호 </b>
		<input type="text" style="width:100px" id="delivernum">
	</div>
	<div id="backform">
		<button type="button" class="btn btn-warning" onclick="goback()">뒤로 가기</button>
		<button type="submit" class="btn btn-warning savedn">기념품 발송정보 저장</button>
	</div>
<script type="text/javascript">
function goback() {
	history.back();
}

$(".savedn").click(function() {
	var dnum = $("#delivernum").val();
	var deliverid = $("#deliverid").val();
	//alert("운송장 번호를 저장했습니다." + dnum + deliverid);
	location.href = "./index.jsp?go=admin/adminDelivery.jsp&dnum="+dnum+"&deliverid="+deliverid;
});

</script>
</body>
</html>