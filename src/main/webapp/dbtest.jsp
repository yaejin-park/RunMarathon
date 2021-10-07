<%@page import="java.util.Vector"%>
<%@page import="data.dto.AnswerDto"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.AnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%
   AnswerDao dao = new AnswerDao();

   List<AnswerDto> list = new Vector<AnswerDto>();

   list = dao.getAllAnswer("2");
   String name = "초기";
   for (AnswerDto dto : list) {
      name = dto.getMyid();
   }
   %>
   <br>
   <span>1.<%=2%></span>
   <br>
   <span>2. <%=name%></span>
</body>
</html>