<%@page import="data.dao.QuestionDAO"%>
<%@page import="data.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//엔코딩
	request.setCharacterEncoding("UTF-8");
	
	//데이터 읽기
	QuestionDTO dto = new QuestionDTO();
	QuestionDAO dao = new QuestionDAO();
	
	dto.setWriter(request.getParameter("writer"));
	dto.setPass(request.getParameter("password"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	dto.setRef(dao.getMaxRef()+1);
	
	//db insert
	dao.insertQuestion(dto);
	
	String path = "../index.jsp?go=questionBoard/questionList.jsp&menu_one=12&menu_two=19";
	response.sendRedirect(path);
%>