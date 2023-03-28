<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html lang="ko">

<head>
  
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<link rel="stylesheet" href="${contextPath}/resources/css/delete.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>회원탈퇴</title>
</head>
<script type="text/javascript">
    $(document).ready(function() {
        // 취소
        $(".cencle").on("click", function() {

            location.href = "${contextPath}/user/userMain.do";

        })

        $("#submit").on("click", function() {
            if ($("#member_pw").val() == "") {
                alert("비밀번호를 입력해주세요.");
                $("#member_pw").focus();
                return false;
            }
        });

    })
</script>

<body>
    <section id="container">
        <form action="${contextPath}/user/memberDelete.do" method="post">
            <div class="form-group has-feedback">
                <label class="control-label" for="userId">아이디</label>
                <input class="form-control" type="text" id="member_id" name="member_id" value="${member.member_id}" readonly="readonly" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="userPass">패스워드</label>
                <input class="form-control" type="password" id="member_pw" name="member_pw" />
            </div>
            <div class="form-group has-feedback">
                <label class="control-label" for="userName">성명</label>
                <input class="form-control" type="text" id="name" name="name" value="${member.name}" readonly="readonly" />
            </div>
            <div class="form-group has-feedback">
                <button class="btn btn-success" type="submit" id="submit" style="padding:15; margin-bottom:10;">회원탈퇴</button>
              	<button class="cencle btn btn-danger" type="button" style="padding:15; margin-bottom:10;">취소</button> 
            </div>
            <div>
            <c:if test="${msg == false}">
                비밀번호가 맞지 않습니다.
            </c:if>
        	</div>
        </form>

    </section>

</body>

</html>