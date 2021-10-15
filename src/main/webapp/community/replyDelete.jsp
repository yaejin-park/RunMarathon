<%@page import="data.dao.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idx=request.getParameter("idx");
	ReplyDAO dao=new ReplyDAO();
	dao.deleteReply(idx);
%>