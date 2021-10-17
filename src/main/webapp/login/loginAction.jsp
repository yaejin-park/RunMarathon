<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String idSave = request.getParameter("idSave");
		
	MemberDAO dao = new MemberDAO();
	boolean flag = dao.isMember(id, pass);

	//아이디,비번이 맞다면
	if(flag){
		//세션 유지 기간 4시간
		session.setMaxInactiveInterval(60*60*4);
		//세션에 저장
		session.setAttribute("sessionId", id);
		session.setAttribute("sessionLogin", "yes");
		session.setAttribute("sessionSave", idSave == null?null:"yes");
		//로그인 메인으로 이동
		response.sendRedirect("../index.jsp?go=login/loginMain.jsp&menu_one=21");
	} else{
	%>
		<script type="text/javascript">
			alert("아이디 혹은 비번이 일치하지 않습니다");
			history.back();
		</script>
	<%
	}
%>