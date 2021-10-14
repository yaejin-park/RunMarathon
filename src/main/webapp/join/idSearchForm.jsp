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
		margin: 30px;
	}
</style>

<script type="text/javascript">
$(function(){
	//중복체크 확인 버튼
	$("#checkId").click(function() {
		var id = $("#id").val();
		console.log("id:"+id);
		
	  	var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사

		if(id==""){
			$("#idResult").html("아이디를 입력해주세요"); 
			$("#id").focus();
		} else if(!idRegExp.test(id)) {
	            alert("영문 대소문자와 숫자 4~12자리로 입력해주세요");
	            $("#id").val("");
	            $("#id").focus();
		} else{
			$.ajax({
				type:"post",
				dataType: "json",
				url:"idSearchAction.jsp",
				data:{"id":id},
				success:function(data) {
					var s="";
					console.log("name:"+data.name);
					if(data.name!=null){/* 존재하면 */
						s+= '입력하신 아이디 <span style="font-weight: bold; color: #9D9DFA;">'+data.id+'</span>는 중복된 아이디 입니다.<br>';
						s+= '다시 입력해주시기 바랍니다.';
					} else{
						s+= '입력하신 아이디 <span style="font-weight: bold; color: #9D9DFA;">'+data.id+'</span>는 사용가능합니다.<br>';
						s+= '이 아이디를 사용하시겠습니까?<br>';
						s+= '<button type="button" id="idUse" myid='+data.id+' class="btn btn-info" style="margin: 10px; width: 100px; height: 40px; font-size: 1em;">사용하기</button>';
					}
					$("#idResult").html(s); 
				}
			});
		}
	});
	
	//아이디 사용 버튼
	$(document).on("click","#idUse", function() {
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
<form action="idSearchAction.jsp" method="post" class="form-inline">
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