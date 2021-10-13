<%@page import="data.dao.NoticeDAO"%>
<%@page import="data.dto.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("UTF-8");
	
	//데이터 읽기
	NoticeDTO dto = new NoticeDTO();
	dto.setWriter(request.getParameter("writer"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	
	//db insert
	NoticeDAO dao = new NoticeDAO();
	dao.insertNotice(dto);
	
	//방금 추가된 idx 값 얻기
	String idx = dao.getMaxIdx();
	String path = "../index.jsp?go=noticeBoard/detail.jsp?&menu_one=12&menu_two=18&idx=" + idx;
	response.sendRedirect(path);
%>