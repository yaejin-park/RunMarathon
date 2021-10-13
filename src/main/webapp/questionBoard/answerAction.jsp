<%@page import="data.dao.QuestionDAO"%>
<%@page import="data.dto.QuestionDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//엔코딩
	request.setCharacterEncoding("UTF-8");

	//데이터 읽기
	QuestionDTO dto = new QuestionDTO();
	dto.setWriter(request.getParameter("writer"));
	dto.setPass(request.getParameter("password"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	dto.setRef(Integer.parseInt(request.getParameter("ref")));
	dto.setStep(Integer.parseInt(request.getParameter("step")));
	dto.setReforder(Integer.parseInt(request.getParameter("reforder")));
	
	//db insert
	QuestionDAO dao = new QuestionDAO();
	dao.insertAnswer(dto);
	
	String path = "../index.jsp?go=questionBoard/questionList.jsp";
	response.sendRedirect(path);
%>