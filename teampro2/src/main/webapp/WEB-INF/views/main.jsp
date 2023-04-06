<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.overlay_info {
	border-radius: 6px;
	margin-bottom: 12px;
	float: left;
	position: relative;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	background-color: #fff;
}

.overlay_info:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.overlay_info a {
	display: block;
	background: #d95050;
	background: #d95050
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
	text-decoration: none;
	color: #fff;
	padding: 12px 36px 12px 14px;
	font-size: 14px;
	border-radius: 6px 6px 0 0
}

.overlay_info a strong {
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_icon.png)
		no-repeat;
	padding-left: 27px;
}

.overlay_info .desc {
	padding: 14px;
	position: relative;
	min-width: 190px;
	height: 56px
}

.overlay_info img {
	vertical-align: top;
}

.overlay_info .address {
	font-size: 12px;
	color: #333;
	position: absolute;
	left: 80px;
	right: 14px;
	top: 24px;
	white-space: normal
}

.overlay_info:after {
	content: '';
	position: absolute;
	margin-left: -11px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png)
		no-repeat 0 bottom;
}
</style>

<meta charset="utf-8">
<title>마커 클러스터러에 클릭이벤트 추가하기</title>

</head>
<body>

	<div id="map" style="width: 1180px; height: 700px;"></div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=623ffaa66ba0d2a47db0ea43e0894646&libraries=clusterer"></script>

	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapCenter = new kakao.maps.LatLng(36.349229, 127.377619), // 지도의 중심 좌표
		mapOption = {
			center : mapCenter, // 지도의 중심 좌표
			level : 11
		// 지도의 확대 레벨
		};
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		map.setMapTypeId(kakao.maps.MapTypeId.ROADMAP);

		var locations = [];
		
		<c:forEach var="goods" items="${goodsList}" >
  locations.push({
    content: `<div class="overlay_info">`
           + `  <a href="${contextPath}/goods/goodsDetail?goods_id=${goods.goods_id}" target="_blank"><strong>${goods.name}</strong></a>`
           + `  <div class="desc">`
           + `    <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">`
           + `    <span class="address">${goods.addr1}</span>`
           + `  </div>` 
           + `</div>`,
           lat : ${goods.location_x},
		   lng : ${goods.location_y}
  });
  </c:forEach>
		
		// 마커 클러스터러를 생성합니다
		var clusterer = new kakao.maps.MarkerClusterer({
		  map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
		  averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
		  minLevel: 10 // 클러스터 할 최소 지도 레벨
		});
		var markers = [];
		
		
		for (var i = 0; i < locations.length; i++) {
			var marker = new kakao.maps.Marker({
				map : map,
				position : new kakao.maps.LatLng(locations[i].lat,
						locations[i].lng)
			});
			// 커스텀 오버레이를 생성합니다
			var mapCustomOverlay = new kakao.maps.CustomOverlay({
				clickable : true,
				position : new kakao.maps.LatLng(locations[i].lat,
						locations[i].lng),
				content : locations[i].content,
				xAnchor : 0.5, // 커스텀 오버레이의 x축 위치입니다. 1에 가까울수록 왼쪽에 위치합니다. 기본값은 0.5 입니다
				yAnchor : 1.0
			// 커스텀 오버레이의 y축 위치입니다. 1에 가까울수록 위쪽에 위치합니다. 기본값은 0.5 입니다
			});
			kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, mapCustomOverlay));
			kakao.maps.event.addListener(map, 'rightclick', makeOutListener(mapCustomOverlay));
			markers.push(marker);
		}
		
		// 클러스터러에 마커들을 추가합니다(마커 클러스터러 관련)
		clusterer.addMarkers(markers);
		
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, mapCustomOverlay) {
			return function() {
				mapCustomOverlay.setMap(map, marker);
			};
		}
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(mapCustomOverlay) {
			return function() {
				mapCustomOverlay.setMap(null);
			};
		}
	</script>

	<c:forEach var="goodslist" items="${goodsList}">
	</c:forEach>





</body>
</html>