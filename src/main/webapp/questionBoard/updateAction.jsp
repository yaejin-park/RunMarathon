<%@page import="data.dao.QuestionDAO"%>
<%@page import="data.dto.QuestionDTO"%>
<%@page import="data.dto.NoticeDTO"%>
<%@page import="data.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//엔코딩
	request.setCharacterEncoding("UTF-8");

	String currentPage = request.getParameter("currentPage");
	
	//dto선언 및 변경 된 내용 dto에 저장
	QuestionDTO dto = new QuestionDTO();
	dto.setIdx(request.getParameter("idx"));
	dto.setSubject(request.getParameter("subject"));
	dto.setPass(request.getParameter("password"));
	dto.setContent(request.getParameter("content"));
	
	//dao에 update하기
	QuestionDAO dao = new QuestionDAO();
	dao.updateQuestion(dto);
	
	//수정했던 페이지로 이동
	String idx = request.getParameter("idx");
	String path = "../index.jsp?go=questionBoard/questionList.jsp?&menu_one=12&menu_two=19&currentPage=" + currentPage;
	response.sendRedirect(path);
%>