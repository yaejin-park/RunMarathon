<%@page import="data.dto.SmartDTO"%>
<%@page import="data.dao.SmartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String currentPage=request.getParameter("currentPage");
	
	SmartDTO dto=new SmartDTO();

	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	dto.setIdx(request.getParameter("idx"));
	
	

	SmartDAO dao=new SmartDAO();
	
	
	//db수정
	dao.updateSmart(dto);
	
	String path="../index.jsp?go=community/detail.jsp?idx="+dto.getIdx()+"&currentPage="+currentPage+"&key=list&menu_one=11&menu_two=27";
	response.sendRedirect(path);
%>