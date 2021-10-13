<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	MemberDTO dto = new MemberDTO();

	String name = request.getParameter("name");
	String nick = request.getParameter("nick");
	String hp = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String id = request.getParameter("id");
	String pass = request.getParameter("pass1");
	String addr = request.getParameter("addr1")+" "+request.getParameter("addr2");
	String auth1 = request.getParameter("selAuth");
	String auth2 = request.getParameter("auth");
	String opt = request.getParameter("opt");
	
	dto.setName(name);
	dto.setNick(nick);
	dto.setHp(hp);
	dto.setId(id);
	dto.setPass(pass);
	dto.setAddr(addr);
	dto.setAuth1(auth1);
	dto.setAuth2(auth2);
	dto.setOpt(opt);
	
	MemberDAO dao = new MemberDAO();
	dao.insertMember(dto);
	response.sendRedirect("../index.jsp?go=join/joinSuccess.jsp?id="+id);
%>