<%@page import="data.dao.AdminApplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String path = request.getContextPath();
	
	// dao 선언
	AdminApplyDAO dao = new AdminApplyDAO();
	
	// 본인인증 체크 후 맞을 경우 삭제, 틀릴 경우 경고 후 이전페이지로 가기
	boolean b = dao.isPassEqual(id, pass);
	
	if(b) {
		dao.deleteMember(id); %>
		<script type="text/javascript">
			location.href="../index.jsp?go=admin/adminAllList.jsp?&menu_one=13&menu_two=30";
		</script>
	<% } else { %>
		<script type="text/javascript">
			alert("본인인증 답변이 올바르지 않습니다.");
			history.back();
		</script>
<%	}  %>