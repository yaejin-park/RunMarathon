<%@page import="data.dto.ContestDTO"%>
<%@page import="data.dao.ContestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.checkbox {
		margin-top:0;
	}
	.checkbox label {
		font-size:14px;
		font-weight:bold;
		color:#5799c0;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(this).parents("td").find(".form-inline").hide();
		
		$("#checkGift").change(function(){
			if($("#checkGift").is(":checked")){
				//console.log("체크")
				$(this).parents("td").find(".form-inline").show();
				$(this).parents("td").find(".form-inline").find("input").attr("required", "required");
			}else{
				$(this).parents("td").find(".form-inline").hide();
			}
		});
	});
</script>
<%
	String contestName = request.getParameter("contest_name");
	
	ContestDAO dao = new ContestDAO();
	ContestDTO dto = dao.getList(contestName);
	
%>
<div class="admin-area">
	<form action="./admin/contest/updateContestAction.jsp" method="post">
		<div class="contest-add-div">
			<p class="title">대회 수정</p>
			<table class="table table-bordered">
				<colgroup>
					<col width="150px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>대회명</th>
						<td>
							<input type="text" class="form-control" name="name" placeholder="대회명을 입력해주세요." value="<%= dto.getName() %>" required="required">
						</td>
					</tr>
					<tr>
						<th>대회설명</th>
						<td>
							<textarea class="form-control" name="content" placeholder="대회설명을 입력해주세요." required="required">
								<%= dto.getContent() %> 
							</textarea>
						</td>
					</tr>
					<tr>
						<th>신청기간</th>
						<td>
							<div class="form-inline">
								<input type="text" class="form-control" name="apply_start" placeholder="예) 1980-01-01" value="<%= dto.getApply_start() %>" required="required">
								<span>~</span>
								<input type="text" class="form-control" name="apply_end" placeholder="예) 1980-01-01" value="<%= dto.getApply_end() %>" required="required">
							</div>
						</td>
					</tr>
					<tr>
						<th>대회기간</th>
						<td>
							<div class="form-inline">
								<input type="text" class="form-control" name="contest_start" placeholder="예) 1980-01-01" value="<%= dto.getContest_start() %>" required="required">
								<span>~</span>
								<input type="text" class="form-control" name="contest_end" placeholder="예) 1980-01-01" value="<%= dto.getContest_end() %>" required="required">
							</div>
						</td>
					</tr>
					<tr>
						<th>기념품</th>
						<td>
							<div class="checkbox">
								<label><input type="checkbox" id="checkGift" name="gift_check" checked="<%= dto.getGift_check() %>">기념품 제공</label> 
							</div>
							<div class="form-inline gift-form">
								<input type="text" class="form-control" name="gift_start" value="<%= dto.getGift_start() %>" placeholder="예) 1980-01-01" >
								<span>~</span>
								<input type="text" class="form-control" name="gift_end" value="<%= dto.getGift_end() %>" placeholder="예) 1980-01-01">
							</div>
						</td>
					</tr>
					<tr>
						<th>참가비</th>
						<td>
							<div class="form-inline">
								<input type="text" class="form-control" name="money" placeholder="참가비를 입력해주세요." value="<%= dto.getMoney() %>" required="required">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div classs="btn-div">
			<button type="submit" class="btn btn-info update-btn">수정</button>
		</div>
	</form>
</div>