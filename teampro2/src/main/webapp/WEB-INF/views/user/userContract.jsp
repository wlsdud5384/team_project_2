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
    <title>userContract</title>
  </head>
  
  <style>
/* Global styles */
body {
font-size: 16px;
line-height: 1.5;
margin: 0;
padding: 0;
}

/* Form styles */
form {
border: 1px solid #ccc;
border-radius: 4px;
margin: 2rem auto;
max-width: 600px;
padding: 2rem;
}

/* 검색 */
.search-label {
  display: inline-block; /* block → inline-block으로 변경 */
  margin-bottom: 5px;
  font-size: 14px;
  font-weight: bold;
}

.search-wrapper {
  position: relative;
  display: inline-block; /* inline-block으로 변경 */
  width: 150px;
  vertical-align: top; /* 추가: search-label과 상단 정렬 */
  margin-right: 5px; /* 추가: search-label과 오른쪽 간격 */
}

.search {
  width: 150px;
  padding: 5px;
  margin-left: 20px;
  border: 1px solid #ccc;
  border-radius: 3px;
  font-size: 14px;
  appearance: none;
  -webkit-appearance: none;
  -moz-appearance: none;
  background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="10" height="6"><polygon points="0,0 10,0 5,6"/></svg>') no-repeat right center;
  background-size: 10px;
  background-position-x: calc(100% - 5px);
}

.search:hover {
  border-color: #888;
}

/* 테이블 스타일링 */
.table {
  border-collapse: collapse;
  margin-top: 30px;
  justify-content: center;
}

th, td {
  padding: 10px;
  border: 1px solid #ccc;
}

th {
  font-weight: bold;
  background-color: #112d4e;
  color: white;
}

/* 수정, 삭제버튼 */
.btn {
background-color: #112d4e;
border: none;
border-radius: 4px;
color: #fff;
cursor: pointer;
font-size: 1rem;
margin-top: 1rem;
padding: 0.5rem 1rem;
}

.btn:hover {
border-radius: 4px;
font-size: 13px;
font-weight: bold;
background-color: #112d4e;
color: white;
}

/* 상품 등록 버튼 스타일링 */
.row {
  display: flex;
  justify-content: center;
  margin-top: 30px;
}

.col button {
  font-size: 18px;
  padding: 5px 10px;
  background-color: #112d4e;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

.col button:hover {
border-radius: 4px;
font-size: 16px;
font-weight: bold;
background-color: #112d4e;
color: white;
}

  </style>
  
  <script>
  function goodsDetail() {
		location.href = "./goodsDetail";
	}
  function goodsAdd() {
		location.href = "./goodsAdd";
	}
  function goodsMod() {
		location.href = "./goodsMod";
	}
  function goodsDel() {
		if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
			return false;
		}
  }
  </script>
  
  <body>
  	
    <h1>계약내역</h1>
    <form>
		<label class="search-label">거래 유형</label>
		<div class="search-wrapper">
			<select class="search">
				<option value="">전체</option>
				<option value="매매">매매</option>
				<option value="전세">전세</option>
				<option value="월세">월세</option>
			</select>
		</div>

		<br><br>
      <label class="search-label">상품 유형</label>
		<div class="search-wrapper">
			<select class="search">
				<option value="">전체</option>
				<option value="아파트">아파트</option>
				<option value="오피스텔">오피스텔</option>
				<option value="주택">주택</option>
			</select>
		</div>
		
      <br>
      <button class="btn" type="submit">검색</button>
    </form>
    
    <table style="border:1px solid black;margin-left:auto;margin-right:auto;">
      <thead>
        <tr>
          <th>이미지</th>
          <th>상태</th>
          <th>건물이름</th>
          <th>주소</th>
          <th>계약중개사</th>
          <th>계약일</th>

        </tr>
      </thead>
      <tbody>
        <tr>
          <td><img src="#" alt="상품1" onclick="goodsDetail()"></td>
          <td>계약 완료</td>
          <td>목련아파트</td>
          <td>서구 둔산동</td>
          <td>샛별부동산</td>
          <td>2023-03-10</td>
        </tr>
         <tr>
          <td><img src="#" alt="상품1" onclick="goodsDetail()"></td>
          <td>계약 완료</td>
          <td>목련아파트</td>
          <td>서구 둔산동</td>
          <td>샛별부동산</td>
          <td>2023-03-10</td>
        </tr>
         <tr>
          <td><img src="#" alt="상품1" onclick="goodsDetail()"></td>
          <td>계약 완료</td>
          <td>목련아파트</td>
          <td>서구 둔산동</td>
          <td>샛별부동산</td>
          <td>2023-03-10</td>
        </tr>
      </tbody>
      </table>
  </body>
</html>
