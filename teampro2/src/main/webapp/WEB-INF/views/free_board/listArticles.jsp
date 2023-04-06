<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<style>
		body {
			
			margin: 0;
			padding: 0;
		}
		.container {
			max-width: 800px;
			margin: 0 auto;
			padding: 20px;
			background-color: #fff;
			border-radius: 10px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
		}
		h1 {
			margin-top: 0;
			text-align: center;
			color: #191B49;
			font-weight: bold;
			font-size: 40px;
			text-shadow: 1px 1px 0px rgba(255, 255, 255, 0.5);
		}
		table {
			width: 100%;
			border-collapse: collapse;
			margin-top: 30px;
			margin-bottom: 50px;
		}
		tr.header {
			background-color: #191B49;
			height: 50px;
			color: #fff;
			font-weight: bold;
			font-size: 16px;
		}
		tr:not(.header):hover {
			background-color: #f2f2f2;
		}
		td {
			padding: 10px;
			text-align: center;
		}
		td:first-child {
			width: 7%;
		}
		td:nth-child(2) {
			width: 10%;
		}
		td:nth-child(3) {
			width: 50%;
			text-align: left;
		}
		td:nth-child(4) {
			width: 10%;
		}
		td:nth-child(5) {
			width: 6%;
		}
		td:nth-child(6) {
			width: 6%;
		}
		a {
			text-decoration: none;
			color: #191B49;
			transition: color 0.2s ease-in-out;
		}
		a:hover {
			color: #ff6600;
		}
		.write {
			display: block;
			float: right;
			background-color: #191B49;
			color: #fff;
			padding: 10px 20px;
			border-radius: 5px;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.2);
			text-align: center;
			font-weight: bold;
			font-size: 16px;
			margin-bottom: 30px;
			transition: background-color 0.2s ease-in-out;
		}
		.write:hover {
			background-color: #ff6600;
			cursor: pointer;
		}
		.tr1{
			background-color: #08088A;
			color: white;
			font-size: 14px;
			font-weight: bold;
		
		}
	</style>
  <meta charset="UTF-8">
  <title>글목록창</title>
</head>
<script>
	function fn_articleForm(isLogOn,articleForm,loginForm){
	  if(isLogOn != '' && isLogOn != 'false'){
	    location.href=articleForm;
	  }else{
	    alert("로그인 후 글쓰기가 가능합니다.")
	    location.href=loginForm+'?action=/board/articleForm.do';
	  }
	}
	
</script>


<body>
	<h1>자유게시판</h1><br><br>
<table align="center" border="1">
  <tr class="tr1">
     <td >글번호</td>
     <td >작성자</td> 
     <td >제목</td>
     <td >작성일</td>
     <td >조회수</td>
     <td >추천수</td>
  </tr>
<c:choose>		<%--   aricles리스트 갖고와서 널이면 글이 없습니다.나오고 --%>
  <c:when test="${articlesList == null }" >
    <tr  height="10">
      <td colspan="4">
         <p align="center">
            <b><span style="font-size:9pt;">등록된 글이 없습니다.</span></b>
        </p>
      </td>  
    </tr>
  </c:when>			<%-- 리스트에서 널이 아닐때 글이있으면 띄워주게된다.  --%>
  <c:when test="${articlesList != null }" >
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <tr align="center">
	<td width="7%">${articleNum.count}</td>		<%--글번호 --%>
	<td width="10%">${article.member_id }</td>	<%--작성자 아이디 --%>
	<td align='left'>
	  <span style="padding-right:30px"></span>
	   <c:choose>
	      <c:when test='${article.board_id > 1 }'>  
	         <c:forEach begin="1" end="${article.board_id }" step="1">
	                  
	         </c:forEach>
	         											<%-- 제목 --%>
                   <a class='cls1' onclick="click_c" href="${contextPath}/board/viewArticle.do?board_id=${article.board_id}">${article.title}</a>
	          </c:when>
	          <c:otherwise>
	            <a class='cls1' href="${contextPath}/board/viewArticle.do?articleNO=${article.board_id}">${article.title }</a>
	          </c:otherwise>
	        </c:choose>
	  </td>
	  <td  width="10%">${article.new_date}</td> 
	  <td width="6%" id="views">${article.views}</td> 
	  <td width="6%">${article.like_type}</td> 
	</tr>
    </c:forEach>
     </c:when>
    </c:choose>
</table>
	
				<!-- 글쓰기 이동경로 로그인 하지 않았을시 로그인 페이지로 이동한다. -->
<a  class="cls2"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><p style="font-size: 20px; "><b>글쓰기</b></p></a><br><br>
                                                    
			<!--  검색창 -->                                                    
	<select name="search_type" id="search_type" style="height:30px;">
	<option value="sub_memo"> 제목</option>
	<option value="sub_memo"> 조회수</option>
	<option value="sub_memo"> 추천수</option>
	<option value="subject">작성자</option>
	<option value="name">글번호</option>
<!-- 	<option value="csubject">코멘트내용</option> -->
	</select>
	<td class="search-input">
	<span class="default custom01">
	<input type="text" name="keyword" id="keyword" size="15" class="input" style="height:27px !important;">
	<input type="submit" onfocus="blur()" value="검색" style="background-color:#ffffff">
	</span>
	</td>
	
	
</body>
</html>