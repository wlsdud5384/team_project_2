<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>

<script>
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

<style>
body { overflow: auto; height: 100vh;} /* 스크롤, 화면세로로 길게  */
.myPageMain {
    margin: 0px; width: 1000px; float: left; padding: 0px;
}

.myPageCategory {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    flex-wrap: wrap;
    gap: 20px;
}

.myPageCategory h2 {
    font-size: 18px;
    font-weight: bold;
    color: #333;
    margin-top: 40px;
}

.myPageCategory button {
  font-size: 16px;
  padding: 5px 10px;
  background-color: #112d4e;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 5px;
}

.myPageImg {
    display: inline-block;
    width: 200px;
    height: 200px;
    object-fit: cover;
    cursor: pointer;
    flex: 1;
    margin-bottom: 50px;
}

.myPageImg + .myPageImg {
    margin-left: 100px;
}


.myPageHr {
    margin: 20px 0;
    border: none;
    border-top: 1px solid #ccc;
}


</style>

</head>
<body>
    <div>
        <h1>마이페이지</h1>
    </div>
    
<div class="myPageMain">
    <div class="myPageCategory">
        <h2>최근 인기 매물</h2>
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
    
    <hr class="myPageHr">
    
    <div class="myPageCategory">
        <h2>최근 문의 내역</h2>
        <button id="plus" onclick="QList()">+</button>
    </div>
    <div>
        <img class="myPageImg" src="#" alt="상품1" onclick="goodsDetail()">
        <img class="myPageImg" src="#" alt="상품2" onclick="goodsDetail()">
        <img class="myPageImg" src="#" alt="상품3" onclick="goodsDetail()">
    </div>
</div>
</body>
</html>