<%@page import="data.dao.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	
	

	ReviewDAO dao=new ReviewDAO();
	
	//db삭제
	dao.deleteReview(idx);
	
	String path="../index.jsp?go=review/reviewList.jsp&menu_one=11&menu_two=28";
	response.sendRedirect(path);
%>