<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.ContestDTO"%>
<%@page import="data.dao.ContestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contestName = request.getParameter("contestName");
	ContestDAO dao = new ContestDAO();
	ContestDTO dto = dao.getList(contestName);
	
	JSONObject ob = new JSONObject();
	ob.put("name", dto.getName());
	ob.put("content", dto.getContent());
	ob.put("contestDate", dto.getContest_start() + "~" + dto.getContest_end());
	ob.put("applyDate", dto.getApply_start() + "~" + dto.getApply_end());
	ob.put("money", dto.getMoney());
%>
<%= ob.toString() %>