<%@page import="data.dto.GiftDTO"%>
<%@page import="data.dao.GiftDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<style>
	.gift-div table td {
		background:#f5f5f5;
	}
	.gift-div .btn-wrap {
		text-align:right;
	}
	.gift-box {
		position:relative;
		padding:10px 30px 10px 15px;
		border-bottom:1px solid #e5e5e5;
	}
	.gift-box:last-child {
		border-bottom:none;
	}
	.gift-box .form-list {
		display:flex;
		flex-wrap:nowrap;
		align-items:center;
		margin-top:10px;
	}
	.gift-box .form-list:first-child {
		margin-top:0;
	}
	.gift-box .form-list .txt1 {
		width:80px;
		font-size:14px;
	}
	.gift-box .form-list .form-control {
		width:455px;
	}
	.gift-box .file-attach {
		width:455px;
	}
	.gift-box .file-attach .file-txt {
		display:inline-block;
		width:365px;
	}
	.gift-box .file-attach .file-txt span {
		display:inline-block;
		padding:6px 20px 6px 10px;
		font-size:14px;
		color:#999;
	}
	.gift-box .file-attach .file-txt span:before {
		position:absolute;
		top:8px;
		right:0;		
	}
	.gift-box .file-attach input[type='file']{
		display:none;
	}
	.gift-box .file-attach .file-btn {
		display:inline-block;
		padding:5px 10px;
		font-size:14px;
		text-align:center;
	}
	.form-inline.gift-form {
		display:none;
	}
	.plus-btn, .minus-btn {
		display:inline-block;
		width:25px;
		height:25px;
		margin-left:10px;
		color:#fff;
		line-height:25px;
		background:#5799c0;
		border-radius:5px;
		text-align:center;
	}
	.minus-btn {
		position:absolute;
		top:50%;
		right:10px;
		transform:translateY(-50%);
	}
	.gift-box:first-child .minus-btn {
		display:none;
	}
</style>
<script type="text/javascript">
$(function(){
	$(document).on("click", ".file-btn", function(){
		$(this).prev("input").trigger("click");
	});

	$(".plus-btn").click(function(){
		var plusItem = $(this).parents("tr").find(".gift-box").eq(0).clone();
		
		$(this).parents("tr").find("td").append(plusItem);
	});
	
	$(document).on("click", ".minus-btn", function(){
		$(this).parents(".gift-box").remove();
	});
});

function readUrl(input){
	if(input.files[0]){
		var reader = new FileReader();
		reader.onload = function(e){
			var filename = input.files[0].name;
			$(input).parents(".form-list").find(".file-txt").html("<span class='glyphicon glyphicon-remove'>" + filename + "</span>");
			//console.log(filename);
		}
		reader.readAsDataURL(input.files[0]);
	}
}
</script>
<%
	request.setCharacterEncoding("utf-8");
	String contestName = request.getParameter("name");
	GiftDAO dao = new GiftDAO();
	GiftDTO dto = dao.getGift(contestName);
%>
<div class="gift-div">
	<p class="title">기념품 추가</p>
	<form action="./admin/contest/updateGiftAction.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="contest_name" value="<%= contestName %>">
		<table class="table table-bordered">
			<colgroup>
				<col width="150px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th style="vertical-align:middle;">선택<a href="javascript:" class="plus-btn">+</a></th>
					<td>
						<div class="gift-box">
							<div class="form-list">
								<p class="txt1">타이틀</p>
								<input type="text" class="form-control" name="name" placeholder="기념품명을 입력해주세요." value="<%= dto.getName() %>" required="required">
							</div>
							<div class="form-list">
								<p class="txt1">설명</p>
								<textarea class="form-control" name="content" placeholder="설명 입력해주세요." value="<%= dto.getContent() %>" required="required"></textarea>
							</div>
							<div class="form-list">
								<p class="txt1">첨부파일</p>
								<div class="file-attach">
									<input type="file" class="form-control" name="photo" onchange="readUrl(this)" multiple>
									<button type="button" class="file-btn">파일 선택</button>
									<p class="file-txt">
										<span><%= dto.getPhoto() %></span>
									</p>
								</div>
							</div>
							<a href="javascript:" class="minus-btn">-</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<div class="btn-wrap">
			<button type="submit" class="btn btn-info save-btn">수정</button>
			<button type="button" class="btn btn-default" onclick="location.href='index.jsp?go=admin/contest/contestList.jsp&menu_one=13&menu_two=20'">Close</button>
		</div>
	</form>
</div>