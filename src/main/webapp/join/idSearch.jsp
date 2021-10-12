<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../common/css/common.css">
<script type="text/javascript" src="../common/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
	table {
		margin: 50px;
	}
</style>
<script type="text/javascript">
$(function(){
	boolean checkClick = false;
	//중복체크 확인 버튼
	$("#checkId").click(function() {
		checkClick = true;
		$.ajax({
			type:"get",
			dataType: "json",
			url:"../join/idSearch.jsp",
			success: function(data) {
				var s="";
				$.each(data, function(i, elt) {
					s+="<div>";
					s+="Index:"+i+"<br>";
					s+="이름:"+elt.name+"<br>";
					s+="핸드폰"+elt.hp+"<br>";
					s+="나이"+elt.age+"세<br>";
					s+="<img src='"+elt.photo+"' width='100;'>";
					
					s+="입력하신 아이디 <span style="font-weight: bold; color: #9D9DFA;">id</span>는 중복된 아이디 입니다.
					s+="다시 입력해주시기 바랍니다."
					s+="</div>";
				});
				$("#show").html(s);
			}
		});
		
	});
	
	$("#idUse").click(function() {
		var myid = $(this).attr("myid");
		opener.joinfrm.id.value = myid;
		window.close();
	});
});
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String key = request.getParameter("key");
%>
<form action="idSearch.jsp" method="post" class="form-inline">
<input type="hidden" name="key" value="result">
<table class="table" style="width: 500px; text-align: center;">
	<thead>
		<tr>
			<th colspan="3" style="text-align: center; font-size: 1.3em; font-weight: bold; padding-bottom: 50px;">중복아이디 체크</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>아이디</th>
			<td><input type="text" class="form-control" name="id" id="id" required="required" autofocus="autofocus" maxlength="8"></td>
			<td><button type="button" class="btn btn-info" id="checkId" value="<%=request.getParameter("id")%>">확인</button>
		</tr>
		<tr>
			<td colspan="3" style="padding: 50px;">
			<% 
			if(true){
				if(true){
				%>입력하신 아이디 <span style="font-weight: bold; color: #9D9DFA;">id</span>는 중복된 아이디 입니다.
				다시 입력해주시기 바랍니다.
				<script type="text/javascript">
				$("id").focus();
				</script>
				<%
				} else{
				%>입력하신 아이디 <span style="font-weight: bold; color: #9D9DFA;">id</span>는 사용가능합니다.<br>
				이 아이디를 사용하시겠습니까?<br>
				<button type="button" id="idUse" myid=<%=request.getParameter("id")%> class="btn btn-info" style="margin: 10px; width: 100px; height: 40px; font-size: 1em;">사용하기</button>
				<%
				}
			} else{
				%>검색할 아이디를 입력해주세요.<%
			}
			%>
			</td>		
		</tr>
	</tbody>
</table>
</form>
</body>
</html>