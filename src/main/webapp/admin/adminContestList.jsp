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
button {
	font-family: Gugi;
	width: 200px;
	height: 400px;
}

h4 {
	white-space: normal;
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
<form action="admin/adminSelectListOne.jsp" method="get">
<div align="center" style="margin-top: 50px">
<%	for(AdminApplyDTO adt:list) { %>
		<button type="submit" class="btn btn-info" name="tname" value="<%=adt.getContestName()%>">
			<h4><%=adt.getContestName()%></h4><br>
			<p>대회 시작일자: <%=adt.getContestStart()%></p>
			<p>대회 종료일자: <%=adt.getContestEnd()%></p>
			<p>접수 시작일자: <%=adt.getApplyStart()%></p>
			<p>접수 마감일자: <%=adt.getApplyEnd()%></p>
			<p>접수비: <%=adt.getMoney()%></p>
		</button>
<%  }  %>
</div>
</form>
<script type="text/javascript">

</script>
</body>
</html>