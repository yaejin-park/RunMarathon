<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복체크</title>
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
	$("#checkNick").click(function() {
		var nick = $("#nick").val();
		
	  	var nickRegExp = /^[가-힣ㄱ-ㅎa-zA-z0-9]{2,10}$/; //아이디 유효성 검사

		if(nick==""){
			$("#nickResult").html("닉네임을 입력해주세요"); 
			$("#nick").focus();
		} else if(!nickRegExp.test(nick)) {
	            alert("영문 대소문자,한글,숫자 2~10자리로 입력해주세요");
	            $("#nick").val("");
	            $("#nick").focus();
		} else{
			$.ajax({
				type:"post",
				dataType: "json",
				url:"nickSearchAction.jsp",
				data:{"nick":nick},
				success:function(data) {
					var s="";
					console.log("검색한 nick:"+data.nick);
					console.log("찾은 nick:"+data.isNick);
					if(data.isNick!=null){/* 존재하면 */
						s+= '입력하신 닉네임 <span style="font-weight: bold; color: #9D9DFA;">'+data.nick+'</span>는 중복된 닉네임 입니다.<br>';
						s+= '다시 입력해주시기 바랍니다.';
					} else{
						s+= '입력하신 닉네임 <span style="font-weight: bold; color: #9D9DFA;">'+data.nick+'</span>는 사용가능합니다.<br>';
						s+= '이 닉네임을 사용하시겠습니까?<br>';
						s+= '<button type="button" id="nickUse" myNick='+data.nick+' class="btn btn-info" style="margin: 10px; width: 100px; height: 40px; font-size: 1em;">사용하기</button>';
					}
					$("#nickResult").html(s); 
				}
			});
		}
	});
	
	//닉네임 사용 버튼
	$(document).on("click","#nickUse", function() {
		var nick = $(this).attr("myNick");
		opener.joinfrm.nick.value = nick;
		window.close();
	});
});
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
<form action="nickSearchAction.jsp" method="post" class="form-inline">
<table class="table" style="width: 500px; text-align: center;">
	<thead>
		<tr>
			<th colspan="3" style="text-align: center; font-size: 1.3em; font-weight: bold; padding-bottom: 50px;">중복닉네임 체크</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<th>닉네임</th>
			<td><input type="text" class="form-control" name="nick" id="nick" required="required" autofocus="autofocus" maxlength="8"></td>
			<td><button type="button" class="btn btn-info" id="checkNick" value="<%=request.getParameter("nick")%>">확인</button>
		</tr>
		<tr>
			<td colspan="3" style="padding: 50px;" id="nickResult">
			</td>		
		</tr>
	</tbody>
</table>
</form>
</body>
</html>