<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="data.dto.ContestDTO"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ContestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ContestDAO contestDao = new ContestDAO();
	List<ContestDTO> contestList = contestDao.getAllList();
	
	JSONArray arr = new JSONArray();
	for(ContestDTO dto:contestList){
		JSONObject ob = new JSONObject();
		ob.put("contestTitle", dto.getName() + " 대회기간");
		ob.put("contestStart", dto.getContest_start());
		ob.put("contestEnd", dto.getContest_end());
		arr.add(ob);
	}
	
	for(ContestDTO dto:contestList){
		JSONObject ob = new JSONObject();
		ob.put("contestTitle", dto.getName() + " 신청기간");
		ob.put("applyStart", dto.getApply_start());
		ob.put("applyEnd", dto.getApply_end());
		arr.add(ob);
	}
	
	for(ContestDTO dto:contestList){
		JSONObject ob = new JSONObject();
		ob.put("contestTitle", dto.getName() + " 기념품 배송기간");
		ob.put("giftStart", dto.getGift_start());
		ob.put("giftEnd", dto.getGift_end());
		arr.add(ob);
	}
%>

<%= arr.toString() %>