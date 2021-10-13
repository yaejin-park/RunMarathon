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
		margin: 10px;
	}
</style>
<script type="text/javascript">
$(function(){
	//중복체크 확인 버튼
	$("#checkId").click(function() {
		var id = $("#id").val();
		
		$.ajax({
			type:"post",
			dataType: "json",
			url:"idSearchAction.jsp",
			data:{"id":id},
			success:function(data) {
				var s="";
				console.log("hi");
			}
			$("#idResult").html(s);
		});
	});
	
	$("#idUse").click(function() {
		var id = $(this).attr("myid");
		opener.joinfrm.id.value = id;
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
			<td colspan="3" style="padding: 50px;" id="idResult">
			</td>		
		</tr>
	</tbody>
</table>
</form>
</body>
</html>