<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=75b55ec525cce4f70d04fcb35bbcdbdd"></script>
<script type="text/javascript">
	$(function(){
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.52846441386419, 126.93191938376575), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		// 마커가 표시될 위치입니다 
		var markerPosition  = new kakao.maps.LatLng(37.52831976902039, 126.93181209541387); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	});
</script>
<style>
	.way-list {
		margin-top:40px;
	}
	.way-list li {
		margin-bottom:15px;
		font-size:14px;
	}
	.way-list li p:first-child {
		margin-bottom:10px;
		font-size:16px;
		font-weight:bold;
	}
	.way-list li p:first-child:before {
		content:"";
		display:inline-block;
		width:4px;
		height:4px;
		margin-right:10px;
		background:#666;
		vertical-align:middle;
	}
	.info-txt {
		margin:20px 0;
	}
	.info-txt + table {
		font-size:16px;
	}
	.info-txt + table td {
		vertical-align:middle !important;
	}
</style>
<div class="location-area">
	<p class="title">위치 안내</p>
	<div class="map-div" id="map" style="width:100%; height:500px;"></div>
	<ul class="way-list">
		<li>
			<p>대중교통 이용 시</p>
			<p>
				- 지하철 : 5호선 여의나루역 3번출구에서 도보 7분<br/>
				- 버  스 : 여의도중학교 정류장(19142)에서 하차 후 도보 2분
			</p>
		</li>
		<li>
			<p>주차장 이용 시</p>
			<p>- 출도착지에서 가까운 주차장 2곳 안내드립니다.</p>
		</li>
	</ul>
	<div class="info-txt">
		<p>* 공원 내 주차장 이용 시 별도의 주차비가 발생하며, 주차비는 참가자 본인 부담입니다.</p>
		<p>* 주차장이 혼잡하오니 가급적 대중교통을 이용 바랍니다.</p>
	</div>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>주차장명</th>
				<th>이용시간</th>
				<th colspan="3">주차요금</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>여의도 1주차장</td>
				<td rowspan="2" align="center">06:00 ~ 23:00</td>
				<td>최초 30분</td>
				<td>최초 10분당</td>
				<td>1일 주차 최고한도</td>
			</tr>
			<tr>
				<td>여의도 2주차장</td>
				<td>2,000원</td>
				<td>300원</td>
				<td>15,000원</td>
			</tr>
		</tbody>
	</table>
</div>