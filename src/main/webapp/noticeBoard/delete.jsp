<%@page import="data.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String idx = request.getParameter("idx");
	String currentPage = request.getParameter("currentPage");

	//db삭제
	NoticeDAO dao = new NoticeDAO();
	dao.deleteNotice(idx);
	
	//삭제 후 다시 List로 이동
	String go = "../index.jsp?go=noticeBoard/noticeList.jsp?&menu_one=12&menu_two=18&currentPage=" + currentPage;
	response.sendRedirect(go);
%>