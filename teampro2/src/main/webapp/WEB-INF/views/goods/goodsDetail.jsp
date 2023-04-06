<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="goodsVO" value="${goodsMap['goodsVO']}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
main {
	padding: 20px;
}
h2 {
	text-align: center;
}
article {
	margin: 00px 0px 0px 15px; width: 1350px; float: left;
}
.hc {
	width: 260px;
	left: 0;
	right: 0;
	margin-top: 5px;
	margin-left: auto;
	margin-right: auto;
	margin-left: auto;
}
/* 전체적인 레이아웃 */
.goods-info {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  width: 100%;
  padding: 20px;
}

/* 이미지 */
.goods-img {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  margin-bottom: 20px;
}

.goods-img img {
  max-width: 100%;
  height: auto;
  margin-right: 10px;
}

/* 제목 */
.goods-details h2 {
  font-size: 24px;
  margin-bottom: 10px;
}

/* 상세 정보 */
.goods-details p {
  font-size: 16px;
  margin-bottom: 5px;
  line-height: 1.5;
}
.goods-details strong {
  font-weight: bold;
  margin-right: 5px;
}

</style>

<body>

<h1>부동산 정보 상세페이지</h1>
<main class="hc" >
		
		<div class="goods-info">
			<div class="goods-img">
				<img src="" alt="${goodsVO.name}">
				<img src="https://img.freepik.com/free-photo/amazing-aerial-shot-of-the-singapore-cityscape-with-lots-of-skyscrapers_181624-18618.jpg?w=1380&t=st=1680597838~exp=1680598438~hmac=52ef8ef6ccd2b7e491f1f451e6a89de3e5dfc3e4d7a925207a95d562d18d674c" alt="${goodsVO.name}">
				<img src="https://previews.123rf.com/images/interiorpro/interiorpro1705/interiorpro170500026/78418579-%EA%B0%9C%EB%B0%A9%ED%98%95-%EC%95%84%ED%8C%8C%ED%8A%B8-%EB%82%B4%EB%B6%80.jpg" alt="${goodsVO.name}">
				<img src="${goodsVO.img4}" alt="${goodsVO.name}">
				<img src="${goodsVO.img5}" alt="${goodsVO.name}">
				<img src="${goodsVO.img6}" alt="${goodsVO.name}">
			</div>
			<div class="goods-details">
				<h2>${goodsVO.name}</h2>
				<p><strong>사업자 아이디:</strong> ${goodsVO.goods_bp_id}</p>
				<p><strong>종류:</strong> ${goodsVO.type}</p>
				<p><strong>층:</strong> ${goodsVO.floor}</p>
				<p><strong>면적:</strong> ${goodsVO.area}㎡</p>
				<p><strong>방 개수:</strong> ${goodsVO.room_num}</p>
				<p><strong>화장실 개수:</strong> ${goodsVO.bthroom_num}</p>
				<p><strong>방향:</strong> ${goodsVO.homeDrctn}</p>
				<p><strong>주차:</strong> ${goodsVO.parking}</p>
				<p><strong>주차비:</strong> ${goodsVO.parking_pay}원/월</p>
				<p><strong>엘리베이터:</strong> ${goodsVO.elevator}</p>
				<p><strong>베란다:</strong> ${goodsVO.veranda}</p>
				<p><strong>주용도:</strong> ${goodsVO.mainUse}</p>
				<p><strong>입주 가능일:</strong> ${goodsVO.move_in_date}</p>
				<p><strong>사용일:</strong> ${goodsVO.using_date}</p>
				<p><strong>등록일:</strong> ${goodsVO.make_date}</p>
				<p><strong>삭제일:</strong> ${goodsVO.remove_date}</p>
				<p><strong>보증금:</strong> ${goodsVO.daposit}만원</p>
				<p><strong>전세금:</strong> ${goodsVO.jeonse}만원</p>
				<p><strong>월세:</strong> ${goodsVO.payment}만원</p>
				<p><strong>관리비:</strong> ${goodsVO.m_payment}만원</p>
				<p><strong>보험비:</strong> ${goodsVO.b_payment}만원</p>
				<p><strong>관리비 포함 여부:</strong> ${goodsVO.main_cost}</p>
				<p><strong>부동산 설명:</strong> ${goodsVO.content}</p>
				<p><strong>위치:</strong> ${goodsVO.addr1} ${goodsVO.addr2} ${goodsVO.region}</p>
				<p><strong>상태:</strong> ${goodsVO.status}</p>
				<p><strong>좋아요:</strong> ${goodsVO.like}</p>
			</div>
		</div>
</main>

</body>
</html>