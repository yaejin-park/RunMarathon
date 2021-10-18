<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="data.dto.AdminApplyDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	String checkid = request.getParameter("checkid");
	String delivernum = request.getParameter("delivernum");
	
	// 데이터 읽어서 dto에 넣기
	AdminApplyDTO dto = new AdminApplyDTO();
	dto.setCheckid(checkid);
	dto.setDelivernum(delivernum);
	
	AdminApplyDAO dao = new AdminApplyDAO();
	dao.delivery(dto);
	
	// 목록으로 이동
	response.sendRedirect("../index.jsp?go=admin/adminSelectListDelivery.jsp");
%>



