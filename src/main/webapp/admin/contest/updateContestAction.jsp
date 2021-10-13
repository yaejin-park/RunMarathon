<%@page import="data.dao.ContestDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.ContestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>

<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	String contest_start = request.getParameter("contest_start");
	String contest_end = request.getParameter("contest_end");
	String apply_start = request.getParameter("apply_start");
	String apply_end = request.getParameter("apply_end"); 
	String money = request.getParameter("money");

	String gift_check = request.getParameter("gift_check");
	if(request.getParameter("gift_check") == null) {
		gift_check = "0";	
	}else{
		gift_check = "1";
	}
	String gift_start = request.getParameter("gift_start");
	if(request.getParameter("gift_start") == "") {
		gift_start = "2000-01-01";
	} 
	
	String gift_end = request.getParameter("gift_end");
	if(request.getParameter("gift_end") == "") {
		gift_end = "2000-01-01";
	}
	
	ContestDTO dto = new ContestDTO();
	dto.setName(name.trim());
	dto.setContent(content);
	dto.setContest_start(contest_start.trim());
	dto.setContest_end(contest_end.trim());
	dto.setApply_start(apply_start.trim());
	dto.setApply_end(apply_end.trim());
	dto.setGift_check(gift_check.trim());
	dto.setGift_start(gift_start.trim());
	dto.setGift_end(gift_end.trim());
	dto.setMoney(money.trim());
	
	ContestDAO dao = new ContestDAO();
	dao.updateContest(dto);
	
	String encText = URLEncoder.encode(name, "UTF-8") ;

	if(gift_check.equals("0")){
		response.sendRedirect("../../index.jsp?go=admin/contest/contestList.jsp&menu_one=13&menu_two=20");
	}else{
		response.sendRedirect("../../index.jsp?go=admin/contest/updateGift.jsp&menu_one=13&menu_two=20&name="+ encText);
	}
%>