<%@page import="data.dao.MemberDAO"%>
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
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	
	String name = dao.getName(id);
%>

<div style="margin: 0 auto; width: 100%;">
	<b><%=name%>님의 회원가입을 축하드립니다</b>
	<br><br>
	<button type="button" class="btn btn-add" onclick="location.href='index.jsp?go=login/loginForm.jsp&menu_one=21'">로그인</button>
	<button type="button" class="btn btn-update" onclick="location.href='index.jsp'">메인페이지</button>
</div>
</body>
</html>