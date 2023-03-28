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
		<script >
		
		
		</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=623ffaa66ba0d2a47db0ea43e0894646&libraries=clusterer"></script>
		
		
<%-- 		 <c:forEach  var="goods" items="${goodsList}" varStatus="articleNum" > --%>
<!--      <tr align="center"> -->
<%-- 	<td width="5%">${articleNum.count}</td> --%>
<%-- 	<td width="10%">${article.id }</td> --%>
<!-- 	<td align='left'  width="35%"> -->
<!-- 	  <span style="padding-right:30px"></span> -->
<%-- 	   <c:choose> --%>
<%-- 	      <c:when test='${article.level > 1 }'>   --%>
<%-- 	         <c:forEach begin="1" end="${article.level }" step="1"> --%>
<!-- 	              <span style="padding-left:20px"></span>     -->
<%-- 	         </c:forEach> --%>
<!-- 	         <span style="font-size:12px;">[답변]</span> -->
<%--                    <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title}</a> --%>
<%-- 	          </c:when> --%>
<%-- 	          <c:otherwise> --%>
<%-- 	            <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.articleNO}">${article.title }</a> --%>
<%-- 	          </c:otherwise> --%>
<%-- 	        </c:choose> --%>
<!-- 	  </td> -->
<%-- 	  <td  width="10%">${article.writeDate}</td>  --%>
<!-- 	</tr> -->
<%--     </c:forEach> --%>
    
    
		
		
		
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapCenter = new kakao.maps.LatLng(36.349229, 127.377619), // 지도의 중심 좌표
		mapOption = {
			center : mapCenter, // 지도의 중심 좌표
			level : 11
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
		map.setMapTypeId(kakao.maps.MapTypeId.SKYVIEW);
			
		const locations = [
				{
					content : '<div class="overlay_info">'
							+ '    <a href="https://place.map.kakao.com/17600274" target="_blank"><strong>건대입구역</strong></a>'
							+ '    <div class="desc">'
							+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
							+ '        <span class="address">드디어!!!!!</span>'
							+ '    </div>' + '</div>',
					lat : 37.539922,
					lng : 127.070609
				},
				{
					content : '<div class="overlay_info">'
							+ '    <a href="https://place.map.kakao.com/17600274" target="_blank"><strong>어린이대공원</strong></a>'
							+ '    <div class="desc">'
							+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
							+ '        <span class="address">성공!!!!!!!</span>'
							+ '    </div>' + '</div>',
					lat : 36.4549446,
					lng : 127.4797935
				},
				{
					content : '<div class="overlay_info">'
							+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
							+ '    <div class="desc">'
							+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
							+ '        <span class="address">했어!!!!!!!</span>'
							+ '    </div>' + '</div>',
					lat : 36.349229,
					lng : 127.377619
				},
				{content : '<div class="overlay_info">'
					+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
					+ '    <div class="desc">'
					+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
					+ '        <span class="address">했어!!!!!!!</span>'
					+ '    </div>' + '</div>',
				      lat : 37.27943075229118,
				      lng : 127.01763998406159
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.55915668706214,
				      lng : 126.92536526611102
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.13854258261161,
				      lng : 129.1014781294671
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.55518388656961,
				      lng : 126.92926237742505
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.20618517638034,
				      lng : 129.07944301057026
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.561110808242056,
				      lng : 126.9831268386891
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.86187129655063,
				      lng : 127.7410250820423
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.47160156778542,
				      lng : 126.62818064142286
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.10233410927457,
				      lng : 129.02611815856181
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.10215562270429,
				      lng : 129.02579793018205
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.475423012251106,
				      lng : 128.76666923366042
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.93282824693927,
				      lng : 126.95307628834287
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.33884892276137,
				      lng : 127.393666019664
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.520412849636,
				      lng : 126.9742764161581
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.155139675209675,
				      lng : 129.06154773758374
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.816041994696576,
				      lng : 127.11046706211324
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 38.20441110638504,
				      lng : 128.59038671285234
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.586112739308916,
				      lng : 127.02949148517999
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.50380641844987,
				      lng : 127.02130716617751
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.55155704387368,
				      lng : 126.92161115892036
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.55413060051369,
				      lng : 126.92207472929526
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.362321615174835,
				      lng : 127.35000483225389
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.55227862908755,
				      lng : 126.92280546294998
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.490413948014606,
				      lng : 127.02079678472444
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.172358507549596,
				      lng : 126.90545394866643
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.15474103200252,
				      lng : 129.11827889154455
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.516081250973485,
				      lng : 127.02369057166361
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.80711722863776,
				      lng : 127.14020346037576
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.28957415752673,
				      lng : 127.00103752005424
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.83953896766896,
				      lng : 128.7566880321854
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.51027412948879,
				      lng : 127.08227718124704
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.493581783270294,
				      lng : 126.72541955660554
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.135291862962795,
				      lng : 129.10060911448775
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.174574933144065,
				      lng : 126.91389980787773
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.795887691878654,
				      lng : 127.10660416587146
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.59288687521181,
				      lng : 126.96560524627377
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.45076411130452,
				      lng : 127.14593003749792
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.86008337557079,
				      lng : 127.1263912488061
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.23773491330953,
				      lng : 129.08371037429578
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.524297321304886,
				      lng : 127.05018281937049
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.33386658021849,
				      lng : 127.4461721466889
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.72963747546802,
				      lng : 128.27079056365005
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.02726828142973,
				      lng : 129.37257233594056
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.0708030360945,
				      lng : 129.0593185494088
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.86835862950247,
				      lng : 128.59755089175871
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 33.51133264696746,
				      lng : 126.51852347452322
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.61284289586752,
				      lng : 127.03120547238589
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.851696038722466,
				      lng : 128.59092937125666
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.59084695083232,
				      lng : 127.01872773588882
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.52114874288784,
				      lng : 129.33573629945764
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.362326407439845,
				      lng : 127.33577420148076
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.28941189110747,
				      lng : 127.00446132665141
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.32049801117398,
				      lng : 129.1810343576788
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.53338631541601,
				      lng : 127.00615481678061
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.413461468258156,
				      lng : 126.67735680840826
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.920390371093205,
				      lng : 128.54411720249956
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.65489374054824,
				      lng : 127.48374816871991
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.49491987110441,
				      lng : 127.01493134206048
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.64985695608336,
				      lng : 127.14496345268074
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.55686770317417,
				      lng : 127.16927880543041
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.37014007589146,
				      lng : 127.10614330185591
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.5350236507627,
				      lng : 126.96157681184789
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.40549630594667,
				      lng : 126.8980581820004
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 34.867950544005744,
				      lng : 128.69069690081176
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.16317059543225,
				      lng : 128.98452978748048
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.607484825953186,
				      lng : 127.48520451195111
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.651724785213986,
				      lng : 126.58306748337554
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.86059690063427,
				      lng : 128.59193087665244
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.25685847585025,
				      lng : 128.59912605060455
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 33.509258155694496,
				      lng : 126.5109451464813
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.64366155701157,
				      lng : 126.63255039247507
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.82667262227336,
				      lng : 127.1030670574823
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.82003554991111,
				      lng : 127.14810974062483
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.097485195649455,
				      lng : 128.99486181862338
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.32204249590605,
				      lng : 127.95591893585816
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.50535127272031,
				      lng : 127.1047465440526
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.99081407156533,
				      lng : 127.09338324956647
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.323486640444834,
				      lng : 127.12285239871076
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.78973089440451,
				      lng : 127.13644319545601
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.641373953578196,
				      lng : 129.35463220719618
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.47423127310911,
				      lng : 126.97625029161996
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.84357192991226,
				      lng : 128.61143720719716
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.180974984085736,
				      lng : 128.20294526341132
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.57895718642583,
				      lng : 126.9316897337244
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 33.49077253755052,
				      lng : 126.49314817000993
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.42175925330255,
				      lng : 128.67409133225766
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.46405540570109,
				      lng : 126.7153544119173
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.594758776232126,
				      lng : 127.10099917489818
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.7239966558994,
				      lng : 127.0478671731854
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.86680171505329,
				      lng : 128.5923738376741
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.560573727266785,
				      lng : 126.81239107485251
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.78692224857484,
				      lng : 126.98966010341789
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.10368644802913,
				      lng : 129.0206862606022
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.063839948992644,
				      lng : 127.06856523030079
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.34344643728643,
				      lng : 127.94382181350932
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.512521267219064,
				      lng : 127.40054805648133
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.15286653837983,
				      lng : 126.90419903971498
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.173238445546296,
				      lng : 129.176082844468
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.082394201323524,
				      lng : 129.40330471725923
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.51043665598106,
				      lng : 127.03974070036524
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.627816673285054,
				      lng : 127.44969866021904
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.59194624756919,
				      lng : 127.01817545576053
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.387147045560866,
				      lng : 127.1253365438929
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.89948383848115,
				      lng : 128.60809550730653
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.555316235235324,
				      lng : 127.14038447894715
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.09622092762977,
				      lng : 128.43314679004078
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.582855922985544,
				      lng : 126.91907857008522
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.516000983841586,
				      lng : 128.72798872032757
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.48429363675198,
				      lng : 127.0379630203579
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.54502575965604,
				      lng : 126.95429338245707
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.236247173046394,
				      lng : 128.8677618015292
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.40157536691968,
				      lng : 127.11717457214067
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.95191038001258,
				      lng : 127.91064040877527
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.491526492971346,
				      lng : 126.85463749525812
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 36.124356479753196,
				      lng : 128.09517052346138
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.15715169307048,
				      lng : 128.15853461363773
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.5808156608605,
				      lng : 126.95109705510639
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.46931787249714,
				      lng : 126.89904775044873
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.52195614910054,
				      lng : 129.3209904841746
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.58625703195563,
				      lng : 126.9496035206742
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.28463639199199,
				      lng : 126.85984474757359
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.534169458631226,
				      lng : 129.31169021536095
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.553341234194285,
				      lng : 127.15481222237025
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 37.62293367990081,
				      lng : 126.83445005122417
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.5272027005698,
				      lng : 127.72953798950101
				    },
				    {content : '<div class="overlay_info">'
						+ '    <a href="https://www.naver.com/" target="_blank"><strong>그린컴퓨터학원</strong></a>'
						+ '    <div class="desc">'
						+ '        <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/place_thumb.png" alt="">'
						+ '        <span class="address">했어!!!!!!!</span>'
						+ '    </div>' + '</div>',
				      lat : 35.180032285898854,
				      lng : 128.06954509175367
				    }
				];
		
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
	
	
	
	
	
</body>
</html>