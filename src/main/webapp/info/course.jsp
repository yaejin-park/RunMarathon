<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.course-div {
		position:relative;
		margin-bottom:80px;
		border:2px solid #e5e5e5;
		border-radius:20px;
		box-shadow:2px 5px 10px rgba(0,0,0,0.1);
		overflow:hidden;
	}
	.course-list li {
		position:relative;
		margin-top:40px;
		border:2px solid #e5e5e5;
		border-radius:20px;
		box-shadow:2px 5px 10px rgba(0,0,0,0.1);
		overflow:hidden;
	}
	.course-div img ,.course-list li img {
		width:100%;
	}
	.course-div .course-btn {
		position:absolute;
		top:55px;
		left:25px;
		width:100%;
	}
	.course-div .course-btn a {
		display:inline-block;
		width:55px;
		height:30px;
		text-indent:-999px;
		overflow:hidden;
	}
</style>
<script type="text/javascript">
	$(function(){
		$(".course-btn a").each(function(q){
			$(this).click(function(){
				console.log($(".course-list li").eq(q).offset().top);
				gsap.to($("body, html"),0.5 , {scrollTop:$(".course-list li").eq(q).offset().top - $("header").height() - 40, ease:Power3.easeOut});
			});
		});
	});
</script>
<div class="course-area">
	<p class="title">코스 안내</p>
	<div class="course-div">
		<img alt="" src="./common/image/course-img-1.png">
		<div class="course-btn">
			<a href="javascript:">42K</a>
			<a href="javascript:">25K</a>
			<a href="javascript:">15K</a>
		</div>
	</div>
	
	<ul class="course-list">
		<li>
			<a href="javascript:">
				<img alt="" src="./common/image/course-img-2.png">
			</a>
		</li>
		<li>
			<a href="javascript:">
				<img alt="" src="./common/image/course-img-3.png">
			</a>
		</li>
		<li>
			<a href="javascript:">
				<img alt="" src="./common/image/course-img-4.png">
			</a>
		</li>
	</ul>
	
</div>