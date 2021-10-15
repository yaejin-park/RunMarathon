<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String nick = request.getParameter("nick");
	
	MemberDAO dao = new MemberDAO();
	
	String isNick = dao.getNick(nick);
	
	JSONObject ob = new JSONObject();
	
	ob.put("isNick",isNick);
	ob.put("nick",nick);
%>

<%= ob.toString()%>