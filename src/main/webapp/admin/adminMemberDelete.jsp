<%@page import="data.dao.AdminApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	AdminApplyDAO dao = new AdminApplyDAO();

	String delid = request.getParameter("delid");
	
	dao.deleteMember(delid);
	//response.sendRedirect("../index.jsp?go=admin/adminAllList.jsp");
%>
<script type="text/javascript">
	location.href = "./index.jsp?go=admin/adminAllList.jsp?&menu_one=13&menu_two=30";
</script>

