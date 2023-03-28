<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/side.css">
<style>
.side_s1{background-color: aquamarine;}
</style>

	<!-- 일반사용자 메인페이지 사이드바 -->
<div class="side_s1" style="min-height: 500px;">
	<button class="btnon_s1" onclick="location.href = '#'">마이페이지</button>
	<button class="btnon_s1" onclick="location.href = '#'">회원정보수정</button>
	<button class="btnon_s1" onclick="location.href = '#'">계약 관리</button>
	<button class="btnon_s1" onclick="location.href = '#'">나의 관심목록</button>
	<button class="btnon_s1" onclick="location.href = '#'">문의 관리</button>
	<button class="btnon_s1" onclick="location.href = '#'">쪽지함</button>
	<button class="btnon_s1" onclick="location.href = '#'">회원 탈퇴</button>
</div>