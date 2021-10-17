<%@page import="data.dao.SmartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	

	SmartDAO dao=new SmartDAO();
	
	//db삭제
	dao.deleteCommunity(idx);
	
	String path="../index.jsp?go=community/communityList.jsp&menu_one=11&menu_two=27";
	response.sendRedirect(path);
%>