<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// id 읽기
	String id = request.getParameter("id");

	// dao 선언
	AdminApplyDAO db = new AdminApplyDAO();
	
	// id에 해당하는 marathon 얻기
	String marathon = db.getMarathon(id).toString();
	
	// dto를 json으로 변환
	JSONObject ob = new JSONObject();
	
	// json에 데이터 추가하기
	ob.put("marathon",marathon);
%>
<%=ob.toString()%>