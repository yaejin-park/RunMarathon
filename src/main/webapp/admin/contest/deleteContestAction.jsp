<%@page import="data.dto.ContestDTO"%>
<%@page import="data.dao.ContestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	ContestDAO dao = new ContestDAO();
	String []arr = name.split("-");
	for(int i=0; i<arr.length; i++){
		String contestName = arr[i].trim();
		dao.deleteContest(contestName);
	}
%>