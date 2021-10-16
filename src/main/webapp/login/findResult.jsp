<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	String type = request.getParameter("find-type");
	String id= request.getParameter("id");
	String pass= request.getParameter("pass");
%>
<script type="text/javascript">
$(function() {
	$("#findPass").click(function() {
		alert($(this).val());
		location.href = "./index.jsp?go=login/findMain.jsp&menu_one=21?findPass="+$(this).val();
	});
	
	var s="";
	var b="";
	
	$(document).on("click","#joinBtn",function() {
		location.href='./index.jsp?go=join/joinForm.jsp&menu_one=24';
	});
	$(document).on("click","#findId",function() {
		history.back();
		//location.href='./index.jsp?go=login/findMain.jsp&menu_one=21';
	});
	
	<%
	if(type.equals("findId")){
		if(id.equals("null")){
	%>
			s+="해당하는 회원정보가<br>";
			s+="존재하지 않습니다.";
			$("#findResult").html(s);
			
			b+='<button type="button" id="joinBtn" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">회원가입</button>';
			b+='<button type="button" id="findId" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">아이디/비번 찾기</button>';
			$("#findBtn").html(b);
		<%
		}else if(!id.equals("null")){
		%>
			s+='찾으시는 아이디는 <br>';
			s+='<span style="font-weight: bold; color: #659EFF"><%=id %></span>입니다.';
			$("#findResult").html(s);
			
			b+='<button type="submit" id="login" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">로그인</button>';
			b+='<button type="button" id="findId" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">아이디/비밀번호 찾기</button>';
			$("#findBtn").html(b);
		<%}
	} else{
		if(!pass.equals("null")){%>
			s+='찾으시는 비밀번호는 <br>';
			s+='<span style="font-weight: bold; color: #659EFF"><%=pass %></span>입니다.';
			$("#findResult").html(s);
			
			b+='<button type="submit" id="login" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">로그인</button>';
			b+='<button type="button" id="findId" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid" value="yes">아이디/비밀번호 찾기</button>';
			$("#findBtn").html(b);
		<%}else{%>
			s+="해당하는 회원정보가<br>";
			s+="존재하지 않습니다.";
			$("#findResult").html(s);
			
			b+='<button type="button" id="joinBtn" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">회원가입</button>';
			b+='<button type="button" id="findId" class="btn btn-default" style="width: 412px; height: 45px; margin: 10px; border: 2px grey solid">아이디/비번 찾기</button>';
			$("#findBtn").html(b);
		<%}
	}%>
	
	
});
</script>
</head>

<body>
<form action="index.jsp?go=login/loginForm.jsp&menu_one=21&find-type=<%=type%>&find-id=<%=id %>" method="post" class="form-inline">
<input type="hidden" id="findId" name="find-id" value="<%=id%>">
<table class="table" style="width: 600px; padding: 30px; margin: 30px;">
<tbody>
	<tr style="padding: 30px; text-align: center;">
		<td colspan="2" style="font-size: 1.3em; padding: 30px;" id="findResult"></td>
	</tr>
	
	<tr>
		<td colspan="2" style="text-align: center;" id="findBtn"></td>
	</tr>
</tbody>
</table>
</form>
>>>>>>> branch 'dev' of https://github.com/jeejee1106/SemiProject5.git
</body>
</html>