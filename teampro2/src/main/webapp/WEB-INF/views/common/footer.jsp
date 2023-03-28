<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
.parent {
	display: flex;
}

.parent .child {
	text-align: center;
}

.left {
/* 	background-color: beige; */
}

.center {
/* 	background-color: aquamarine; */
	flex: 2;
}

.right {
/* 	background-color: burlywood; */
}
</style>


<div class='parent'>
	<div class='child left'>
		<a href="#"><img
			src="${contextPath}/resources/image/main_logo.png" /></a>
	</div>
	<div class='child center'>
		<br><br>
		<p class="font_8" style=" font-size: 16px;">
			<span>상호 : (주)킹받쥬</span>
			 &nbsp;|&nbsp; 대표 : 김보미&nbsp; |&nbsp; 사업자등록번호: 459-15-01660<br>
			주소 : 서울특별시 강남구 역삼로 17길 64, 4층(역삼동, 제스빌딩) (우 : 34433)<br> 팩스 :
			0504-450-5055&nbsp; |&nbsp;<br> 통신판매업 신고번호 : 제2021-서울강남-06358호<br>
			서비스 이용문의 : 1588-1588 |&nbsp; 이메일 : sweethome@naver.com |&nbsp;
		</p>

		<p class="font_8" style="text-align: center; font-size: 16px;">
			서비스 제휴문의 :&nbsp;<span style="text-decoration: underline;"> <a
				href="mailto:partnership@zigbang.com" target="_self">sweethome@naver.com</a></span>
		</p>
		<p class="font_8" style="text-align: center; font-size: 16px;">&nbsp;</p>
		<p class="font_8" style="text-align: center; font-size: 16px;">Copyright
			© KingBacZuu. All Rights Reserved.</p>
	</div>
	<div class='child right'>
		<a href="#"><img
			src="${contextPath}/resources/image/swing.gif"
			style="width: 150px; float: right;" /></a>
	</div>
</div>