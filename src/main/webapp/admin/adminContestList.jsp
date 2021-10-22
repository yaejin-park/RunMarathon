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
h2 {
	white-space: normal;
}

#nemo {
	width: 400px;
	height: 300px;
	background-color: skyblue;
	display: inline-block;
	margin: 20px;
	padding: 20px 20px;
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
			<h2><%=adt.getContestName()%></h2><br>
			<p>대회 시작일자: <%=adt.getContestStart()%></p>
			<p>대회 종료일자: <%=adt.getContestEnd()%></p>
			<p>접수 시작일자: <%=adt.getApplyStart()%></p>
			<p>접수 마감일자: <%=adt.getApplyEnd()%></p>
			<p>접수비: <%=adt.getMoney()%></p><br>
			<button type="button" name="marathon" value="<%=adt.getContestName()%>" class="btn-add marathon">
			 참가 현황</button><br>
		</div>
<%  }  %>
</div>
<script type="text/javascript">
	$("button.marathon").click(function(){
		var marathon=$(this).val();
		//alert(tname);
		location.href='./index.jsp?go=admin/adminSelectListMember.jsp&menu_one=13&menu_two=31&marathon='+marathon;
	});
</script>
</body>
</html>