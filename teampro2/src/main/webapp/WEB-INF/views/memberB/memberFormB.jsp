<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false"
    %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
    <%
   request.setCharacterEncoding("UTF-8");
	%> 
 
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=3.0">

<title>회원가입</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto&display=swap');
@import url('https://fonts.googleapis.com/css?family=Oswald&display=swap');
@import url('https://fonts.googleapis.com/css?family=PT+Serif&display=swap');
@import url('https://fonts.googleapis.com/css?family=Averia+Serif+Libre&display=swap');
@import url('https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,500,700&display=swap');

body {  
 font-family: 'Noto Sans KR', sans-serif;
font-size: 0.8em; 
line-height: 1.5em;   
margin: 0px;
color: #666;
}  

.h1 {
	text-align:center;
	width:1200px;
	margin-top: 30px;
	margin-left: 20px;
	margin-bottom: 50px;
	font-size: 30px;
	padding-bottom: 20px;
	
}
  
h2 {  
   
line-height: 0.5em;  
color: #000;  
 font-family: 'Noto Sans KR', sans-serif;
display:inline;
}  
  
h3 {  
font-size: 4em;   
line-height: 0.5em;  
color: #000;
 font-family: 'Noto Sans KR', sans-serif;
 display:inline;
}  
  
h4 {  
font-size: 3em;   
line-height: 0.5em;  
color: #000;
 font-family: 'Noto Sans KR', sans-serif;
  display:inline;
}  
  
h5 {  
font-size: 2em;   
line-height: 0.1em;  
color: #000;  
 font-family: 'Noto Sans KR', sans-serif;
  display:inline;
}  
  
small {
font-size: 0.5em;   
line-height: 1.0em;  
color: #000;  
display: block;
}
  
a{color:#000; text-decoration:none}  /* a:link a tag 기본 */
a:hover {color:#000}   /* 마우스오버 link*/
a:active {color:#000}  /* 선택된 link*/
a:visited {color:#000}

/*d*/
body{background-color:#fff;
     margin:0px;
}
ul li {
list-style: none;/*텍스트가로정렬*/
display: inline;
}
/* 버튼 기본설정*/
.d-button{color:#000;
         text-transform:uppercase;
         padding: 10px 20px;
         margin: 10px 0px;
         display: inline-block;
         background-color: #fff;
}

/*회원구분+가입양식*/
.sign{
  border:0px solid blue;
  width:1200px;
  margin:0 auto;
  
}
.sign h3{
  font-size:1.5em;  
  padding:20px;
  line-height:2em;

}
.sign h5{
  font-size: 1.2em;
  padding:20px;
  line-height:2em;
  
}
.hr1{
  margin:20px auto 10px; border:1px solid black;
}
.hr2{
  margin:15px auto 15px;
}
.sign-text{
  border:px solid red;
  float:left;
  
}
.sign-input{
  border:0px solid black;
  width:800px;
  margin: auto;
  padding:0px;
  
}
.sign-input .d-button{
  padding:0px;
  margin:0px;
  border:1px solid #ccc;
  width:50px;
  height:15px;
  position:relative;
  top:2px;
  line-height:1em;
  cursor: pointer;
}
.ia{
  padding:10px;
  margin-right:15px;
}
.ib{
  padding:6px;
  width:50px;
  height:15px;  
}
.sign select{
  padding:6px;
}

/*체크박스 설정*/
input[id="cb1"] + label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
  position:relative;
  top:5px;
  left:5px;
  margin-right:8px;
}

input[id="cb1"]:checked + label {
   background-color: #666666;
}

input[id="cb1"] {
   display: none;
}
input[id="cb2"] + label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
  position:relative;
  top:5px;
  left:5px;
  margin-right:8px;
}

input[id="cb2"]:checked + label {
   background-color: #666666;
}

input[id="cb2"] {
   display: none;
}
input[id="cb3"] + label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
  position:relative;
  top:5px;
  left:5px;
  margin-right:8px;
}

input[id="cb3"]:checked + label {
   background-color: #666666;
}

input[id="cb3"] {
   display: none;
}
input[id="cb4"] + label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
  position:relative;
  top:5px;
  left:5px;
  margin-right:8px;
}

input[id="cb4"]:checked + label {
   background-color: #666666;
}

input[id="cb4"] {
   display: none;
}
input[id="cb5"] + label {
   display: inline-block;
   width: 20px;
   height: 20px;
   border: 1px solid #666;
   cursor: pointer;
  position:relative;
  top:5px;
  left:12px;
  margin-right:15px;
}

input[id="cb5"]:checked + label {
   background-color: #666666;
}

input[id="cb5"] {
   display: none;
}

/*회원가입버튼*/
.sign-button{
  border:0px solid blue;
  width:1200px;
  margin:0 auto;
  text-align:center;
}
.sign-button .d-button{
  background-color:#cccc;
  padding:10px 30px;
  margin-right:40px;
  color:#222;
  font-size:1.1em;
  font-weight:bold;
  cursor: pointer;
  margin-top:30px;
}
.sign-button .d-button:hover{
  background-color:#222;
  color:#fff;
  font-weight:normal;
}



</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

			<!-- 우편 API 다 이건  --> 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>

		/* 여기부터 우편번호 갖고오는 API 다.   */
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
	  
	}
	
	/* 여기부터는 ID 중복체크하는 부분  */
	function fn_overlapped(){		//중복체크 여부 함수 
    var _id=$("#_bp_id").val();		//_멤버아이디
    if(_id=='' || _id.length == 0){		//if 넣어서 id 길이 비교하는데 0 이냐 0이면 밑으로들어감
   	 alert("ID를 입력하세요");			//이게 실행됨 입력하라고 뜸
   	 return;					// 리턴해준당
    }
    $.ajax({		//ajax 쓰는데
       type:"post",		//이건 타입 (get, post put 등 타입을말함)
       async:false,		// 동기화, 비동기화 여부인데 (default : true 로 되어있음) 지금은 펄스
       url:"${contextPath}/memberB/overlappedB.do",   // 요청할 서버 url 이다
       dataType:"text",		// 데이터 타입 (html, xml, json, text 등등) json 으로바꿔봄(03.21오전) -> 다시 원상복기 03.21 11:20
       data: {bp_id:_id},	// 보낼 데이터 (object, String, Array 등)
       success:function (data, textStatus){		// 03.21오전 response로 바꿈 요청 성공시 실행할 이벤트 지정인가? 그런듯?아마?아닐수도
          if(data == ''){		// 조건식 바꿨다!!제발제바라라아아 이건 parseInt() 개수가 0보다 크면 이미 사용중인 id 이니까 오류메시지 출력하게한거다!!!
        	  					// 그니까 data 가 직접친 id 인데 비교를해 '' 비어있는 문자면?? 그 디비에 없는 아이디니까 참으로 들어오게된다.
       	    alert("사용할 수 있는 ID입니다.");
       	    $('#btnOverlapped').prop(true);
       	    $('#_bp_id').prop(true);
       	    $('#bp_id').val(_id);
       	  
          }else{
        	  alert("사용할 수 없는 ID입니다.");
          }
       },
       error:function(data,textStatus){
    	   alert("에러가 발생했습니다.");
       },
       complete:function(data,textStatus){
         // alert("작업을 완료했습니다.");
       }
    });  //end ajax	 
 }	
	
	
			/* 여기서부터 비밀번호 유효성 검사다...........  */
	function joinform_check() {
		//변수에 담아주기
			
		  var id = document.getElementById("_bp_id");
		  var pwd = document.getElementById("pwd");
		  var repwd = document.getElementById("repwd");
		  var name_ = document.getElementById("name_");
		  
		  
		  if(id.value == "") {	//입력값이 없을때 밑으로 경고창뜬다..후..
			  alert("아이디를 입력하시고 중복체크를 눌러주세요.");
			  id.focus();		// 커서가 깜빡이는 현상 한거다 이거 
			  return false;		// 펄스로 한건 반환할때 아무것도 반환 안되게 
		  }
		  
		  
		  if (pwd.value == "") {//입력값이 없을때 밑으로 경고창뜬다..후..
		    alert("비밀번호를 입력하세요.");
		    pwd.focus();
		    // 여기서 db에 값이 안들어가게끔 어떻게 못하나!!!!!!!!!
		    
		    return false;
		  };

		  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
		  var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

		  if (!pwdCheck.test(pwd.value)) {	//입력값이 저위의 영문자 숫자 특수조합 으로 해야하는데 아니라면 밑으로 경고창뜬다..후..
		    alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~25자리 사용해야 합니다.");
		    pwd.focus();
		    return false;
		  };
		  if (repwd.value !== pwd.value) {	// 비번이 일치하지 않을때 조건식
		    alert("비밀번호가 일치하지 않습니다..");
		    repwd.focus();
		    return false;
		  };
		  if(name_.value == "") { 		//이름 입력안하면이거다.
			 alert("이름을 입력하세요")		//입력해라
			 name_.focus();
		  	 return false;
		  }
	}


	function emailCheck(val){
		var obj = document.getElementById("email2");
		if(val == "email") {	// 직접입력 선택한 경우인지 확인하는
			obj.value = "";
			obj.readOnly = false;
			obj.focus();
		} else {
			obj.value = val;
			obj.readOnly = true;
		}
	}
	
	
	
	


</script>



</head>

<body> 		<!-- onsubmit 이건 submit 양식 이벤트 발생할때 동작을 지정하는데 return -> 함수명 써준다면 false든 true 든 넣어서 보낼수있다. -->
<form action="${contextPath}/memberB/addMemberB.do" onsubmit="return joinform_check();" method="post">
	<h1 class="h1">회원가입</h1>
  <div class="d-div" style="padding:20px;">
  	
  <div class="sign">
    <h3 style="margin-right:15px;">회원구분</h3><h5 style="font-size: 14px;"><b>사용자</b></h5>
    
    	<a href="#"><h5  style="margin-left: 35px; ">사업자 회원</h5></a>
    	<<- 사업자회원가입시 클릭하세요.!!

     	
     
 
    
    
    <hr class="hr1">
    <br>
    <h3>기본정보</h3>
     <hr class="hr1">
   <div class="sign-text">
    <h5 style="line-height:3em;">아이디<span style="color:red;">*</span></h5>
    </div>
    <!-- 여기밑에 아이디 버튼 input 타입이다.  -->
    <div class="sign-input">
      <input type="text" name="_bp_id" id="_bp_id" class="ia"/>
      <input type="hidden" name="bp_id" id="bp_id" />
      
      <input type="button" id="btnOverlapped" value="중복체크" onClick="fn_overlapped()"/>
      (영문 소문자/숫자 , 4~16자)
    </div>
    
    <hr class="hr2">
    <div class="sign-text">
     <h5 style="line-height:2.5em;">비밀번호<span style="color:red;">*</span></h5>
    </div>
    <div class="sign-input"><!-- 이 바로밑이 비밀번호 인풋 타입  -->
    <input type="password" name="bp_pw" id="pwd" class="ia"/>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
    </div>
    <hr class="hr2">
    <div class="sign-text">
     <h5 style="line-height:2.5em;">비밀번호확인<span style="color:red;">*</span></h5>
    </div>
    <div class="sign-input"><!-- 이 바로밑이 비밀번호 확인 인풋 타입 -->
    <input type="password" name="bp_pw2" id="repwd"  class="ia"/>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
    </div>
    <hr class="hr2">
    <div class="sign-text">
     <h5 style="line-height:2.5em;">이름<span style="color:red;">*</span></h5>
    </div>
    <div class="sign-input">
      <!-- 바로밑 이름 인풋 타입  -->
    <input type="text" name="name" id="name_" class="ia"/>
    </div>
    
    <hr class="hr2">
    <div class="sign-text">
     <h5 style="line-height:2.5em;">사업자 이름<span style="color:red;">*</span></h5>
    </div>
    <div class="sign-input">
      <!-- 바로밑 이름 인풋 타입  -->
    <input type="text" name="dp_name" id="dp_name_" class="ia"/>
    </div>
    
    <hr class="hr2"><!-- 여기부터 이메일 -->
    <div class="sign-text">
     <h5 style="line-height:2.5em;">이메일<span style="color:red;">*</span></h5>
    </div>
    
    <div class="sign-input">
      <!-- 바로밑 이름 인풋 타입  -->
    <input style="width: 150px;" type="text" id="email" name="email" class="ia"/>
    <select  id="email3" onChange="emailCheck(this.options[this.selectedIndex].value)" title="직접입력" >
    	<option value="non">직접입력</option><!-- 옵션 직접입력 해놓은것 -->
			<option value="hanmail.net">hanmail.net</option>
			<option value="naver.com">naver.com</option>
			<option value="yahoo.co.kr">yahoo.co.kr</option>
			<option value="hotmail.com">hotmail.com</option>
			<option value="paran.com">paran.com</option>
			<option value="nate.com">nate.com</option>
			<option value="google.com">google.com</option>
			<option value="gmail.com">gmail.com</option>
			<option value="empal.com">empal.com</option>
			<option value="korea.com">korea.com</option>
			<option value="freechal.com">freechal.com</option>
    </select>&nbsp;&nbsp; <input type="checkbox" name="emailsts_yn" value="Y" checked /> 발송하는 e-mail을 수신합니다.
    									<!-- 체크박스 수신동의 위에다 ^^^^^^^^^^^^^^^^^^^^^^ -->
    </div>
    
    <hr class="hr2">
    <div class="sign-text">
    <h5 style="line-height:8.5em;">주소<span style="color:red;">*</span></h5>
    </div>
    <div class="sign-input">		<!-- 주소입력란인데 우편번호 눌렀을때 불러오게끔 해놓음 여기 바로밑에부터임  -->
     <input type="text" id="zipcode" name="addr1" size="10" >&nbsp;-&nbsp;
    <a href="javascript:execDaumPostcode()" class="d-button">우편번호</a>
    <br><br>
    <input type="text" id="roadAddress"  name="addr2" size="50" style="height: 30px;"/> 기본주소
    <br><br>
    <input type="text"  name="addr3" size="50" style="height: 30px;" />
		 상세주소
    </div>
    <hr class="hr2">
    <div class="sign-text">
    <h5 style="line-height:1.7em;">일반전화</h5>
    </div>
    <div class="sign-input">
    <select name="tel1">
      <option>02</option>
      <option>051</option>
      <option>053</option>
      <option>032</option>
      <option>062</option>
      <option>042</option>
      <option>052</option>
      <option>044</option>
      <option>031</option>
      <option>033</option>
      <option>043</option>
      <option>041</option>
      <option>063</option>
      <option>061</option>
      <option>054</option>
      <option>055</option>
      <option>064</option>
    </select>
    &nbsp;-&nbsp;
    <input type="text" name="tel2" class="ib"> &nbsp;-&nbsp;
    <input type="text" name="tel3" class="ib">   
    </div>
    <hr class="hr2">
    <div class="sign-text">
    
     <h5 style="line-height:1.7em;">휴대전화<span style="color:red;">*</span></h5>
    </div>
    <div class="sign-input">
    <select name="hp1">
      <option>010</option>
      <option>011</option>
      <option>016</option>
    </select>
    <!-- ======================================= -->
    &nbsp;-&nbsp;
    <input type="text" name="hp2" class="ib">
    &nbsp;-&nbsp;
     <input type="text" name="hp3" class="ib">&nbsp;&nbsp;<input type="checkbox"	name="smssts_yn" value="Y" checked /> SMS 소식을 수신합니다.
    </div>
    
    <hr class="hr2">
    <h3 style="line-height:2em;">추가정보</h3>
     <hr class="hr1" style="margin:10px auto 10px;">
    <br>
    <div class="sign-text">
     <h5>생년월일<span style="color:red;">*</span></h5>
    </div>
    <div class="sign-input">		<!-- 여기 입력란 생년월일 입력란이다 -->
    <!-- <input type="text" name="member_birth" style="width: 100px;" class="ib">&nbsp;-없이 주민번호 앞자리 입력해주세요&nbsp; -->
    
     
    </div>
    <hr class="hr2">
    </div>
  </div>
    <div class="d-div">
      <div class="sign-button">
      				<!-- 여기 부터 회원가입 클릭하는곳 -->
      <input type="submit" onclick="joinform_check()" value="회원가입">
      <input type="reset" value="다시입력">
      </div>
    </div>  
  </form>
  
  </body>
</html>
