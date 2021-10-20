<%@page import="java.text.DecimalFormat"%>
<%@page import="data.dto.ApplyDTO"%>
<%@page import="data.dao.ApplyDAO"%>
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
		top:66;
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
		float: right;
		background-color:#eeeeee; 
		width: 630px;
		padding: 3px 10px;
		margin: 0 30px 30px;
		border-radius: 10px;
		height: 210px;
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
	#memberStatus > div{
		position:relative;
		float: left;
		width: 170px;
		margin: 50px 0 0 25px;
		font-size: 1.3em;
		font-weight: bold;
		text-align: center;
	}
		
	.circle {	
		width: 170px;
		height: 170px;
		margin-bottom:20px;
		border-radius: 100%;
		background-color: #999999;
	}
	
	.status-img1{
	    width: 105px;
	    margin: 30px 30px 10px 21px;
	}
	.status-img2{
		width: 140px;
		margin: 20px 30px 0px 10px;
	}
	.status-img3{
		width: 125px;
		margin: 20px 30px 0px 25px
	}
	
	#memberRecord, #memberStatus {
		text-align: center;
	}
	
	.now-status{
		background-color: #d4e093;
	}
	
	#tbh {
		font-size: 15pt;
	}
	
	#tbf {
		font-size: 50pt;
		font-weight: bold;
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
		$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000); 
	});
});

</script>
<%
	String id = (String)session.getAttribute("sessionId");

	MemberDAO dao = new MemberDAO();
	String nick = dao.getIdNick(id);

	ApplyDAO adao = new ApplyDAO();
	//신청상태 (apply, delivery, record)
	String status = adao.applyStatus(id);
	ApplyDTO adto = adao.getApply(id);

	
	//신청여부
	boolean applyYes = adao.isDoubleApply(id);
	
	String km = null;
	
	double pace = 0;
	int intPace = 0;
	String paceForm = null;
	double paceMinute = 0;
	String paceMinuteForm = null;
	double paceSecond = 0;
	String paceSecondForm = null;
	
	String record = null;
	int intRecord = 0;
	double doubleRecord = 0;
	String recordForm = null;
	double recordHour = 0;
	String racordHourForm = null;
	double recordMinute = 0;
	String recordMinuteForm = null;
	
	
	if(status.equals("apply")){
		%>
		<script type="text/javascript">
			$(function() {
				$("#apply").addClass("now-status");
			});
		</script>
		<%
	} else if(status.equals("delivery")){
		%>
		<script type="text/javascript">
			$(function() {
				$("#delivery").addClass("now-status");
			});
		</script>
		<%
	} else if(status.equals("record")){
		km = adto.getCourse().substring(0, adto.getCourse().length()-1);
		
		record = adto.getRecord();
		doubleRecord = Double.parseDouble(record);
		intRecord = (int)doubleRecord;
		recordHour = Math.floor(doubleRecord);
		racordHourForm = String.format("%.0f",recordHour);
		recordMinute = (doubleRecord - intRecord)*60;
		recordMinuteForm = String.format("%.0f",recordMinute);
		recordForm = racordHourForm + ":" + recordMinuteForm;
		
		pace = (Double.parseDouble(record)*60)/Double.parseDouble(km);
		//Double paceCalc = Double.parseDouble(km)/Double.parseDouble(record);
		//pace= paceCalc.toString(); 
		intPace = (int)pace;
		paceMinute = Math.floor(pace);
		paceMinuteForm = String.format("%.0f",paceMinute);
		paceSecond = (pace - intPace)*60;
		paceSecondForm = String.format("%.0f",paceSecond);
		paceForm = paceMinuteForm + ":" + paceMinuteForm;
	
		%>
		<script type="text/javascript">
		$(function() {
			$("#record").addClass("now-status");
		});
		</script>
		<%
	}
%>


</head>
<body>
<div class="mypage-area">
	<p class="title">My Page</p>
	<div id="sidebox">
		<table style="text-align: center;">
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
	
	<%if(!applyYes){%>
	<div id="memberStatus">
		<span class="glyphicon glyphicon-exclamation-sign" style="font-size: 4em; margin: 90px 235px 40px;"></span>
		<br>
		<span style="font-weight: bold; font-size: 1.2em;">신청내역이 존재하지 않습니다.</span>
	</div>
	<% } else{%>
	<div id="memberStatus">
		<div>
			<div class="circle" id="apply">
			<img src="./common/image/mypage_apply.png" class="status-img1"></div>
			<p class="txt">신청</p>
		</div>
		<div>
			<div class="circle" id="delivery">
			<img src="./common/image/mypage_shipping.png" class="status-img2"></div>
			<p class="txt">배송</p>
		</div>
		<div>
			<div class="circle" id="record">
			<img src="./common/image/mypage_record.png" class="status-img3"></div>
			<p class="txt">기록</p>
		</div>
	</div>
	<%}
	if(!status.equals("record")){
	%>
	<div id="memberRecord">
		<span class="glyphicon glyphicon-exclamation-sign" style="font-size: 4em; margin: 30px 235px 40px;"></span>
		<br>
		<span style="font-weight: bold; font-size: 1.2em;">마라톤 기록이 존재하지 않습니다.</span>
	</div>
	<% }else{%>
	<div id="memberRecord">
		<table class="table no-border">
			<thead>
				<tr id="tbh"><th><%=adto.getMarathon()%></th><th><%=adto.getTime()%></th></tr>
			</thead>
			<tbody>
				<tr id="tbf">
					<td><%=km%></td><td><%=paceForm%></td><td><%=recordForm%></td>
				</tr>			
				<tr class="point">
					<td>완주거리(Km)</td><td>평균페이스(m/Km)</td><td>완주시간(m)</td>
				</tr>
			</tbody>
		</table>
	</div>
	<%}%>
</div>

</body>
</html>