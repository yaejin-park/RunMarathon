<%@page import="data.dto.NoticeDTO"%>
<%@page import="data.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//엔코딩
	request.setCharacterEncoding("UTF-8");

	String currentPage = request.getParameter("currentPage");
	
	//dto선언 및 변경 된 내용 dto에 저장
	NoticeDTO dto = new NoticeDTO();
	dto.setIdx(request.getParameter("idx"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	
	//dao에 update하기
	NoticeDAO dao = new NoticeDAO();
	dao.updateNotice(dto);
	
	//수정했던 페이지로 이동
	String idx = request.getParameter("idx");
	String path = "../index.jsp?go=noticeBoard/detail.jsp?&menu_one=12&menu_two=18&idx=" + idx;
	response.sendRedirect(path);
%>