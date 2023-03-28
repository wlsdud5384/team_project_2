<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modMember.jsp</title>
<style type="text/css">
	.cls1{
		font-size:40px;
		text-align:center;
	}
	.cls2{
		text-align:center;
	}
	table tr td:nth-child(odd){
		width:200;
	}
	table tr td:nth-child(even){
		width:400;
	}
	table tr td p{
		text-align:right;
	}
	.text_center{
		text-align:center;
		width: 1180px;
	}
	
	
	
	table.type11 {
  border-collapse: separate;
  border-spacing: 1px;
  text-align: center;
  line-height: 1.5;
  margin: 20px 10px;
}
table.type11 th {
  width: 155px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: black;
  background: #F7D5AD ;
}
table.type11 td {
  width: 155px;
  padding: 10px;
  vertical-align: top;
  border-bottom: 1px solid #ccc;
  background: #eee;
}
	

.d1 {
	justify-content: center;
	display: flex;
	align-items: center;
}
.submit:hover {
	color:white;
}

.i1 {
	cursor: pointer;
}

.button {
border:1x solid #FB9696;    /*---테두리 정의---*/
background-Color:#FED7D7;   /*--백그라운드 정의---*/
font:12px 굴림;      /*--폰트 정의---*/
font-weight:bold;   /*--폰트 굵기---*/
color:#ff0080;    /*--폰트 색깔---*/
width:130;height:30;  /*--버튼 크기---*/
}



	
</style>
 
<script type="text/javascript">
/* 회원수정 버튼을 클릭시 fn_sub 실행되어 함수 기능 작동한다.
	그래서 id 를 갖고와서 화면에 수정하시겠습니까?  나오면서 
			확인, 취소 버튼 출력 취소 누를시 걍 취소다
			확인누르면 그다음 회원수정 완료되었습니다. 누르면 db저장되며
			수정된다.
			근데 그게 아니라면 걍 리턴
			그리고 (obj)<-이거는 요소가 속한 양식 요소를 
			참조하는 "this.form" 매개변수가 전달되는거다~~~~~~~~~~~~
			밑에 보면 this.form 이있다다
*/
function fn_sub(obj){
	document.getElementById("i_id").disabled=false;
	if(confirm("회원수정 하시겠습니까?") == true) {
		alert("회원수정 완료되었습니다.")
	}else {
		return;
	}
	obj.submit();
}
			// 여기 밑에는 회원정지시키는 함수
function fn_sub2(obj) {
	// 변수에 넣어줌
	var status_st = document.getElementById("status");
	var id = document.getElementById("i_id");
	
	document.getElementById("i_id").disabled=false;
	if(confirm("회원정지 하시겠습니까?") == true) {
		alert("회원정지 완료되었습니다.")
		obj.action="${contextPath}/admin/stopMember.do";
	}else {
		return;
	}
	obj.submit();
}





</script>

</head>
<body>


<form name="frm" method="post" action="${contextPath }/admin/updateMember.do">

<h1 class="text_center">회원 정보 수정</h1><br>

<div>
	<h2 style="color: #495295;">&nbsp;<b>${member.name } 님의 회원정보 수정</b></h2>
</div>
	
<table class="type11">
	
	<c:if test="${member != null }">
	
  <thead>
	  <tr>
	   
	    <th scope="cols">회원아이디</th>
	    <th scope="cols">비밀번호</th>
	    <th scope="cols">이름</th>
	    <th scope="cols">생년월일</th>
	    <th scope="cols">이메일</th>
	    <th scope="cols">휴대전화</th>
	    
	   </tr>
   
	    <tr>
	    
	    <td><input type="text" name="member_id" id="i_id" value="${member.member_id }" readonly></td>
	    <td><input type="text" name="member_pw" value="${member.member_pw }"></td>
	    <td><input type="text" name="name" value="${member.name }"></td>
	    <td><input type="date" name="member_birth" value="${member.member_birth }"></td>
	    <td style="width: 400px;">
	    <input style="width: 70px;" type="text" name="email1" value="${member.email1 }">@
	    <input style="width: 70px;" type="text" name="email2" value="${member.email2 }">
	    </td>
	    <td>
	    <input style="width: 40px;" type="text" name="hp1" value="${member.hp1 }">-
	    <input style="width: 40px;" type="text" name="hp2" value="${member.hp2 }">-
	    <input style="width: 40px;" type="text" name="hp3" value="${member.hp3 }">
	    </td>
	    
	  </tr>
	  
	   <tr>
	    <th scope="cols">전화번호</th>
	    <th scope="cols">회원상태</th>
	    <th scope="cols">거래금액</th>
	    <th scope="cols">우편주소</th>
	    <th scope="cols">주소</th>
	    <th scope="cols">상세주소</th>
	    
	  </tr>
  
	  <tr>
	    <td>
	    <input style="width: 40px;" type="text" name="tel1" value="${member.tel1 }">-
	    <input style="width: 40px;" type="text" name="tel2" value="${member.tel2 }">-
	    <input style="width: 40px;" type="text" name="tel3" value="${member.tel3 }">
	    </td>
	    
	    <td><input type="text" name="status" value="${member.status }"></td>
	    <td><input type="text" value="0원"></td>
	    <td><input type="text" name="addr1" value="${member.addr1 }"></td>
	    <td><input type="text" name="addr2" value="${member.addr2 }"></td>
	    <td><input type="text" name="addr3" value="${member.addr3 }"></td>
	  </tr>
  
  </thead>

	</c:if>
	
</table>

 <div class="d1">						<!--  수정 누를시 함수 실행된다. 위에 있음 -->
	<input class="button" type="button" onClick="fn_sub(this.form)" value="수정하기">&nbsp;&nbsp;
	 										<!-- 정지를 누르면 실행. -->
	 <input class="button" type="button" id="stop_" onClick="fn_sub2(this.form)"  value="회원정지">&nbsp;&nbsp;
	 
	 <input class="button" type="button" onClick="#" value="회원정지해제">&nbsp;&nbsp;
	<input class="button"  type="reset">
	
 </div>

	
</form>
</body>
</html>