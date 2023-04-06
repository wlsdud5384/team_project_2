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
    <title>계약관리 페이지</title>
  </head>
  
  <style>
/* Global styles */
.contractList {
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

/* 날짜 검색 */
.search-date {
  display: inline-block; /* block → inline-block으로 변경 */
  margin-bottom: 5px;
  font-size: 14px;
  font-weight: bold;
}

.search-date input[type="date"] {
  width: 150px;
  padding: 5px;
  margin-left: 20px;
  border: 1px solid #ccc;
  border-radius: 3px;
  font-size: 14px;
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
  </style>
  
  <script>
  function goodsDetail() {
		location.href = "./goodsDetail";
	}
  function goodsAdd() {
	}
  function goodsMod() {
	}
  function goodsDel() {
		if(!confirm('삭제하시면 복구할 수 없습니다. \n정말로 삭제하시겠습니까?')){
			return false;
		}
  }
  
  /* 날짜 검색 */
  //날짜 유효성 검사
$('#btnSearch').click(function(){

  var dateFrom = document.getElementById('dateFrom');	//시작일
  var dateTo = document.getElementById('dateTo');	//종료일
  var today = new Date();				//오늘 날짜

  dateFrom = new Date(dateFrom.value);
  var fromYear = dateFrom.getFullYear();
  var fromMonth = dateFrom.getMonth() + 1;
  var fromDay = dateFrom.getDate();

  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
  if (isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)){
    fromYear  = 0;
    fromMonth = 0;
    fromDay   = 0;
  }

	dateFrom = fromYear +'/'+ fromMonth +'/'+fromDay; 

  dateTo = new Date(dateTo.value);
  var toYear  = dateTo.getFullYear();
  var toMonth = dateTo.getMonth() + 1;
  var toDay   = dateTo.getDate();

  //날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리
  if (isNaN(toYear) || isNaN(toMonth) || isNaN(toDay)){
  toYear  = 0;
  toMonth = 0;
  toDay   = 0;
  }

    dateTo = toYear +'/'+ toMonth +'/'+toDay;

  //오늘날짜 날짜 형식으로 지정
  var todayYear  = today.getFullYear(); 	//2020
  var todayMonth = today.getMonth() + 1;    	//06
  var todayDay   = today.getDate();  		//11
  today = todayYear +'/'+ todayMonth +'/'+todayDay;  // 2020/06/11 (형식 지정은 본인 자유)

  //날짜 조회 시, 시작일이 오늘 날짜보다는 크고, 종료일이 시작일보다는 커야하기 때문에 조건을 걸어줌
  if(dateFrom >= today && dateTo >= dateFrom){
  	return true;
  } else {
 	 alert("해당 기간의 조회가 불가능합니다.");
  }
});//click() end
  </script>
  
  <body>
  <div class="contractList">	
    <h1>계약 내역</h1>
    <form>
      <label class="search-label">계약 날짜</label>
		<div class="search-date">
			<input type="date" id="dateFrom" name="from">&nbsp;&nbsp;&nbsp;&nbsp;~ 
			<input type="date" id="dateTo" name="to">
		</div>

		<br><br> 
		<label class="search-label">계약 상태</label>
		<div class="search-wrapper">
			<select class="search" id="type-g" name="type-g">
				<option value="">전체</option>
				<option value="승인">승인</option>
				<option value="미승인">미승인</option>
			</select>
		</div>

		<br><br>
		<label class="search-label">상품 유형</label>
		<div class="search-wrapper">
			<select class="search" id="type-g" name="type-g">
				<option value="">전체</option>
				<option value="아파트">아파트</option>
				<option value="오피스텔">오피스텔</option>
				<option value="주택">주택</option>
			</select>
		</div>

		<br>
      <button class="btn" type="submit" id="searchbtn" style="position: relative;">검색</button>
    </form>
    
    <table style="border:1px solid black;margin-left:auto;margin-right:auto;">
      <thead>
        <tr>
          <th>이미지</th>
          <th>방 정보</th>
          <th>계약자</th>
          <th>계약날짜</th>
          <th>리뷰</th>
          <th>처리상태</th>
          <th>수정</th>
      	  <th>삭제</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><img src="#" alt="상품1" onclick="goodsDetail()"></td>
          <td>3층, 50㎡, 강남구 역삼동</td>
          <td>계약자: bom123</td>
          <td>2023.03.14</td>
          <td>좋아요</td>
          <td><b>계약진행중</b></td>
          <td><button class="btn" type="submit" onclick="goodsMod()">수정하기</button></td>
      	  <td><button class="btn" type="submit" onclick="goodsDel()">삭제하기</button></td>
        </tr>
        <tr>
          <td><img src="#" alt="상품2" onclick="goodsDetail()"></td>
          <td>3층, 50㎡, 강남구 역삼동</td>
          <td>계약자: bom123</td>
          <td>2023.03.14</td>
          <td>좋아요</td>
          <td><b>계약완료</b></td>
          <td><button class="btn" type="submit" onclick="goodsMod()">수정하기</button></td>
      	  <td><button class="btn" type="submit" onclick="goodsDel()">삭제하기</button></td>
        </tr>
        <tr>
          <td><img src="#" alt="상품3" onclick="goodsDetail()"></td>
          <td>3층, 50㎡, 강남구 역삼동</td>
          <td>계약자: bom123</td>
          <td>2023.03.14</td>
          <td>좋아요</td>
          <td><b>계약완료</b></td>
          <td><button class="btn" type="submit" onclick="goodsMod()">수정하기</button></td>
      	  <td><button class="btn" type="submit" onclick="goodsDel()">삭제하기</button></td>
        </tr>
      </tbody>
       
    </table>
    </div>
  </body>
</html>
