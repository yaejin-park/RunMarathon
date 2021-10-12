<%@page import="data.dto.ReplyDTO"%>
<%@page import="data.dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//엔코딩
	request.setCharacterEncoding("utf-8");
	//데이터 읽어서 dto에 넣기
	ReplyDTO dto=new ReplyDTO();
	dto.setNum(request.getParameter("idx"));
	dto.setNickname(request.getParameter("nickname"));
	dto.setContent(request.getParameter("content"));
	
	//db에 저장
	ReplyDAO dao=new ReplyDAO();
	dao.insertReply(dto);
	
	//페이지 번호읽기
	String currentPage=request.getParameter("currentPage");
	//다시 목록 보던 페이지로 이동
	String path="../community/communityList.jsp?currentPage="+currentPage;
	response.sendRedirect(path);
	

%>