<%@page import="data.dto.AdminApplyDTO"%>
<%@page import="data.dao.AdminApplyDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8"); //받아올 데이터의 인코딩
	
	// 데이터 읽어서 dto에 넣기
	AdminApplyDTO dto = new AdminApplyDTO();
	
	String rid = request.getParameter("id");
	String rrecord = request.getParameter("record");
	
	
	/* dto.setRidx(ridx);
	dto.setRid(rid);
	dto.setRrecord(rrecord);
	
	AdminApplyDAO dao = new AdminApplyDAO();
	dao.updateRecord(dto);
	System.out.println(ridx); */
	
	/* response.setContentType("application/json");
	JSONObject json = new JSONObject();
	json.put("code", "0001");
	response.getWriter().write(json.toString()); 
	*/
	
	// 목록으로 이동
	//response.sendRedirect("../index.jsp?go=admin/adminSelectListOne.jsp?&menu_one=13&menu_two=30");
%>

<!-- <script type="text/javascript">
	history.back();
	/* location.href="../index.jsp?go=admin/adminSelectListOne.jsp?&menu_one=13&menu_two=30"; */
	
	/* http://localhost:8080/SemiProject5/admin/adminSelectListOne.jsp?tname= */
</script> -->



