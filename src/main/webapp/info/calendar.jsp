<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function(){
		// 현재 날짜 구하기
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		
		calendarView(year, month);
		
		// 버튼 이벤트
		$(".prev").click(function(){
			month--;
			if(month < 1){
				month = 12;
				year--;
			}
			calendarView(year, month);
		});
		$(".next").click(function(){
			month++;
			if(month > 12){
				month = 1;
				year++;
			}
			calendarView(year, month);
		});
	});
	
	function calendarView(year, month){
		var currDate = new Date(year, month-1, 1);
		var week = currDate.getDay();
		var cnt = week;
		var endday;
		
		var s = "";
		s += "<table class='table table-bordered'>";
		s += "<caption><b>" + year + "년" + month + "월 달력</b></caption>";
		s += "<tr>";
		s += "<th>일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>";
		s += "</tr>";
		
		s += "<tr>";
		
		// 요일 숫자만큼 빈칸 (td) 생성하기
		for(var i=1; i<=week; i++){
			s+="<td>&nbsp;</td>";
		}

		// 해당월이 몇일까지 있는지 endday 구하기
		// 그 다음 1일부터 endday까지 출력하는데 토요일 출력후 tr닫고 다시 tr열고
		if(month == 4 || month == 6 || month == 9 || month == 11){
			endday = 30;
		}else if(month == 2){
			if(year%4 == 0 && year%100 != 0 || year%400 == 0) {
				endday=29;
			}else{
				endday=28;
			}
		}else{
			endday = 31;
		}

		// 일수 넣기
		for(var i=1; i<=endday; i++){
			week++;
			
			// 주말 토, 일 글자색 빨강색으로
			if(week%7==1){
				s+="<td style='color:red;'>"+ i +"</td>";
			}else if(week%7==0){
				s+="<td style='color:orange;'>"+ i +"</td>";
			}else{
				s+="<td>"+ i +"</td>";
			}
			
			if(week%7==0){
				if(week == cnt+endday){
					s+="</tr>";
				}else{
					s+="</tr><tr>";
				}
			}
		}
		
		// 남은 빈칸 그리기
		while(true){
			if(week%7==0){
				s+="</tr>";
				break;
			}
			week++;
			s+="<td>&nbsp;</td>";
		}
		s += "</table>";
		$(".calendar").html(s);
		$(".calendar-top .year").text(year);
		$(".calendar-top .month").text(month);
	}
</script>
<style>
	.calendar-top {
		position:relative;
		margin-bottom:40px;
		text-align:center;
	}
	.calendar-top .txt span {
		font-size:30px;
		font-weight:bold;
		color:#5799c0;
	}
	.calendar-btn .prev {
		position:absolute;
		top:0;
		left:0;
	}
	.calendar-btn .next {
		position:absolute;
		top:0;
		right:0;
	}
</style>
<div class="calendar-area">
	<p class="title">일정 안내</p>
	<div class="calendar-div">
		<div class="calendar-top">
			<p class="txt">
				<span class="year"></span> 년
				<span class="month"></span> 월
			</p>
			<div class="calendar-btn">
				<a href="javascript:" class="prev">이전</a>
				<a href="javascript:" class="next">다음</a>
			</div>
		</div>
		<div class="calendar"></div>
	</div>
</div>