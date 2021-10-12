<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String id = (String)session.getAttribute("sessionId");
	
	MemberDAO dao = new MemberDAO();
	
	String name = dao.getName(id);
%>
<div style="margin: 0 auto; width: 100%;">
	<b><%=name%>님은 현재 로그인 중입니다.</b>
	<br><br>
	<button type="button" class="btn btn-warning" onclick="location.href='index.jsp?go=login/logoutAction.jsp'">로그아웃</button>
	<button type="button" class="btn btn-info" onclick="location.href='index.jsp'">메인페이지</button>
</div>
</html>