<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/userMain.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js">
        function goodsList() {
            location.href = "./goodsList";
        }

        function goodsDetail() {
            location.href = "./goodsDetail";
        }

        function contractList() {
            location.href = "./contractList";
        }

        function QList() {
            location.href = "./QList";
        }
    </script>

</head>

<body>
    <div>
        <h1>마이페이지</h1>
    </div>
 
    <div class="myPageMain">
        <div class="myPageCategory">
            <h2>최근 본 방</h2>
            <button onclick="goodsList()">+</button>
        </div>

        <div>
            <img class="myPageImg" src="#" alt="상품1" onclick="goodsDetail()">
            <img class="myPageImg" src="#" alt="상품2" onclick="goodsDetail()">
            <img class="myPageImg" src="#" alt="상품3" onclick="goodsDetail()">
        </div>

        <hr class="myPageHr">

        <div class="myPageCategory">
            <h2>최근 계약 내역</h2>
            <button id="plus" onclick="contractList()">+</button>
        </div>
        <div>
            <img class="myPageImg" src="#" alt="상품1" onclick="goodsDetail()">
            <img class="myPageImg" src="#" alt="상품2" onclick="goodsDetail()">
            <img class="myPageImg" src="#" alt="상품3" onclick="goodsDetail()">
        </div>
    </div>
</body>

</html>