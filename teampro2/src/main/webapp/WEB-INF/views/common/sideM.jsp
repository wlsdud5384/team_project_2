<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/side2.css">


<style>
.side_M{background-color: white;}
</style>

<!-- 관리자 사이드바 -->
<div class="side_M" style="min-height: 500px; ">
	<button class="btnon_C" onclick="location.href = '${contextPath}/admin/listMembers.do'">회원관리</button>
	<button class="btnon_C" onclick="location.href = '#'">사업자 관리</button>
	<button class="btnon_C" onclick="location.href = '#'">포장이사 사업자관리</button>
	<button class="btnon_C" onclick="location.href = '#'">상품관리</button>
	<button class="btnon_C" onclick="location.href = '#'">계약관리</button>
	<button class="btnon_C" onclick="location.href = '#'">구독관리</button>
	<button class="btnon_C" onclick="location.href = '#'">커뮤니티 관리</button>
	<button class="btnon_C" onclick="location.href = '#'">고객센터 관리</button>
	<button class="btnon_C" onclick="location.href = '#'">블랙리스트 관리</button>
	<button class="btnon_C" onclick="location.href = '#'">쪽지함 관리</button>
	<button class="btnon_C" onclick="location.href = '${contextPath}/admin/dataview.do'">부동산데이터센터</button>
	
	
	
	
</div>