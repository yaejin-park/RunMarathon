<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
	session.removeAttribute("sessionLogin");
%>	
	<script type="text/javascript">
		response.sendRedirect("../index.jsp?go=login/loginMain.jsp");
	</script>
	<jsp:include page="loginMain.jsp"/>
</body>
</html>
