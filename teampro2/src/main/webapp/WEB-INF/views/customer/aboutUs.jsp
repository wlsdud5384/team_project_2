<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>aboutUs</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="${contextPath}/resources/css/Us.css">
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</head>

<body>
    <h1>회사 소개</h1>
    <div id="slider-wrapper">
        <div class="inner-wrapper">
            <input checked type="radio" name="slide" class="control" id="Slide1" />
            <label for="Slide1" id="s1"></label>
            <input type="radio" name="slide" class="control" id="Slide2" />
            <label for="Slide2" id="s2"></label>
            <input type="radio" name="slide" class="control" id="Slide3" />
            <label for="Slide3" id="s3"></label>
            <input type="radio" name="slide" class="control" id="Slide4" />
            <label for="Slide4" id="s4"></label>
            <div class="overflow-wrapper">
                <a class="slide" href=""><img src=""></a>
                <a class="slide" href=""><img src=""></a>
                <a class="slide" href=""><img src="" /></a>
                <a class="slide" href=""><img src="" /></a>
            </div>
        </div>
    </div>
</body>

</html>