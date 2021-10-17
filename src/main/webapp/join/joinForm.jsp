<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
	table{
		margin: 30px;
	}
	
	table.option td{
		font-size: 0.85em;
	}
	
	th{
		width: 200px;
	}
	
	.plus{
		color: #659EFF;
		font-weight: bold;
	}
	
	.warn{
		color: #EE2626;
		font-weight: bold;
	}
	
	.accor-content{
		overflow: auto; 
		width:500px; 
		height:150px; 
		white-space:pre;
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
		
	//비밀번호 주의사항 이벤트
	//생기기
	$("#passCheck").html('<br>');
	$("#pass1").focus(function(){
		$("#passCheck").html('&nbsp;<span class="glyphicon glyphicon-info-sign"></span>&nbsp;영문 대소문자,특수문자,숫자를 포함한 8~20자의 비밀번호를 입력해주세요.');
	});
	//없애기
	$("#pass1").blur(function(){
		$("#passCheck").html('<br>');
	});
	
	$("#passSame").html('<br>');
	//비밀번호 동일 이벤트
	$("#pass2").change(function(){
		//비밀번호가 동일하지 않으면
		if($("#pass1").val()!=$("#pass2").val()){
			$("#passSame").attr("class","warn");
			$("#passSame").html('&nbsp;<span class="glyphicon glyphicon-info-sign"></span> 비밀번호가 일치하지 않습니다.');
		} else{
			$("#passSame").attr("class","plus");
			$("#passSame").html('&nbsp;<span class="glyphicon glyphicon-info-sign"></span> 비밀번호가 일치합니다.');
		}
	});

	//아이디 중복 체크
	$("#idDouble").click(function() {
		popup("join/idSearchForm.jsp", 550, 350);
	});
	//닉네임 중복 체크
	$("#nickDouble").click(function() {
		popup("join/nickSearchForm.jsp", 550, 350);
		<% session.setAttribute("from", "join"); %>
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

	//취소 버튼
	$("#joinNo").click(function() {
		//로그인 페이지로 이동
		history.back();
	});
	
	
	//비번 유효성 검사
	$("#pass1, pass2").change(function() {
		var pw = $(this).val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/g);
		var engB = pw.search(/[A-Z]/g);
		var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);

		if(pw.length < 8 || pw.length > 20){
		 alert("8자리 ~ 20자리 이내로 입력해주세요.");
		 return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
		 }else if(num < 0 || eng < 0 || engB < 0 || spe < 0 ){
		  alert("영문 대소문자+숫자+특수문자를 포함하여 입력해주세요.");
		  return false;
		 }else {
			console.log("통과"); 
		    return true;
		 }
	});
	
});

	function check(f){
		//아이디 체크
		if(f.id.value.length==0){
			alert("아이디를 입력해주세요");
			return false;
		}
		
		//비번 체크
		if(f.pass1.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다");
			f.pass1.value="";
			f.pass2.value="";
			return false;
		} else{
			return true;
		}
		
		/* var pw = f.pass.val();
		var num = pw.search(/[0-9]/g);
		var eng = pw.search(/[a-z]/g);
		var engB = pw.search(/[A-Z]/g);
		var spe = pw.search(/[`~!@@#$%^&*|\\\'\";:\/?]/gi);

		if(pw.length < 8 || pw.length > 20){
		 alert("8자리 ~ 20자리 이내로 입력해주세요.");
		 return false;
		 }else if(pw.search(/\s/) != -1){
		  alert("비밀번호는 공백 없이 입력해주세요.");
		  return false;
		 }else if(num < 0 || eng < 0 || engB < 0 || spe < 0 ){
		  alert("영문 대소문자+숫자+특수문자를 포함하여 입력해주세요.");
		  return false;
		 }else {
		    return true;
		 }
		
		//약관체크
		if(opt1.is(":checked") && opt2.is(":checked")){
			return true;
		} else{
			alert("필수약관에 동의하여 주세요.");
			return false;
		} */
	}
</script>
</head>

<body>
<form action="join/joinAdd.jsp" method="post" class="form-inline" name="joinfrm" onsubmit="return check(this)">
<div>
	<table class="table table-bordered option accor-all" style="width: 760px;">
		<tbody>
			<tr>
				<th rowspan="4">약관동의</th>
				<td>
					<input type="checkbox" id="optAll">&nbsp;&nbsp;전체동의
				</td>
			</tr>
			<tr class="accor-div">
				<td>
					<input type="checkbox" class="opt" id="opt1" name="opt1" style="float: left;">
					<div class="accor-title" >
						<div style="float: left;">
							&nbsp;&nbsp;이용약관 동의<span class="plus"> (필수)</span>
						</div>
						<div style="text-align: right;"><span class="glyphicon glyphicon-menu-down detail-icon" style="font-weight: bold;">자세히보기</span></div>
					</div>
					<div class="accor-content">
						<jsp:include page="terms.jsp">
							<jsp:param value="1" name="term"/>
						</jsp:include>
					</div>
				</td>
			</tr>
			<tr class="accor-div">
				<td>
					<input type="checkbox" class="opt" id="opt2" name="opt2" style="float: left;">
					<div class="accor-title" >
						<div style="float: left;">
							&nbsp;&nbsp;개인정보처리방침 동의<span class="plus"> (필수)</span>
						</div>
						<div style="text-align: right;"><span class="glyphicon glyphicon-menu-down detail-icon" style="font-weight: bold;">자세히보기</span></div>
					</div>
					<div class="accor-content">
						<jsp:include page="terms.jsp">
							<jsp:param value="2" name="term"/>
						</jsp:include>
					</div>
				</td>
			</tr>
			<tr class="accor-div">
				<td>
					<input type="checkbox" class="opt" name="opt" id="opt" style="float: left;">
					<div class="accor-title" >
						<div style="float: left;">
							&nbsp;&nbsp;마케팅정보 동의<span class="plus"> (선택)</span>
						</div>
						<div style="text-align: right;"><span class="glyphicon glyphicon-menu-down detail-icon" style="font-weight: bold;">자세히보기</span></div>
					</div>
					<div class="accor-content">
						<jsp:include page="terms.jsp">
							<jsp:param value="3" name="term"/>
						</jsp:include>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>

<hr>

<div>
	<table class="table table-bordered" style="width: 760px; float: left;">
		<tbody>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" class="form-control" autofocus="autofocus" required="required">
				</td>
			</tr>
			
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="hp1" id="hp1" class="form-control" required="required" maxlength="3" style="width: 100px;" value="">
					<select id="selHp1" class="form-control" style="width: 100px; background-color: #eeeeee">
						<option value="-" selected="selected" disabled="disabled">직접입력</option> 
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
				<th>아이디</th>
				<td>
				<input type="text" name="id" id="id" class="form-control" required="required" readonly="readonly">
				<button type="button" class="btn btn-info" id="idDouble">중복체크</button>
				</td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pass1" id="pass1" class="form-control" required="required" maxlength="15" placeholder="비밀번호">
					<div class="plus" id="passCheck" style="font-size: 0.8em;"></div>
					<input type="password" name="pass2" id="pass2" class="form-control" required="required" maxlength="15" placeholder="비밀번호 확인">
					<div class="plus" id="passSame" style="font-size: 0.8em;"></div>
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
				<th>닉네임</th>
				<td>
				<input type="text" name="nick" id="nick" class="form-control" required="required" readonly="readonly">
				<button type="button" class="btn btn-info" id="nickDouble">중복체크</button>
				</td>
			</tr>
			
			<tr>
				<th>본인인증 질문</th>
				<td>
					<select name="selAuth" id="selAuth" class="form-control">
						<option value="-" disabled="disabled" selected="selected">선택</option>
						<option value="character">좋아하는 캐릭터는?</option>
						<option value="school">초등학교 이름은?</option>
						<option value="movie">좋아하는 영화는?</option>
						<option value="freind">친한 친구의 이름은?</option>
						<option value="hobby">나의 취미는?</option>
					</select>
					<input type="text" name="auth" class="form-control" required="required" maxlength="20">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" id="joinYes" class="btn btn-info" style="height: 52px; width: 160px; font-size: 1.1em;">회원가입하기</button>&nbsp;&nbsp;
					<button type="reset" id="joinNo" class="btn btn-default" style="height: 52px; width: 130px; font-size: 1.1em;">취소</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
</form>
</body>
</html>