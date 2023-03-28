<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<style>
header {
/* 	background-color: beige; */
}
</style>
<script type="text/javascript">
var loopSearch=true;
function keywordSearch(){
	if(loopSearch==false)
		return;
 var value=document.frmSearch.searchWord.value;
	$.ajax({
		type : "get",
		async : true, //false인 경우 동기식으로 처리한다.
		url : "${contextPath}/goods/keywordSearch.do",
		data : {keyword:value},
		success : function(data, textStatus) {
		    var jsonInfo = JSON.parse(data);
			displayResult(jsonInfo);
		},
		/* error : function(data, textStatus) {
			alert("에러가 발생했습니다."+data); */
		},
		complete : function(data, textStatus) {
			//alert("작업을완료 했습니다");
			
		}
	}); //end ajax	
}


function displayResult(jsonInfo){
	var count = jsonInfo.keyword.length;
	if(count > 0) {
	    var html = '';
	    for(var i in jsonInfo.keyword){
		   html += "<a href=\"javascript:select('"+jsonInfo.keyword[i]+"')\">"+jsonInfo.keyword[i]+"</a><br/>";
	    }
	    var listView = document.getElementById("suggestList");
	    listView.innerHTML = html;
	    show('suggest');
	}else{
	    hide('suggest');
	} 
}

function select(selectedKeyword) {
	 document.frmSearch.searchWord.value=selectedKeyword;
	 loopSearch = false;
	 hide('suggest');
}
	
function show(elementId) {
	 var element = document.getElementById(elementId);
	 if(element) {
	  element.style.display = 'block';
	 }
	}

function hide(elementId){
   var element = document.getElementById(elementId);
   if(element){
	  element.style.display = 'none';
   }
}





</script>
<html>
<link rel="stylesheet" href="${contextPath}/resources/css/header.css">
<body>
	<header>

		<nav>
			<ul>		<!--  메인로고 이미지 클릭시 메인페이지로 이동 -->
				<a href="${contextPath}/main.do">
				<img src="${contextPath}/resources/image/main_logo.png" /></a>
				
				<li><a href="#">신축분양</a></li>
				<li><a href="#">매매/전월세</a></li>
				<li><a href="#">부동산/포장이사</a></li>
				<li><a href="#">관심목록</a></li>
				<li><a href="#">커뮤니티</a></li>
				<li><a href="${contextPath}/customer/customerMain.do">고객센터</a></li>
				<li><a href="#">날씨정보</a></li>
				<%--  여기부터 헤더 바뀌는건데 아이디별로 누가 들어왔는지 헤더 부분에 나옴 알긋냐--%>
            <c:choose>
               <c:when test="${isLogOn == true}">      <%-- 아이디 true 비교해서 맞으면 밑으로내려가 실횅 --%>
                  <h2>
                     <c:choose>                  <%-- 로그인한 사람 이름 갖고와서 환영 --%>
                        <c:when test="${not empty member}">${member.name} 님! 로그인을 환영합니다.</c:when>
                        <c:when test="${not empty name}">${name} 님! 로그인을 환영합니다.</c:when>
                        <c:otherwise>${memberB.name} 님! 로그인을 환영합니다.</c:otherwise>
                     </c:choose>
                  </h2>
                  <br>      <%-- 여기는 관리자 로그인시 관리자 id admin 일경우에 true 되므로 밑으로내려가 실행되어 헤더에 관리자 페이지 출력--%>
                  <c:if test="${isLogOn==true and member.member_id =='admin' }">
                     <a href="${contextPath}/admin/listMembers.do">관리자페이지</a>
                  </c:if>
                                 <%-- 어드민으로 안들어왔을때 는 마이페이지가 헤더에 출력 --%>
                  <c:if test="${isLogOn==true and member.member_id !='admin' }">
                     <c:choose>      <%-- not empty = 값이 비어있지않을때 true 그래서 마이페이지  --%>
                        <c:when test="${not empty member or not empty name}">
                           <a href="${contextPath}/user/userMain.do">마이페이지</a>
                        </c:when>
                        <c:otherwise>      <%--choosw 조건에맞으면 들어가지만 그게아니라면 otherwise  --%>
                           <a href="${contextPath}/memberB/myPageMainB">사업자페이지</a>
                        </c:otherwise>
                     </c:choose>
                  </c:if>
                  
                  <br>
                  <br>
                  <c:if test="${not empty member or not empty memberB}">
                  <a href="${contextPath}/member/logout.do">로그아웃</a>
                  </c:if>
                  <c:if test="${not empty name}">
                  <a href="https://kauth.kakao.com/oauth/logout?client_id=0277d6bc4e92f1576c2507eec6edcbdb&logout_redirect_uri=http://localhost:8080/sweet/member/logout.do">로그아웃</a>
                  </c:if>
               </c:when>
               
               <c:otherwise>
                                                   <%-- 로그인 했을때 .do 실행 --%>                              
                  <button class="btnon" method="POST"                        
                     onclick="location.href = '${contextPath}/member/loginForm.do'">로그인</button>
                                 <!-- 회원가입 했을때 .do 실행 -->
                   <button class="btnon" type="submit" method="POST" 
                      onclick="location.href = '${contextPath}/member/memberForm.do'">회원가입</button>
                       
               </c:otherwise>
            </c:choose>



			</ul>
		</nav>

	</header>
</body>
</html>