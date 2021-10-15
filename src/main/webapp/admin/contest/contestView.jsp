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
		if($("#checkGift").val() == "1"){
			console.log("체크")
			$("#checkGift").prop("checked", true);
			$("#checkGift").parents(".checkbox").next().show();
		}else{
			console.log("체크xxx")
			$("#checkGift").prop("checked", false);
			$("#checkGift").parents(".checkbox").next().hide();
		}
	});
</script>
<%
	String contestName = request.getParameter("contest_name");
	
	ContestDAO dao = new ContestDAO();
	ContestDTO dto = dao.getList(contestName);
%>
<div class="admin-area">
	<form action="./index.jsp?go=admin/contest/updateContest.jsp&menu_one=13&menu_two=20&contest_name=<%= contestName %>" method="post">
		<div class="contest-add-div">
			<p class="title">대회 상세</p>
			<table class="table table-bordered">
				<colgroup>
					<col width="150px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>대회명</th>
						<td>
							<%= dto.getName() %>
						</td>
					</tr>
					<tr>
						<th>대회설명</th>
						<td>
							<%= dto.getContent() %>
						</td>
					</tr>
					<tr>
						<th>신청기간</th>
						<td>
							<%= dto.getApply_start() %> ~ <%= dto.getApply_end() %>
						</td>
					</tr>
					<tr>
						<th>대회기간</th>
						<td>
							<%= dto.getContest_start() %> ~ <%= dto.getContest_end() %>
						</td>
					</tr>
					<tr>
						<th>기념품</th>
						<td>
							<div class="checkbox">
								<label><input type="checkbox" id="checkGift" name="gift_check" value="<%= dto.getGift_check() %>" disabled="disabled">기념품 제공</label> 
							</div>
							<div><%= dto.getGift_start() %> ~ <%= dto.getGift_end() %></div>
						</td>
					</tr>
					<tr>
						<th>참가비</th>
						<td>
							<%= dto.getMoney() %> 원
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div classs="btn-div">
			<button type="submit" class="btn btn-info update-btn">수정</button>
			<button type="button" class="btn btn-info delete-btn">삭제</button>
		</div>
	</form>
</div>