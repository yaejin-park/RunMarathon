<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var calendarEl = $('#calendar')[0];
		var calendar = new FullCalendar.Calendar(calendarEl, {
			height: 'auto',
			expandRows: true,
			headerToolbar: {
				left: 'prev',
				center: 'title',
				right: 'next'
			},
			initialView: 'dayGridMonth',
			navLinks: false,
			editable: true,
			selectable: false,
			dayMaxEvents: true,
			locale: 'ko',
			events : function(info, successCallback, failureCallback){
				$.ajax({
					url:'./info/calendarData.jsp',
					dataType:'json',
					success : function(data){
						console.log("성공이다");
						var events = [];
						
						$.each(data, function(i, elt) {
							/* console.log(elt.contestTitle);
							console.log(elt.contestStart);
							console.log(elt.contestEnd); */

							var title = elt.contestTitle;
							var contestStartDate = elt.contestStart;
							var contestEndDate = elt.contestEnd;
							var applyStartDate = elt.applyStart;
							var applyEndDate = elt.applyEnd;
							var giftStartDate = elt.giftStart;
							var giftEndDate = elt.giftEnd;
							if(title.indexOf("대회기간") != -1){
								//console.log(title + "포함되어있다");
								events.push({
									title:title, 
									start:contestStartDate, 
									end:contestEndDate,
									className : "contest-day event-btn",
									backgroundColor: "rgb(64, 142, 185, 0.7)"
								});								
							}else if(title.indexOf("신청기간") != -1){
								//console.log(title + "포함되어있다");
								events.push({
									title:title, 
									start:applyStartDate, 
									end:applyEndDate,
									className : "apply-day event-btn",
									backgroundColor: "rgb(190, 3, 192, 0.7)"
								});								
							}else if(title.indexOf("기념품 배송기간") != -1){
								//console.log(title + "포함되어있다");
								events.push({
									title:title, 
									start:giftStartDate, 
									end:giftEndDate,
									className : "gift-day event-btn",
									backgroundColor: "rgb(255, 192, 0, 0.7)"
								});								
							}
							
						});
						//console.log(events);
						successCallback(events);
					}
				});
			},
			googleCalendarApiKey : "AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE",
			eventSources : [
				{
					googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
					className : "koHolidays",
					color: "#ffffff",
					textColor : "red",
					editable : false
				}
			],
		});
		// 캘린더 랜더링
		calendar.render();
		
		$(document).on("click", ".fc-daygrid-event.koHolidays" , function(e){
			e.preventDefault();
		});
		
		$(document).on("click", ".fc-daygrid-event.event-btn" , function(){
			var contestName = $(this).find(".fc-event-title.fc-sticky").text();
			
			if(contestName.indexOf("대회기간") != -1){
				contestName = contestName.replace(" 대회기간","");
			}else if(contestName.indexOf("신청기간") != -1){
				contestName = contestName.replace(" 신청기간","");
			}else if(contestName.indexOf("기념품 배송기간") != -1){
				contestName = contestName.replace(" 기념품 배송기간","");
			}
			
			$.ajax({
				type:"get",
				url:'./info/contestData.jsp',
				dataType:'json',
				data:{contestName:contestName.trim()},
				success : function(data){
					var name = data.name;
					var content = data.content;
					var contestDate = data.contestDate;
					var applyDate = data.applyDate;
					var money = data.money;
					
					$("#contestModel").find(".title-div .txt1").text(name);
					$("#contestModel").find(".title-div .txt2").text(content);
					$("#contestModel").find(".table .apply-date").text(applyDate);
					$("#contestModel").find(".table .contest-date").text(contestDate + " 오전 10시");
					$("#contestModel").find(".table .money").text(money + "원");
				}
			});
			$("#contestModel").modal();
		});
	});
</script>
<style>
	.fc-h-event {
		border:none !important;
	}
	.fc .fc-daygrid-event-harness-abs {
		text-align:center;
	}
    .fc-daygrid-day.fc-day-sat .fc-daygrid-day-number {
    	color:#0000FF;
    }
    .fc-daygrid-day.fc-day-sun .fc-daygrid-day-number {
    	color:#FF0000;
    }
    .modal .modal-dialog {
    	width:850px;
    }
    .modal .title-div {
    	margin-bottom:30px;
    }
    .modal .title-div .txt1 {
    	width:330px;
    	font-size:30px;
    	font-weight:bold;
    	color:#000;
    	line-height:1.2;
    }
    .modal .title-div .txt2 {
    	margin-top:15px;
    	font-size:16px;
    	color:#999;
    	line-height:1.2;
    }
    .info-div:after {
    	content:"";
    	display:block;
    	clear:both;
    }
    .info-div .img-div {
    	position:relative;
    	float:left;
    	width:400px;
    	padding:40px 0 0 40px;
    }
    .info-div .img-div:before {
    	content:"";
    	position:absolute;
    	top:0;
    	left:0;
    	display:block;
    	width:340px;
    	height:410px;
    	border-width:15px;
    	border-style:solid;
    	border-image:linear-gradient(to right,  #408eb9 0%,#6a1c52 100%);
    	border-image-slice:1; 
    }
    .info-div .img-div img {
    	width:340px;
    }
    .info-div .table-div {
    	float:right;
    	width:400px;
    	/* margin-top:40px; */
    }
    .info-div .table-div .btn-wrap {
    	text-align:center;
    }
</style>
<div class="calendar-area">
	<p class="title">일정 안내</p>
	<div class="calendar-div">
		<!-- calendar 태그 -->
		<div id='calendar-container'>
			<div id='calendar'></div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="contestModel" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
				<div class="title-div">
					<p class="txt1"></p>
					<p class="txt2"></p>
				</div>
					
				<div class="info-div">
					<div class="img-div">
						<img alt="" src="./common/image/calendar-info-img.jpg">
					</div>
					<div class="table-div">
						<p class="title">대회 일정</p>
						<table class="table table-bordered">
							<caption>대회 정보 안내</caption>
							<colgroup>
								<col width="100px">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<th>신청기간</th>
									<td class="apply-date"></td>
								</tr>
								<tr>
									<th>대회기간</th>
									<td class="contest-date"></td>
								</tr>
								<tr>
									<th>코스</th>
									<td>42K/25K/15K</td>
								</tr>
								<tr>
									<th>참가비</th>
									<td class="money"></td>
								</tr>
							</tbody>
						</table>	
						<div class="btn-wrap">
							<a href="index.jsp?go=apply/applyMain.jsp&menu_one=8&menu_two=9" class="btn-update">신청하러가기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

