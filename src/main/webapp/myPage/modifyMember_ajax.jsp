<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberDAO dao = new MemberDAO();
	
	String id = (String)session.getAttribute("sessionId");

	String nick = request.getParameter("nick");
	
	String hp1 = request.getParameter("hp1");
	String hp2 = request.getParameter("hp2");
	String hp3 = request.getParameter("hp3");
	
	String hp = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String auth1 = request.getParameter("selAuth");
	String auth2 = request.getParameter("auth");

	dao.modifyMember(id, nick, hp, addr1, addr2, auth1, auth2);
%>
<%=nick %>
