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

p {
  margin-right: 10px;
}

#num {
margin-right:10px; width:110px;
}

input[type="text"],
input[type="password"] {
  width: 35%;
  padding: 10px;
  border: 1px solid #ddd;
  border-radius: 5px;
  margin-top: 10px;
  margin-bottom: 20px;
  font-size: 16px;
}

input[type="button"],
input[type="reset"] {
  padding: 10px 20px;
  margin-top: 20px;
  border: none;
  border-radius: 4px;
  font-size: 13px;
  font-weight: bold;
  background-color: #112d4e;
  color: white;
}

input[type="button"]:hover,
input[type="reset"]:hover {
  border: 1px #112d4e solid; border-radius : 4px;
  border-radius: 4px;
  font-size: 13px;
  font-weight: bold;
  background-color: #fff;
  color: 112d4e;
}

</style>
 
<script type="text/javascript">

/* 수정완료 */
function fn_sub(obj){
	document.getElementById("i_id").disabled=false;
	obj.submit();
}
</script>

</head>
<body>
<h1>회원 정보 수정</h1>
<form name="frm" method="post" action="${contextPath }/memberB/updateMemberB">
		<table align="center">
			<c:if test="${memberB != null }">
			<tr>
				<td><p>아이디</p></td>
				<td><input type="text" name="bp_id" id="i_id" value="${memberB.bp_id }" readonly></td>
			</tr>
			<tr>
				<td><p>비밀번호</p></td>
				<td><input type="password" name="bp_pw" value="${memberB.bp_pw }"></td>
			</tr>
			<tr>
				<td><p>이름</p></td>
				<td><input type="text" name="name" value="${memberB.name }"></td>
			</tr>
			<tr>
				<td><p>이메일</p></td>
				<td><input type="text" name="email" value="${memberB.email }"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="sample6_postcode" name="addr1" value="${memberB.addr1 }" size="10" style="margin-right:20px; width:110px;">
				<input type="button" id="zipcodbtn" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="margin-bottom:30px;"> <br>
				<input type="text" id="sample6_address" name="addr2" value="${memberB.addr2 }"  style="margin-right:10px; width:250px;">
				<input type="text" id="sample6_detailAddress" name="addr3" value="${memberB.addr3 }"></td>
			</tr>
			<tr>
				<td><p>전화번호</p></td>
				<td><input type="text" id="num" name="tel1" value="${memberB.tel1 }">
				<input type="text" id="num" name="tel2" value="${memberB.tel2 }">
				<input type="text" id="num" name="tel3" value="${memberB.tel3 }"></td>
			</tr>
			<tr>
				<td><p>휴대전화</p></td>
				<td><input type="text" id="num" name="hp1" value="${memberB.hp1 }">
				<input type="text" id="num" name="hp2" value="${memberB.hp2 }">
				<input type="text" id="num" name="hp3" value="${memberB.hp3 }"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" onClick="fn_sub(this.form)" value="수정완료" style="margin-right:10px;"><input type="reset"></td>
			</tr>
			
<!-- 우편번호찾기 -->			
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
			</c:if>
		</table>
	</form>
 </body>
</html>
