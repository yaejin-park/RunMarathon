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
	.gift-div {
		display:none;
	}
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
		width:585px;
	}
	.gift-box .file-attach {
		width:585px;
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
		$(this).parents("td").find(".form-inline").hide();
		
		$("#checkGift").change(function(){
			if($("#checkGift").is(":checked")){
				$(this).parents("td").find(".form-inline").show();
				$(this).parents("td").find(".form-inline").find("input").attr("required", true);
				$(".gift-div").show();
			}else{
				$(this).parents("td").find(".form-inline").hide();
				$(this).parents("td").find(".form-inline").find("input").attr("required", false);
				$(".gift-div").hide();
			}
		});
		
		$(document).on("click", ".file-btn", function(){
			$(this).prev("input").trigger("click");
		});

		var tot = parseInt($("#gift_cnt").val());
		$(document).on("click", ".plus-btn", function(){
			var plusItem = $(this).parents("tr").find(".gift-box").eq(0).clone();
			tot+=1;
			$("#gift_cnt").val(tot);
			
			if(tot <= 5){
				$(this).show();
				$(plusItem).find("input[name=giftName1]").attr("name", "giftName" + tot);
				$(plusItem).find("input[name=photo1]").attr("name", "photo" + tot);
				$(plusItem).find("input[name=giftContent1]").attr("name", "giftContent" + tot);
				$(this).parents("tr").find("td").append(plusItem);
			}
			
			if(tot == 5){
				$(this).hide();
			}
		});
		
		$(document).on("click", ".minus-btn", function(){
			tot-=1;
			$("#gift_cnt").val(tot);
			if(tot < 6) {
				$(".plus-btn").show();
			}else{
				$(".plus-btn").hide();
			}
			$(this).parents(".gift-box").remove();
		});
	});
	
	function readUrl(input){
		if(input.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				var filename = input.files[0].name;
				$(input).parents(".form-list").find(".file-txt").html("<span class='glyphicon glyphicon-remove'>" + filename + "</span>");
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<div class="admin-area">
	<form action="./admin/contest/addContestAction.jsp" method="post" enctype="multipart/form-data">
		<input type="hidden" name="giftCnt" id="gift_cnt" value="1">
		<div class="contest-add-div">
			<p class="title">대회 추가</p>
			<table class="table table-bordered">
				<colgroup>
					<col width="150px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>대회명</th>
						<td>
							<input type="text" class="form-control" name="name" placeholder="대회명을 입력해주세요." required="required">
						</td>
					</tr>
					<tr>
						<th>대회설명</th>
						<td>
							<textarea class="form-control" name="content" placeholder="대회설명을 입력해주세요." required="required"></textarea>
						</td>
					</tr>
					<tr>
						<th>신청기간</th>
						<td>
							<div class="form-inline">
								<input type="text" class="form-control" name="apply_start" placeholder="예) 1980-01-01" required="required">
								<span>~</span>
								<input type="text" class="form-control" name="apply_end" placeholder="예) 1980-01-01" required="required">
							</div>
						</td>
					</tr>
					<tr>
						<th>대회기간</th>
						<td>
							<div class="form-inline">
								<input type="text" class="form-control" name="contest_start" placeholder="예) 1980-01-01" required="required">
								<span>~</span>
								<input type="text" class="form-control" name="contest_end" placeholder="예) 1980-01-01" required="required">
							</div>
						</td>
					</tr>
					<tr>
						<th>기념품</th>
						<td>
							<div class="checkbox">
								<label><input type="checkbox" id="checkGift" name="gift_check">기념품 제공</label> 
							</div>
							<div class="form-inline gift-form">
								<input type="text" class="form-control" name="gift_start" placeholder="예) 1980-01-01" >
								<span>~</span>
								<input type="text" class="form-control" name="gift_end" placeholder="예) 1980-01-01">
							</div>
						</td>
					</tr>
					<tr>
						<th>참가비</th>
						<td>
							<div class="form-inline">
								<input type="text" class="form-control" name="money" placeholder="참가비를 입력해주세요." required="required">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div class="gift-div">
			<p class="title">기념품 추가</p>
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
									<input type="text" class="form-control" name="giftName1">
								</div>
								<div class="form-list">
									<p class="txt1">설명</p>
									<input class="form-control" name="giftContent1" />
								</div>
								<div class="form-list">
									<p class="txt1">첨부파일</p>
									<div class="file-attach">
										<input type="file" class="form-control" name="photo1" onchange="readUrl(this)" multiple>
										<button type="button" class="file-btn">파일 선택</button>
										<p class="file-txt"></p>
									</div>
								</div>
								<a href="javascript:" class="minus-btn">-</a>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<div classs="btn-div">
			<button type="submit" class="btn btn-info add-btn">추가</button>
		</div>
	</form>
</div>