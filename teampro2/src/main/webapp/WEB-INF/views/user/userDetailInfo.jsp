<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">
    <title>userDetailInfo</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/userDetail.css">
    <script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
    function execDaumPostcode() {
  	  new daum.Postcode({
  	    oncomplete: function(data) {
  	      // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

  	      // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
  	      // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
  	      var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
  	      var extraRoadAddr = ''; // 도로명 조합형 주소 변수

  	      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
  	      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
  	      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
  	        extraRoadAddr += data.bname;
  	      }
  	      // 건물명이 있고, 공동주택일 경우 추가한다.
  	      if(data.buildingName !== '' && data.apartment === 'Y'){
  	        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
  	      }
  	      // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
  	      if(extraRoadAddr !== ''){
  	        extraRoadAddr = ' (' + extraRoadAddr + ')';
  	      }
  	      // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
  	      if(fullRoadAddr !== ''){
  	        fullRoadAddr += extraRoadAddr;
  	      }

  	      // 우편번호와 주소 정보를 해당 필드에 넣는다.
  	      document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
  	      document.getElementById('roadAddress').value = fullRoadAddr;
  	      document.getElementById('jibunAddress').value = data.jibunAddress;

  	      // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
  	      if(data.autoRoadAddress) {
  	        //예상되는 도로명 주소에 조합형 주소를 추가한다.
  	        var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
  	        document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

  	      } else if(data.autoJibunAddress) {
  	          var expJibunAddr = data.autoJibunAddress;
  	          document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
  	      } else {
  	          document.getElementById('guide').innerHTML = '';
  	      }
  	      
  	     
  	    }
  	  }).open();
  	  
    var value=document.frmSearch.searchWord.value;
    $.ajax({
    	type : "get",
    	async : true, //false인 경우 동기식으로 처리한다.
    	url : "/sweet.goods/keywordSearch.do",
    	data : {keyword:value},
    	success: function(data, textStatus) {
    		var jsonInfo = JSON.parse(date);
    		displayResult(jsonInfo);
    	},
    	/*error:function(data, textStatus) {
    	alert("에러가 발생했습니다."+data);
		},
		  */
    	complete : function(data,textStatus) {
    		//alert("작업을 완료했습니다");
   		}
     }); //end ajax
  }   
    </script>
    
    <!-- 추가 -->
 	<script>   
    function fn_sub(obj){
	document.getElementById("i_id").disabled=false;
	obj.submit();
}
    </script>
    
</head>

<body>

    <%-- 기본 정보 --%>
    <div class="d-div" style="padding:20px;">
        <div class="sign">
			
            <h3>기본정보</h3>
			
            <hr class="hr1">
            <div class="sign-text">
                <h5 style="line-height:3em;">아이디<span style="color:red;">*</span></h5>
            </div>
            <div class="sign-input">
                <input name="member_id" type="text" class="ia" value="${member.member_id }" disabled />
                (영문 소문자/숫자 , 4~16자)
            </div>

            <hr class="hr2">
            <div class="sign-text">
                <h5 style="line-height:2.5em;">비밀번호<span style="color:red;">*</span></h5>
            </div>
            <div class="sign-input">
                <input name="member_pw" class="ia" value="${member.member_pw }" />(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
            </div>

        
            <hr class="hr2">
            <div class="sign-text">
                <h5 style="line-height:2.5em;">이름<span style="color:red;">*</span></h5>
            </div>
            <div class="sign-input">
                <input name="name" class="ia" value="${member.name }" />
            </div>
             <hr class="hr2">
			 <div class="sign-text">
                <h5 style="line-height:2.5em;">이메일<span style="color:red;">*</span></h5>
            </div>
            <div class="sign-input">
                <input name="name" class="ia" value="" />
            </div>
            <hr class="hr2">
            <div class="sign-text">
                <h5 style="line-height:8.5em;">주소<span style="color:red;">*</span></h5>
            </div>
            <div class="sign-input">
                <input type="text" name="zipcode" id="zipcode" class="ib" value="" />&nbsp;-&nbsp;
				  
                <a class="d-button" href="javascript:execDaumPostcode()" type="text">우편번호</a>
                <br>
                <input name="addr1" id="roadAddress" value="${member.addr1 }" class="ia" style="margin-top:10px; width:300px;"> 기본주소
                <br>
                <input name="addr2" value="${member.addr2 }" class="ia" style="margin-top:10px; width:300px;"> 상세주소
                
            </div>

            <hr class="hr2">
            <div class="sign-text">
                <h5 style="line-height:1.7em;">일반전화</h5>
            </div>

            <div class="sign-input">
            
               
    <select>
      <option>02</option>
      <option>042</option>
    </select>
    &nbsp;-&nbsp;

                <input name="tel1" value="${member.tel1 }" class="ib"> &nbsp;-&nbsp;
                <input name="tel2" value="${member.tel2 }" class="ib">
            </div>

            <hr class="hr2">
            <div class="sign-text">
                <h5 style="line-height:1.7em;">휴대전화<span style="color:red;">*</span></h5>
            </div>

            <div class="sign-input">
                <select>
                    <option>010</option>
                    <option>011</option>
                    <option>016</option>
                </select>
                &nbsp;-&nbsp;
                <input name="hp1" value="${member.hp1 }" class="ib">
                &nbsp;-&nbsp;
                <input name="hp2" value="${member.hp2 }" class="ib">
            </div>

            <hr class="hr2">
            <h3 style="line-height:2em;">추가정보</h3>
            <hr class="hr1">
            <div class="sign-text">
                <h5>생년월일<span style="color:red;">*</span></h5>
            </div>

            <div class="sign-input">
                <input name="member_birth" value="${member.member_birth }" class="ia">

                <input type="radio" name="radio">
                <h5 style="padding:0px; margin-right:20px;">양력</h5>
                <input type="radio" checked name="radio">
                <h5 style="padding:0px;">음력</h5>
            </div>
            <hr class="hr2">
        </div>
    </div>


    <%--정보 수정 버튼 --%>
    <div class="d-div">
        <div class="sign-button">
            <a class="d-button">
            <input type="button" onClick="fn_sub(this.form)" value="수정하기"></a>
        </div>
    </div>

</body>

</html>