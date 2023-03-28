<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${contextPath}/resources/css/side.css">
<style>

</style>

<div class="side_s1" style="min-height: 500px;">
    <button class="btnon_s1" onclick="location.href = '${contextPath}/customer/noticeBoard.do'">공지사항</button>
    <button class="btnon_s1" onclick="location.href = '#''">계약 및 환불 안내</button>
    
    <button class="btnon_s1" onclick="location.href = '${contextPath}/customer/aboutUs'">회사 소개</button>

</div>