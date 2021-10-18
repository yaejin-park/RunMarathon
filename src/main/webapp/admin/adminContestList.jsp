<%@page import="java.net.URLEncoder"%>
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
h4 {
	white-space: normal;
}

#nemo {
	width: 300px;
	height: 400px;
	background-color: skyblue;
	float: left;
	display: inline-block;
	margin: 20px;
}

button {
	width: 200px;
}
</style>
</head>
<body>
<%
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	AdminApplyDTO dto = new AdminApplyDTO();
	List<AdminApplyDTO> list = dao.getContestName();
%>
<div align="center" style="margin-top: 50px;">
<%	for(AdminApplyDTO adt:list) { %>
		<div id="nemo">
			<h4><%=adt.getContestName()%></h4><br>
			<p>대회 시작일자: <%=adt.getContestStart()%></p>
			<p>대회 종료일자: <%=adt.getContestEnd()%></p>
			<p>접수 시작일자: <%=adt.getApplyStart()%></p>
			<p>접수 마감일자: <%=adt.getApplyEnd()%></p>
			<p>접수비: <%=adt.getMoney()%></p><br>
			<%-- <form action="./index.jsp?go=admin/adminSelectListMember.jsp" method="post">
				<button type="submit" name="tname" value="<%=adt.getContestName()%>">
				참가 회원 목록</button><br>
			</form> --%>
			<button type="button" name="marathon" value="<%=adt.getContestName()%>" class="marathon">
				참가 회원 목록</button><br>
			<!-- <form action="adminSelectListDelivery.jsp" method="get">
				<button type="submit">
				기념품 발송 정보 입력</button><br>
			</form>
			<form action="adminSelectListRecord.jsp" method="get">
				<button type="submit">
				완주 시간 기록</button>
			</form> -->
			<button type="button" name="deliver" value="<%=adt.getContestName()%>" class="deliver">
				기념품 발송 정보 입력</button><br>
			<button type="button" name="timerecord" value="<%=adt.getContestName()%>" class="timerecord">
				완주 시간 기록</button><br>
		</div>
<%  }  %>
</div>
<script type="text/javascript">
	$("button.marathon").click(function(){
		var marathon=$(this).val();
		//alert(tname);
		location.href='./index.jsp?go=admin/adminSelectListMember.jsp?marathon='+marathon;
	});
	
	$("button.deliver").click(function(){
		var deliver=$(this).val();
		//alert(tname);
		location.href='./index.jsp?go=admin/adminSelectListDelivery.jsp?deliver='+deliver;
	});
	
	$("button.timerecord").click(function(){
		var timerecord=$(this).val();
		//alert(tname);
		location.href='./index.jsp?go=admin/adminSelectListRecord.jsp?timerecord='+timerecord;
	});
</script>
</body>
</html>