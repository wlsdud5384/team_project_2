<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />



<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
   <meta charset="UTF-8">
   <title>글보기</title>
  <style>
 body {
  font-family: Arial, sans-serif;
  
}

h1 {
  font-size: 36px;
  margin-top: 50px;
  margin-bottom: 50px;
  color: #555;
  text-align: center;
}

/* Tables */
table {
  width: 100%;
  max-width: 800px;
  margin: 0 auto;
  border-collapse: collapse;
  background-color: #fff;
  box-shadow: 0px 0px 10px #c0c0c0;
  border-radius: 5px;
  overflow: hidden;
}

th,
td {
  border: 1px solid #c0c0c0;
  padding: 10px;
  font-size: 18px;
  text-align: left;
  
/*   vertical-align: top; */
}

th {
  background-color: #ff9933;
  color: #fff;
}

/* Form inputs */
input[type="text"],
textarea {
  width: 100%;
  padding: 5px;
  margin-top: 5px;
  margin-bottom: 5px;
  border: 1px solid #c0c0c0;
  border-radius: 3px;
  font-size: 18px;
  box-sizing: border-box;
}

input[type="text"]:disabled,
textarea:disabled {
  background-color: #f5f5f5;
  color: #666;
}

input[type="submit"],
input[type="button"],
.btn-upload {
  border: none;
  background-color: #08298A;
  color: #fff;
  font-size: 18px;
  padding: 10px;
  border-radius: 3px;
  cursor: pointer;
  transition: background-color 0.2s;
  margin-right: 10px;
  display: inline-block;
  width: auto;
  min-width: 100px;
}

input[type="submit"]:hover,
input[type="button"]:hover,
.btn-upload:hover {
  background-color: #ffa64d;
}

input[type="file"] {
  display: none;
}

/* Preview image */
#preview {
  max-width: 800px;
  margin-top: 10px;
}

/* Error messages */
.error {
  color: #ff0000;
  font-size: 16px;
  margin-top: 5px;
}

/* Button group */
.btn-group {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.btn-group button {
  margin: 0 10px;
}

.post-id {
  font-size: 0.8em;
  margin-right: 5px;
}

.post-author {
  font-size: 0.8em;
  margin-right: 10px;
}

  </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     
   				/* 취소하면 돌아가는 함수 */
   	 function backToList(obj){
	    obj.action="${contextPath}/board/listArticles.do";
	    obj.submit();
     }
 				/*  수정하기함수 */
     function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 //document.getElementById("tr_btn_modify").style.display="block";
		 //document.getElementById("tr_btn").style.display="none";
	 }
	 			/* 수정반영하기 함수 */
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board/modArticle.do";
		 obj.submit();
	 }
	 		/* 삭제하기 함수  */
	 function fn_remove_article(url,articleNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value", articleNO);
		 
	     form.appendChild(articleNOInput);
	     document.body.appendChild(form);
	     form.submit();
	 
	 }
	 			/* 답글쓰기 함수 */
	 function fn_reply_form(url, parentNO){
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);
	     var parentNOInput = document.createElement("input");
	     parentNOInput.setAttribute("type","hidden");
	     parentNOInput.setAttribute("name","parentNO");
	     parentNOInput.setAttribute("value", parentNO);
		 
	     form.appendChild(parentNOInput);
	     document.body.appendChild(form);
		 form.submit();
	 }
	 
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>
<body>
	<h1>자유게시판</h1><br><br>
  <form name="frmArticle" method="post"  action="${contextPath}"  enctype="multipart/form-data">
  <table  align="center">
  <tr>
<!--    <td > -->
<!--       글번호 -->
<!--    </td> -->
<%--    <td style="height: 5px;">				 글번호인뎅 --%>
<%--     <input type="text" value="${article.board_id }"  disabled /> --%>
<%--     <input type="hidden" name="board_id" value="${article.board_id}"  /> --%>
<!--    </td> -->
  </tr>
  <tr>
    <td >
      작성자
   </td>
   <td>				<%-- 작성자 아이디이고 --%>
    <input type=text value="${article.member_id }" name="member_id"  disabled />
   </td>
  </tr>
  <tr>
    <td  >
      제목 
   </td>
   <td >				<%-- 제목이고 --%>
    <input type=text value="${article.title }"  name="title"  id="i_title" disabled />
   </td>   
  </tr>
  <tr>
   <td >
      등록일
   </td>
	   <td>			<%--등록인 나오고 --%>
	    <input type=text value="<fmt:formatDate value="${article.new_date}" />" disabled />
	   </td>   
  </tr>
  <tr>
     <td >
       내용 
    </td> 
   <td>					<%-- 내용이고 --%>
    <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />${article.content }</textarea>
    
   </td><br> 
  </tr>
 					<%-- 이미지 값이 있으면 이미지를 표시한다. 
 					--%>
<c:if test="${not empty article.img1 && article.img1!='null' }">  
<tr>
    <td  rowspan="2">이미지</td>
    
   <td>						<%-- 여기는 원래 이미지 파일 이름 저장하는거다 --%>
    <input type="hidden" name="originalFileName" value="${article.img1 }"/>
    			<%--여기밑에는 파일다운로드 컨트롤러 서블릿에 이미지 파일 이름과 글 번호를 전홍해 이미지를 <img>태그에 표시--%>
    <img src="${contextPath}/download.do?board_id=${article.board_id}&imageFileName=${article.img1}" id="preview" /><br>
   </td> 
     
  </tr>  
  <tr>
    <td>		<%-- 이미지 인거같고 맞다--%>
<!--        <input type="file" name="imageFileName" id="i_imageFileName"  onchange="readURL(this);" /> -->
    </td>
  </tr>
 </c:if>
  
  <tr>
  <td width="150" align="center"/>
    
<!--   <tr   id="tr_btn_modify"  > -->
<!--     <td class="td_1" colspan="2"   align="center"  bgcolor="#A9BCF5"> -->
<!--         <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  > -->
<!--           <input type=button value="취소"  onClick="backToList(frmArticle)"> -->
<!--     </td>    -->
 </tr>
   
 <tr  id="tr_btn"    >
  
  <td colspan="2" align="center" >		<%-- 목록 추천 --%>
<%--     <input type=button value="수정하기" onClick="fn_enable(this.form)">	 --%>
<%--      <input type=button value="삭제하기" onClick="fn_remove_article('${contextPath}/board/removeArticle.do', ${article.board_id})"> --%>
     <input type=button value="목록으로"  onClick="backToList(this.form)">
      <input type=button value="추천"  onClick="fn_reply_form('${contextPath}/board/replyForm.do', ${article.board_id})">
  </td>
 </tr>
</tr>
 </table>
 </form>
</body>
</html>