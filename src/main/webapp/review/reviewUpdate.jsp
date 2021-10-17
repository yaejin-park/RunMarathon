<%@page import="data.dao.ReviewDAO"%>
<%@page import="data.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String currentPage=request.getParameter("currentPage");
	
	ReviewDTO dto=new ReviewDTO();

	dto.setSubject(request.getParameter("subject"));
	dto.setPhoto(request.getParameter("photo"));
	dto.setContent(request.getParameter("content"));
	dto.setIdx(request.getParameter("idx"));
	
	

	ReviewDAO dao=new ReviewDAO();
	
	
	//db수정
	dao.updateReview(dto);
	
	String path="../index.jsp?go=review/reviewDetail.jsp?idx="+dto.getIdx()+"&currentPage="+currentPage+"&key=list&menu_one=11&menu_two=28";
	response.sendRedirect(path);
%>