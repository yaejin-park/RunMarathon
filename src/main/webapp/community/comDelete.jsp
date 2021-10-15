<%@page import="data.dao.SmartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	String currentPage=request.getParameter("currentPage");
	

	SmartDAO dao=new SmartDAO();
	
	//db삭제
	dao.deleteCommunity(idx);
	
	String path="index.jsp?go=community/communityList.jsp?currentPage="+currentPage;
	response.sendRedirect(path);
%>