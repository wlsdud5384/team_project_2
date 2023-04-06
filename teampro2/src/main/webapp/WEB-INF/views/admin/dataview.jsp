<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
request.setCharacterEncoding("UTF-8");
%>


<html>
<head>
<meta charset="UTF-8">
<style>
hr {
	border: 1px black solid;
	width: 1300px;
}

table {
	width: 1300px;
	font-size: 14px;
	border-spacing: 2 3px;
}

table td {
	background-color: #E6F6E8;
	border: 1px solid black;
	width: 100px;
	height: 30px;
	margin: 10px;
}

.a1 {
	margin-bottom: 2px;
}

.t1 {
	background-color: #91E89E;
}
</style>



</head>
<body>

	<h2>부동산데이터 센터</h2>
	<hr>
	<br>
	<!-- https://zelkun.tistory.com/entry/004-jQuery-시도시군구읍면동을-이용한-selectbox-제어-with-기상청-동네예보 -->
<head>
<meta charset="utf-8" />
<title>jQuery Select Example</title>
<style>
div.contents {
	text-align: center;
	padding-bottom: 10px;
}
</style>

<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>
<script type="application/javascript"
	src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<script src="https://code.jquery.com/jquery-latest.min.js"
	type="application/javascript"></script>
<script type="application/javascript"
	src="https://zelkun.tistory.com/attachment/cfile8.uf@99BB7A3D5D45C065343307.js"></script>
<script type="application/javascript">
	
	
	
		jQuery(document).ready(function () {
			//sido option 추가
			jQuery.each(hangjungdong.sido, function (idx, code) {
				//append를 이용하여 option 하위에 붙여넣음
				jQuery('#sido').append(fn_option(code.sido, code.codeNm));
			});
			
			function fn_option(code, name) {
				return '<option value="' + code + '">' + name + '</option>';
			}
			function fn_iframe(url) {
				jQuery('#iframe').attr('src', url);
			}
		

			//sido 변경시 시군구 option 추가
			jQuery('#sido').change(function () {
				jQuery('#sigugun').show();
				jQuery('#sigugun').empty();
				jQuery('#sigugun').append(fn_option('', '선택')); //
				jQuery.each(hangjungdong.sigugun, function (idx, code) {
					if (jQuery('#sido > option:selected').val() == code.sido)
						jQuery('#sigugun').append(fn_option(code.sigugun, code.codeNm));
				});

				//세종특별자치시 예외처리
				//옵션값을 읽어 비교
				if (jQuery('#sido option:selected').val() == '36') {
					jQuery('#sigugun').hide();
					//index를 이용해서 selected 속성(attr)추가
					//기본 선택 옵션이 최상위로 index 0을 가짐
					jQuery('#sigugun option:eq(1)').attr('selected', 'selected');
					//trigger를 이용해 change 실행
					jQuery('#sigugun').trigger('change');
				}
			});

			//시군구 변경시 행정동 옵션추가
			jQuery('#sigugun').change(function () {
				//option 제거
				jQuery('#dong').empty();
				jQuery.each(hangjungdong.dong, function (idx, code) {
					if (jQuery('#sido > option:selected').val() == code.sido && jQuery('#sigugun > option:selected').val() == code.sigugun)
						jQuery('#dong').append(fn_option(code.dong, code.codeNm));
				});
				//option의 맨앞에 추가
				jQuery('#dong').prepend(fn_option('', '선택'));
				//option중 선택을 기본으로 선택
				jQuery('#dong option:eq("")').attr('selected', 'selected');
			});

			jQuery('#date1').change(function () { //id : data1 실행시 작동 
				var sido = jQuery('#sido option:selected'); //시도에 대한 select 의 value를 가져와서 sido 에 넣는다.
				var sigugun = jQuery('#sigugun option:selected'); //시구군에 대한 select 의 value를 가져와서 sigugun 에 넣는다.
				var date = $('input#date1').val(); //날짜에 대한 input 의 value를 가져와서 date 에 넣는다.
				var regex = /[^0-9]/g;	//string으로 들로운 문자열에 숫자를 제외한 모든값을 지운다.
				var result = date.replace(regex, ""); //ex) 2023-03 을 202303으로 변환한다.
				var dongName = sido.text() + '/' + sigugun.text(); // 시도/시군구의 이름을 합친다.
				jQuery('#dongName').text(dongName);
				var dongCode = sido.val() + sigugun.val(); // 시도/시군구의 코드을 합친다.
				jQuery('#dongCode').text(dongCode);
				
				jQuery('#dongDate').text(result);
				

				//아파트 매매 실거래자료 URL
				var url = 'http://openapi.molit.go.kr:8081/OpenAPI_ToolInstallPackage/service/rest/RTMSOBJSvc/getRTMSDataSvcAptTrade?'+
				'serviceKey=nQbHd%2BiQfZ5yrc902I7Chvzmcp4b6J9f7dJbMfK07aDKE4aKZZLPrLV5NIRpyMji5PiUrQpbrtPGxmfwoqia%2Fw%3D%3D&LAWD_CD='+ dongCode +'&DEAL_YMD=' + result;
				
				//iframe으로 결과 보기
				fn_iframe(url);
				aaa(url);
			});
		});
</script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script>
	function aaa(url){
	$(url).ready(function() {
		$.ajax({
			url: url,
			type: 'GET',
			success: function(url) {
				console.log(url);
			}
		})
	});
	}
</script>

</head>
<body>
	<div class="contents">
		<div>
			<td>&emsp;&ensp;시/도 &emsp;&emsp;&ensp;</td> &emsp; &emsp;&emsp; 시/구/군
			</td>
			<td>&emsp;&emsp;&emsp;&emsp; 년도/월</td>
		</div>
		<div>
			<select id="sido"><option value="">선택</option></select>
			&emsp;&emsp;&emsp; <select id="sigugun"><option value="">선택</option></select>
			<input id="date1" type="month" />
		</div>
		<div>
			텍스트: <span id="dongName"></span><br> 코드: <span id="dongCode"></span>
			<br> 날짜: <span id="dongDate"></span>
		</div>
	</div>


	<div class="main">
		<iframe id="iframe" style="width: 100%; height: 500px;"> </iframe>
	</div>
</body>



<table border="1" align="center">
	<tr align="center" bgcolor="#A7ECB1">
		<td class="t1"><b>거래금액</b></td>
		<td class="t1"><b>거래유형</b></td>
		<td class="t1"><b>건축년도</b></td>
		<td class="t1"><b>년</b></td>
		<td class="t1"><b>법정동</b></td>
		<td class="t1"><b>아파트</b></td>
		<td class="t1"><b>월</b></td>
		<td class="t1"><b>일</b></td>
		<td class="t1"><b>전용면적</b></td>
		<td class="t1"><b>중개사소재지</b></td>
		<td class="t1"><b>지번</b></td>
		<td class="t1"><b>지역코드</b></td>
		<td class="t1"><b>층</b></td>

	</tr>






	<c:forEach var="member" items="${membersList}">
		<tr align="center">
			<td>${member.member_join}</td>
			<td>${member.member_id}</td>
			<td>${member.member_pw}</td>
			<td>${member.name}</td>
			<td>${member.email1}</td>
			<td>${member.email2}</td>
			<td>${member.addr1}${member.addr2}${member.addr3}</td>
			<td>${member.tel1}-${member.tel2}-${member.tel3}</td>
			<td>${member.hp1}-${member.hp2}-${member.hp3}</td>
			<td>${member.member_birth}</td>
			<td>${member.join_date}</td>
			<td>활동중</td>
			<td><a class="a1"
				style="border: 2px solid #6981ED; text-decoration: none; color: black; background-color: #B6B7F8;"
				href="${contextPath }/admin/modMember.do?id=${member.member_id}">수정
			</a><br> <a
				style="border: 2px solid #6981ED; text-decoration: none; color: black; background-color: #F8AAAF;"
				href="${contextPath}/admin/removeMember.do?id=${member.member_id }">정지</a>
				<br></td>

		</tr>
	</c:forEach>
</table>
<%-- <a  href="${contextPath}/member/memberForm.do"><h1 style="text-align:center">회원가입</h1></a> --%>

<!-- 페이지 번호 작성칸  -->
<br>
<br>
<br>
<br>
<br>
<hr>





</body>
</html>
