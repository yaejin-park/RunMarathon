<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDAO dao = new MemberDAO();
	
	String id = (String)session.getAttribute("sessionId");
	String pass = request.getParameter("pass");
	
	boolean flag = dao.findPass(id, pass);
	
	//회원정보가 맞으면
	if(flag){
		dao.deletetMember(id);
		response.sendRedirect("../index.jsp?go=myPage/deleteSuccess.jsp");
		session.removeAttribute("sessionId");
		session.removeAttribute("sessionLogin");
		session.removeAttribute("sessionSave");
	
	} else{%>
		<script type="text/javascript">
			alert("회원정보와 일치하지 않은 비밀번호입니다");
			history.back();
		</script>
	<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴완료</title>
</head>
<body>
<div style="margin: 0 auto; width: 100%;">
	<b>회원탈퇴가 완료되었습니다.</b>
	<br><br>
	<button type="button" class="btn btn-info" onclick="location.href='index.jsp'">메인페이지</button>
</div>
</body>
</html>
