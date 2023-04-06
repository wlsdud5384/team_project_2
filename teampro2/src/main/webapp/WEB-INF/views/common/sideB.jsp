<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/side.css">


<div style="min-height: 500px; ">
	<button class="btnon_s1" onclick="location.href = 'myPageMainB'">마이페이지</button>
	<button class="btnon_s1" onclick="location.href = 'modMemberB?bp_id=${memberB.bp_id}'">회원정보수정</button>
	<button class="btnon_s1" onclick="location.href = 'contractList'">계약 관리</button>
	<button class="btnon_s1" onclick="location.href = 'goodsList'">상품 관리</button>
	<button class="btnon_s1" onclick="location.href = 'QList'">문의 관리</button>
	<button class="btnon_s1" onclick="location.href = '#'">쪽지함</button>
	<button class="btnon_s1" onclick="location.href = '${contextPath}/memberB/memberDeleteViewB.do'">회원 탈퇴</button>
</div>