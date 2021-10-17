<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	<%
	String id = (String)session.getAttribute("sessionId");
	String type = request.getParameter("type");
	%>
	
	$.ajax({
		type: "get",
		dataType: "json",
		url: "./apply/getApply_ajax.jsp",
		success: function(data) {
			$("#name").val(data.name);
			$("#hp1").val(data.hp1);
			$("#hp2").val(data.hp2);
			$("#hp3").val(data.hp3);
			$("#addr1").val(data.addr1);
			$("#addr2").val(data.addr2);
			$("#person").val(data.person);
			$('time').val(data.time).prop("selected",true);
			$("#courseData").val(data.course);
			$("#"+data.course+"").css("background-color", "rgb(91 192 222)").css("box-shadow","0px 0px 10px #bebfbd").css("color","white");
		}
	});
	
	//핸드폰 선택 이벤트
	$("#selHp1").change(function() {
		$("#hp1").val($(this).val());
		$("#hp2").focus();
	});
	
	//휴대폰 중간칸 쓰면 포커스 이동
	$("#hp2").keyup(function() {
		if($(this).val().length==4){
			$("#hp3").focus();
		} 
	});	
		
	//주소 검색
	$("#searchAddr").click(function() {
		new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                $("#addr1").val(data.address); // 주소 넣기
                $("#addr2").focus(); //상세입력 포커싱
            }
        }).open();
	});
	
	//코스 버튼 선택
	$(".course").click(function() {
		$(this).css("background-color", "rgb(91 192 222)").css("box-shadow","0px 0px 10px #bebfbd").css("color","white");
	    $(this).siblings().css("background-color", "").css("box-shadow","").css("color","");
	   	//선택한 코스값 넘기기
	    $("#courseData").val($(this).val());
	});
 	
});

</script>
</head>
<body>
<form action="apply/applyModifyAction.jsp" method="post" class="form-inline" name="applyfrm" id="applyForm">
<input hidden="hidden" id="courseData" name="course" value="">
<input hidden="hidden" id="id" name="id" value="<%=id%>">

<div>
	<table class="table" style="width: 760px; float: left;">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<tbody>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" id="name" class="form-control" autofocus="autofocus" required="required" value="">
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="hp1" id="hp1" class="form-control" required="required" maxlength="4" style="width: 100px;" value="">
					<select id="selHp1" class="form-control" style="width: 100px; background-color: #BDD6FF">
						<option value="-" selected="selected">직접입력</option> 
						<option value="010">010</option>
						<option value="011">011</option>
						<option value="016">016</option>
						<option value="017">017</option>
						<option value="018">018</option>
						<option value="019">019</option>
					</select>
					<b>-</b>
					<input type="text" name="hp2" id="hp2" class="form-control" required="required" maxlength="4" style="width: 160px; width: 100px;">
					<b>-</b>
					<input type="text" name="hp3" id="hp3" class="form-control" required="required" maxlength="4" style="width: 160px; width: 100px;">
				</td>
			</tr>
			
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="addr1" id="addr1" class="form-control" required="required"  placeholder="주소" readonly="readonly">
					<button type="button" class="btn btn-info" id="searchAddr">주소검색</button>
					<br><br>
					<input type="text" name="addr2" id="addr2" class="form-control" required="required"  placeholder="상세주소 입력" style="width: 300px;">
				</td>					
			</tr>
			
			<tr>
				<th>코스</th>
				<td>
					<button type="button" id="42K" value="42K" class="btn btn-default course course-clicked">42K</button>
					<button type="button" id="25K" value="25K" class="btn btn-default course">25K</button>
					<button type="button" id="15K" value="15K" class="btn btn-default course">15K</button>
				</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<select name="time" id="time" class="form-control">
						<option value="-" disabled="disabled">선택</option>
						<option value="2021/11/15 10:00">2021/11/15 10:00</option>
						<option value="2021/11/16 10:00">2021/11/16 10:00</option>
						<option value="2021/11/17 10:00">2021/11/17 10:00</option>
						<option value="2021/11/18 10:00">2021/11/18 10:00</option>
					</select>
				</td>
			</tr>
			<%if(type.equals("2")){%>
			<tr>
				<th>총 인원수</th>
				<td>
					<input type="number" name="person" id="person" class="form-control" required="required" max="50" min="1">명
				</td>
			</tr>
			<%} else{%>
				<input type="hidden" name="person" value="1">
			<%
			}%>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="applyNo" class="btn btn-default" style="height: 52px; width: 130px; font-size: 1.1em;" onclick="history.go(-1);">취소</button>
					<button type="submit" id="applyYes" class="btn btn-info" style="height: 52px; width: 160px; font-size: 1.1em;">수정완료</button>&nbsp;&nbsp;
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>
</body>
</html>