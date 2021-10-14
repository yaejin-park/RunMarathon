<%@page import="data.dao.QuestionDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int ref = Integer.parseInt(request.getParameter("ref"));
	String currentPage = request.getParameter("currentPage");
	
	//db삭제
	QuestionDAO dao = new QuestionDAO();
	dao.deleteQuestion(ref);
	
	//삭제 후 다시 List로 이동
	String go = "../index.jsp?go=questionBoard/questionList.jsp?&menu_one=12&menu_two=19&currentPage=" + currentPage;
	response.sendRedirect(go);
%>