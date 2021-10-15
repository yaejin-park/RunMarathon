<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	session.removeAttribute("sessionLogin");
	response.sendRedirect("../index.jsp?go=login/loginMain.jsp&menu_one=21");
%>	
