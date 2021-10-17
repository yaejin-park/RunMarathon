<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("sessionId");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getAllMember(id);
	
	JSONObject ob = new JSONObject();
	
	String hp = dto.getHp();
	
	String[] hpSplit = hp.split("-");
	String hp1 = hpSplit[0];
	String hp2 = hpSplit[1];
	String hp3 = hpSplit[2];
	
	ob.put("name",dto.getName());
	ob.put("nick",dto.getNick());
	ob.put("hp1",hp1);
	ob.put("hp2",hp2);
	ob.put("hp3",hp3);
	ob.put("addr1",dto.getAddr1());
	ob.put("addr2",dto.getAddr2()); 
	ob.put("auth1",dto.getAuth1()); 
	ob.put("auth2",dto.getAuth2()); 
	ob.put("opt",dto.getOpt()); 
%>
<%= ob.toString()%>