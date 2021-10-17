<%@page import="data.dao.ReviewDAO"%>
<%@page import="data.dto.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글 엔코딩
	request.setCharacterEncoding("utf-8");

	//데이타 읽어서 dto 에 넣기
	ReviewDTO dto=new ReviewDTO();
	String nickname=request.getParameter("nickname");
	String photo=request.getParameter("photo");
	String content=request.getParameter("content");
	
	dto.setNickname(nickname);
	dto.setPhoto(photo);
	dto.setContent(content);
	
	//dao 선언후 insert 메서드 호출
	ReviewDAO dao=new ReviewDAO();
	dao.insertReview(dto);
	
	String path="../index.jsp?go=reiview/successReview.jsp";
	response.sendRedirect(path);
%>
