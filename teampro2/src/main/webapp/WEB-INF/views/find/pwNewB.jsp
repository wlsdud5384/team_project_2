<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>새 비밀번호 입력</title>
	
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
	<h2>새 비밀번호 설정</h2>
    <hr>
    <div class="hc">
	<form action="${pageContext.request.contextPath}/find/pwNewB" method="post">
		<br>
			<label for="password">새 비밀번호</label>
			<input type="password" name="bp_pw" id="bp_pw" class="text-field" required>
			<label for="confirmPassword">새 비밀번호 확인</label>
			<input type="password" name="pw_new_confirm" id="pw_new_confirm" class="text-field" required>
		<input type="hidden" name="email" value="${email}">
		<input type="hidden" name="authNum" value="${authNum}">
		<input type="hidden" name="bp_id" value="${bp_id}">
		<br>
		<br>
		<br>
		<button type="submit" class="btnon btnon1">변경</button>
	</form>
	
	<br>
	<c:if test="${not empty msg}">
		<p style="color: red">${msg}</p>
	</c:if>
	</div>
</body>
</html>
