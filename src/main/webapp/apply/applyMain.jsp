<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table{
		margin: 30px;
	}
	
	table td{
		font-size: 0.7em;
	}
	
	th{
		width: 200px;
	}
	.accor-content{
		overflow: auto; 
		width:500px; 
		height:150px; 
		white-space:pre;
	}
	
	.accor-content{
		overflow: auto; 
		width:696px; 
		height:150px; 
		white-space:pre;
	}
	
	.plus{
		color: #659EFF;
		font-weight: bold;
	}
	
	button{
		width: 130px;
		margin: 30px;
		height: 40px;
	}
	
</style>
<script type="text/javascript">
$(function(){
	//약관 전체동의
	$("#optAll").click(function() {
		//체크 true
		 if($("#optAll").prop("checked")){
			$(this).parent().parent().siblings().find(".opt").prop("checked",true);
		} else{
			$(this).parent().parent().siblings().find(".opt").prop("checked",false);
		}
	});
	
	//하위 체크 해제
	$(".opt").click(function() {
		if(!$(this).prop("checked")){
			$("#optAll").prop("checked",false);
		}
	});
});

//약관 체크됐는지 확인
function check() {
	if($("#opt1").is(":checked")&&$("#opt2").is(":checked")){
		return true;
	} else{
		alert("약관에 동의해주세요");
		return false;
	}
}
</script>
</head>
<body>
<div>
<form action="index.jsp?go=apply/applyForm.jsp" method="post" class="form-inline" name="apply-main" onsubmit="return check()">
<table class="table table-bordered" style="width: 760px; float: left;">
	<tbody>
		<tr>
			<th>※참가자 유의사항</th>
		</tr>
		<tr>
			<td>
			<p>어떤 이유를 불문하고 가명, 차명을 통한 신청은 불가능합니다.<br>
신청후 참가권양도도 불가능합니다. (가명, 차명, 참가권양도는 본인의 안전 뿐 아니라 대회진행상 행정에도 많은 어려움을 초래합니다)<br>
가명, 차명, 참가권양도 사실이 밝혀질 경우 추후 참가제한 등 불이익을 당할 수 있음을 유념해주십시오.<br>
신청접수후 '확인메일' 혹은 '신청조회'를 통해 신청이 제대로 완료되었는지 확인하십시오. 중간에서 멈출 경우 신청이 완료되지 않습니다.</p>
			</td>
		</tr>
	</tbody>
</table>
<br><br>
<!-- 동의 -->
<div>
	<table class="table option accor-all" style="width: 760px;">
		<tbody>
			<tr>
				<td>
					<input type="checkbox" id="optAll">&nbsp;&nbsp;<b>전체동의</b>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" class="opt" id="opt1" style="float: left;">
					<div class="accor-title" >
						<div style="float: left;">
							&nbsp;&nbsp;참가자 안전수칙<span class="plus"> (필수)</span>
						</div>
						<div style="text-align: right;"><span class="glyphicon glyphicon-menu-down detail-icon" style="font-weight: bold;">자세히보기</span></div>
					</div>
					<div class="accor-content">
						<jsp:include page="./applyTerms.jsp?term=1"></jsp:include>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input type="checkbox" class="opt" id="opt2" style="float: left;">
					<div class="accor-title" >
						<div style="float: left;">
							&nbsp;&nbsp;개인정보처리방침<span class="plus"> (필수)</span>
						</div>
						<div style="text-align: right;"><span class="glyphicon glyphicon-menu-down detail-icon" style="font-weight: bold;">자세히보기</span></div>
					</div>
					<div class="accor-content">
						<jsp:include page="./applyTerms.jsp?term=2"></jsp:include>
					</div>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<button type="submit" class="btn btn-info" id="soloApply" value="1">개인 참가</button>
					<button type="submit" class="btn btn-info" id="groupApply" value="2">단체 참가</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>

</body>
</html>