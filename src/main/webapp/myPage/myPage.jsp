<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#sidebox { 
		position:absolute; 
		top:0;
		left:0;
		background-color:#eeeeee; 
		width: 210px;
		padding: 3px 10px;
		border-radius: 10px;
		height: 315px;
	}
	
	#memberStatus{
		float:right;
		background-color:#eeeeee; 
		width: 630px;
		padding: 3px 10px;
		margin: 0 30px 30px;
		border-radius: 10px;
		height: 315px;
	}
	
	#memberRecord{
		float:right;
		background-color:#eeeeee; 
		width: 630px;
		padding: 3px 10px;
		margin: 0 30px 30px;
		border-radius: 10px;
		height: 315px;
	}
	
	tr.space {
 		 border-bottom: 5px solid #eeeeee;
	}
	
	.mypage-area {
		position:relative;
	}
	.mypage-area:after {
		content:"";
		display:block;
		clear:both;
	}
	
	.circle{
		background-color: black;
	}
	
</style>
<script type="text/javascript">

$(function() {
	var currentPosition = parseInt($("#sidebox").css("top"));
	$(window).scroll(function() { 
		var position = $(window).scrollTop(); 
		if(position>341){
			position = 341;
		}
		console.log("p  :  "+ position);
		console.log("c  :  "+ currentPosition);
		$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000); 
	});
});

</script>
<%
	String id = (String)session.getAttribute("sessionId");
	MemberDAO dao = new MemberDAO();
	String nick = dao.getIdNick(id);
%>
</head>
<body>
<div class="mypage-area">
	<div id="sidebox">
		<table style="text-align: center; box">
			<tbody>
				<tr>
					<td>
						<img alt="profile-img" src="./se2/img/mypage_profile.png" width="120px;" align="middle" style="padding: 25px 0px 20px;">
					</td>
				</tr>
				<tr >
					<td style="padding-bottom: 20px; font-size: 1.2em;"><b><%=nick%>님,</b></td>
				</tr>
				<tr class="space">
					<td><a href="./index.jsp?go=myPage/memberModify.jsp&menu_one=32">정보수정</a></td>
				</tr>	
				<tr class="space">
					<td><a href="./index.jsp?go=myPage/memberDelete.jsp&menu_one=32">회원탈퇴</a></td>
				</tr>	
			</tbody>
		</table>
	</div>
	<div id="memberStatus">
		<div class="circle">
		
		</div>
	</div>
	
	<span>최근 나의 기록</span>
	<div id="memberRecord">
	
	</div>
</div>

</body>
</html>