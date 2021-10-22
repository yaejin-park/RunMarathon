<%@page import="data.dto.ApplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionLogin = (String)session.getAttribute("sessionLogin");
String type = request.getParameter("type");
if(sessionLogin==null){
	response.sendRedirect("../index.jsp?go=login/loginMain.jsp&menu_one=21");
} else{
	if(type.equals("1")){
		response.sendRedirect("../index.jsp?go=apply/applyForm.jsp&menu_one=8&menu_two=9&type=1");
	}else{
		response.sendRedirect("../index.jsp?go=apply/applyForm.jsp&menu_one=8&menu_two=9&type=2");
	}
}
%>