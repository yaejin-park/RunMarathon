<%@page import="java.io.Console"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.MemberDTO"%>
<%@page import="data.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	.course{
		margin-right: 20px;
		width: 80px;
	}
	
</style>
<script type="text/javascript">
$(function(){
	<%
	String id = (String)session.getAttribute("sessionId");
	String type = request.getParameter("type");
	%>
	//회원정보 동일
	$("#memberData").click(function() {
		var id = $(this).val();
		//체크 됐으면
		if($("#memberData").is(":checked")){
			$.ajax({
				type: "get",
				dataType: "json",
				data: {"id":id},
				url: "./apply/getMember_ajax.jsp",
				success: function(data) {
					$("#name").val(data.name);
					$("#hp1").val(data.hp1);
					$("#hp2").val(data.hp2);
					$("#hp3").val(data.hp3);
					$("#addr1").val(data.addr1);
					$("#addr2").val(data.addr2);
				}
			});
		} else{
			$("#name").val("");
			$("#hp1").val("");
			$("#hp2").val("");
			$("#hp3").val("");
			$("#addr1").val("");
			$("#addr2").val("");
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
 
 	//무통장 버튼 선택
	$("#pay").click(function() {
		//한번더 클릭시(색깔이 있을때)
		if($(this).attr("result")!="yes"){
			$(this).css("background-color", "rgb(91 192 222)").css("box-shadow","0px 0px 10px #bebfbd").css("color","white").attr("result","yes");
		  	//무통장 버튼 클릭 여부 넘기기
			 $("#payData").val($(this).val());
		  	console.log($("#payData").val());
		} else{
		    $(this).css("background-color", "").css("box-shadow","").css("color","").attr("result","");
		    $("#payData").val("");
		    console.log($("#payData").val());
		}
	});
});

function check(p) {
	if(p.payData.value.length==0){
		alert("무통장입금 버튼을 눌러주세요.");
		return false;
	}else{
		return true;
	}
}

</script>

</head>
<body>
<form action="apply/applyAddAction.jsp" method="post" class="form-inline" name="joinfrm" onsubmit="return check(this)">
<input hidden="hidden" name="marathon" value="런마라톤_2021">
<input hidden="hidden" id="courseData" name="course" value="">
<input hidden="hidden" id="payData" name="pay" value="">
<input hidden="hidden" id="id" name="id" value="<%=id%>">

<div>
	<table class="table" style="width: 760px; float: left;">
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<tbody>
			<tr>
				<td colspan="2" style="font-size: 0.8em">
					<input type="checkbox" name="member-data" id="memberData" value="<%=id%>">&nbsp;&nbsp;회원정보와 동일
				</td>
			</tr>
			
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
					<button type="button" id="course42" value="42K" class="btn btn-default course">42K</button>
					<button type="button" id="course25" value="25K" class="btn btn-default course">25K</button>
					<button type="button" id="course15" value="15K" class="btn btn-default course">15K</button>
				</td>
			</tr>
			<tr>
				<th>일정</th>
				<td>
					<select name="time" id="time" class="form-control">
						<option value="-" disabled="disabled" selected="selected">선택</option>
						<option value="15">2021/11/15 10:00</option>
						<option value="16">2021/11/16 10:00</option>
						<option value="17">2021/11/17 10:00</option>
						<option value="18">2021/11/18 10:00</option>
					</select>
				</td>
			</tr>
			<%if(type.equals("2")){%>
			<tr>
				<th>총 인원수</th>
				<td>
					<input type="number" name="person" id="person" class="form-control" required="required" max="50" min="2" value="2">명
				</td>
			</tr>
			<%} else{%>
				<input type="hidden" name="person" value="1">
			<%
			}%>
			<tr>
				<th>결제방법</th>
				<td>
					<div class="btn-group">
						<button type="button" id="pay" value="pay" class="btn btn-default">무통장입금</button>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="button" id="applyNo" class="btn btn-default" style="height: 52px; width: 130px; font-size: 1.1em;" onclick="history.go(-1);">취소</button>
					<button type="submit" id="applyYes" class="btn btn-info" style="height: 52px; width: 160px; font-size: 1.1em;">참가신청</button>&nbsp;&nbsp;
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>
</body>
</html>