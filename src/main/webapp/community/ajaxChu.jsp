<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.SmartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//idx읽기
	String idx=request.getParameter("idx");
	//dao선언
	SmartDAO dao=new SmartDAO();
	dao.updateChu(idx);
	//System.out.println(idx);
	
	JSONObject ob=new JSONObject();
	int chu_count=dao.getData(idx).getChu_count();
	ob.put("chu_count", chu_count);
%>
<%=ob.toString()%>