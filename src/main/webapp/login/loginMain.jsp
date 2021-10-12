<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인시, 
	String sessionLogin = (String)session.getAttribute("sessionLogin");
	
	//로그인 안됐으면
	if(sessionLogin!="yes"){
	%>
		<jsp:include page="loginForm.jsp"/>
	<%
	} else{
	%>
		<jsp:include page="logoutForm.jsp"/>
	<%
	}
%>
