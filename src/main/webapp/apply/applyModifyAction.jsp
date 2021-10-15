<%@page import="data.dto.ApplyDTO"%>
<%@page import="data.dao.ApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	ApplyDAO dao = new ApplyDAO();

	String name= request.getParameter("name");
	String hp= request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String addr1= request.getParameter("addr1");
	String addr2= request.getParameter("addr2");
	String course= request.getParameter("course");
	String time= request.getParameter("time");
	String person= request.getParameter("person");
	String id= request.getParameter("id");
	
	dao.modifyApply(name, hp, addr1, addr2, course, time, person, id);
	
	response.sendRedirect("../index.jsp?go=apply/applySuccess.jsp&menu_one=8&menu_two=9&type=2");
%>