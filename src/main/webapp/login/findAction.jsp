<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String findType = request.getParameter("find-type");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String auth1 = request.getParameter("selAuth");
	String auth2 = request.getParameter("auth");
	MemberDAO dao = new MemberDAO();
	
	String findId = null;
	String findPass = null;
	String test = null;
	
	//아이디 찾을 때,
	if(findType.equals("findId")){
		findId = dao.findId(name, hp, auth1, auth2);
		response.sendRedirect("../index.jsp?go=login/findResult.jsp&menu_one=21&menu_two=29&id="+findId);
	} else{ //비번찾을 때,
		String id = request.getParameter("id");
		
		findPass =dao.findPass(id, name, hp, auth1, auth2);
		
		response.sendRedirect("../index.jsp?go=login/findResult.jsp&menu_one=21&menu_two=29&pass="+findPass);
	}
	
	
%>
