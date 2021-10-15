<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	
	MemberDAO dao = new MemberDAO();
	
	String name = dao.getName(id);
	
	JSONObject ob = new JSONObject();
	
	ob.put("name",name);
	ob.put("id",id);
%>

<%= ob.toString()%>