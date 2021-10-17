<%@page import="data.dto.SmartDTO"%>
<%@page import="data.dao.SmartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");
	//데이터읽어서 dto에 넣기
	SmartDTO dto=new SmartDTO();
	dto.setNickname(request.getParameter("nickname"));
	dto.setSubject(request.getParameter("subject"));
	dto.setContent(request.getParameter("content"));
	
	//db insert
	SmartDAO dao=new SmartDAO();
	dao.insertSmart(dto);
	
	//일단 목록으로 간다음 나중에 detail 페이지로 가는거로 수정
	/* String path="../index.jsp?main=board/boardlist.jsp";
	response.sendRedirect(path); */
	
	//방금전에 추가된 num값 얻기
	String idx=dao.getMaxNum();
	String path="../index.jsp?go=community/communityList.jsp&menu_one=11&menu_two=27?idx="+idx;
	response.sendRedirect(path);
%>