<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="data.dto.AdminApplyDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 한글 인코딩
	request.setCharacterEncoding("utf-8");

	String dnum = request.getParameter("dnum");
	String deliverid = request.getParameter("deliverid");
	//System.out.println(dnum+deliverid);

	
 	// 데이터 읽어서 dto에 넣기
	AdminApplyDTO dto = new AdminApplyDTO();
	dto.setDelivernum(dnum);
	dto.setCheckid(deliverid);
	
	AdminApplyDAO dao = new AdminApplyDAO();
	dao.delivery(dto);
%>
<script type="text/javascript">
	history.go(-2);
</script>




