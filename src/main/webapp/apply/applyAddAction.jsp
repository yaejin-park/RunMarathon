<%@page import="data.dao.ApplyDAO"%>
<%@page import="data.dto.ApplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	ApplyDAO dao = new ApplyDAO();
	ApplyDTO dto = new ApplyDTO();
	
	//마라톤
	String marathon = request.getParameter("marathon");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
	String addr = request.getParameter("addr1")+" "+request.getParameter("addr2");
	String course = request.getParameter("course");
	String person = request.getParameter("person");
	String time = request.getParameter("time");
	
	dto.setMarathon(marathon);
	dto.setId(id);
	dto.setName(name);
	dto.setHp(hp);
	dto.setAddr(addr);
	dto.setCourse(course);
	dto.setPerson(person);
	dto.setTime(time);
	
	
	dao.insertApply(dto);
%>