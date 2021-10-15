<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.sub-title {
		padding:60px;
		color:#fff;
		background: #408eb9; /* Old browsers */
		background: -moz-linear-gradient(left,  #408eb9 0%, #6a1c52 100%); /* FF3.6-15 */
		background: -webkit-linear-gradient(left,  #408eb9 0%,#6a1c52 100%); /* Chrome10-25,Safari5.1-6 */
		background: linear-gradient(to right,  #408eb9 0%,#6a1c52 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#408eb9', endColorstr='#6a1c52',GradientType=1 ); /* IE6-9 */
		text-align:center;
	}
	.logo-img {
		margin-bottom:30px;
	}
	.logo-img img {
		width:150px;
	}
	.intro-div {
		margin-top:40px;
		display:flex;
		flex-wrap:nowrap;
	}
	.intro-div .left-div {
		width:100px;
		font-size:20px;
		font-weight:bold;
		color:#000;
	}
	.intro-div .right-div {
		width:800px;
		padding-left:30px;
	}
	.intro-div .right-div img {
		width:100%;
	}
	.intro-div.width100 {
		display:block;
		flex-wrap:inherit;
		font-size:16px;
		line-height:1.3;
	}
	.intro-div.width100 .txt-div {
		margin-bottom:30px;;
	}
	.intro-div.width100 .txt1 {
		margin-bottom:10px;
		font-size:20px;
		font-weight:bold;
		color:#5799c0;
	}
</style>
<div class="intro-area">
	<p class="title">Run&Fun 소개</p>
	<div class="sub-title">
		<p class="logo-img"><img alt="" src="./common/image/logo-main.png"></p>
		<p>
			행사 기간 내 참가자들이 GPS 앱을 활용하여 원하는 시간 및 장소에서 달리며<br>
			아동과 청소년들에게 따뜻한 마음을 전하는 비대면 기부문화 확산 캠페인 입니다.
		</p>
	</div>
	<div class="intro-div">
		<div class="left-div">대회기간</div>
		<div class="right-div">
			<div class="date-txt"></div>
			<table class="table table-bordered">
				<caption>대회코스 안내</caption>
				<thead>
					<tr>
						<th>코스</th>
						<th>금요일</th>
						<th>토요일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>42K</th>
						<td></td>
						<td>O</td>
					</tr>
					<tr>
						<th>25K</th>
						<td>O</td>
						<td></td>
					</tr>
					<tr>
						<th>15K</th>
						<td>O</td>
						<td>O</td>
					</tr>
				</tbody>
			</table>
			<p class="info-txt">* 매주 금요일과 토요일에만 행사가 진행되며, 총 6회 진행될 예정입니다.</p>
		</div>
	</div>
	<div class="intro-div">
		<div class="left-div">참가방법</div>
		<div class="right-div">
			<img alt="" src="./common/image/intro-guide-img.png">
		</div>
	</div>
	<div class="intro-div width100">
		<div class="txt-div">
			<p class="txt1">온라인접수</p>
			<p class="txt2">
				2021 서울마라톤은 공식 홈페이지에서 참가신청이 가능합니다. 접수 시 유의사항 및 대회 안내에 대해 숙지하시기 바랍니다. 접수는 결제 기준이며 선착순으로 마감될 수 있으니 참고 바랍니다.
			</p>
		</div>
		<div class="txt-div">
			<p class="txt1">기록측정</p>
			<p class="txt2">앱스토어 또는 구글플레이에서 GPS 러닝앱(NRC, 스트라바, 가민 등)을 설치 후 기록을 측정하시기 바랍니다.</p>
		</div>
		<div class="txt-div">
			<p class="txt1">레이스팩 발송</p>
			<p class="txt2">레이스 팩 발송은 결제순으로 발송됩니다.</p>
		</div>
		<div class="txt-div">
			<p class="txt1">레이스 참여</p>
			<p class="txt2">GPS 러닝 앱을 활용하여 원하는 장소에서 5km이상 레이스를 완주해주시기 바랍니다.</p>
		</div>
		<div class="txt-div">
			<p class="txt1">기록 인증</p>
			<p class="txt2">홈페이지 기록 인증 페이지에서 본인 기록 입력이 가능합니다.</p>
		</div>
	</div>
</div>
