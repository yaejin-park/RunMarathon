<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dao.SmartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num읽기
	String idx=request.getParameter("idx");
	//dao선언
	SmartDAO dao=new SmartDAO();
	//num에 해당하는 chu 1증가
	dao.updateChu(idx);
	//증가된 chu 값 json 형식으로 반환
	int chu=dao.getData(idx).getChu_count();
	JSONObject ob=new JSONObject();
	ob.put("chu", chu);
%>
<%=ob.toString()%>