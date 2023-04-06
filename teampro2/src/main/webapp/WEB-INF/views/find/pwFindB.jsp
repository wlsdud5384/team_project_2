<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<style>
main {
	border: 2px #112d4e solid;
	padding: 20px;
}

h2 {
	text-align: center;
}

article {
	margin: 00px 0px 0px 15px; width: 1350px; float: left;
}

.hc {
	width: 260px;
	left: 0;
	right: 0;
	margin-top: 30px;
	margin-left: auto;
	margin-right: auto;
} /* 가로 중앙 정렬 */
input {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
	border-radius: 5px;
}

body {
	margin: 0;
	background-color: #FFFFFF;
}

.text-field {
	font-size: 14px;
	padding: 10px;
	width: 260px;
	margin-bottom: 10px;
	border: 1px #112d4e solid;
}

.btnon1 {
	width: 260px;
	margin-top: 5px;
	background-color: #ffffff;
	color: #112d4e;
	border: 1px #112d4e solid;
}

.btnon1:hover {
	width: 260px;
	height: 35px;
	margin-top: 5px;
	border: none;
	border-radius: 4px;
	font-size: 13px;
	font-weight: bold;
	background-color: #112d4e;
	color: white;
}
</style>


</head>
<body>
<h1></h1>
<main class="hc">
	<h2>비밀번호 찾기</h2>
    <hr>
    <div class="hc">
	    <form action="${contextPath}/sweet/find/sendMailB" method="post">
	    	<br>
	            <input type="text" name="bp_id" class="text-field" placeholder="아이디" required>
				<input type="text" id="email" name="email" class="text-field" placeholder="이메일">
				<input type="hidden" id="email" name="email">
			<br>
			<br>
			<br>
	            <button type="submit" class="btnon btnon1">인증번호 전송</button>
	            <button type="button" onclick="history.go(-1);" class="btnon btnon1">로그인으로</button>
	    </form>
    
    <br>
    <c:if test="${not empty msg}">
		<p style="color: red">${msg}</p>
	</c:if>
	</div>
</main>
</body>
</html>
