<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("utf-8");
%>
<style>
    #outer_wrap {
        margin: 0px auto;
        padding: 0px;
        width: 1920px;
    }

    #wrap {
        margin: 0px auto;
        padding: 0px;
        width: 1600px;
        float: center;
    }
</style>

<head>
    <meta charset="UTF-8">
    <link href="${contextPath}/resources/css/main1.css" rel="stylesheet" type="text/css" media="screen">
    <script src="${contextPath}/resources/jquery/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/jquery/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/jquery/stickysidebar.jquery.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/jquery/basic-jquery-slider.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/jquery/tabs.js" type="text/javascript"></script>
    <script src="${contextPath}/resources/jquery/carousel.js" type="text/javascript"></script>
    <script>
        // 슬라이드 
        $(document).ready(function() {
            $('#ad_main_banner').bjqs({
                'width': 150,
                'height': 145,
                'showMarkers': true,
                'showControls': false,
                'centerMarkers': false
            });
        });
        // 스티키 		
        $(function() {
            $("#sticky").stickySidebar({
                timer: 100,
                easing: "easeInBounce"
            });
        });
    </script>
    <title>
        <tiles:insertAttribute name="title_Customer" />
    </title>
</head>

<body>
    <div id="outer_wrap">
        <div id="wrap">
            <header>
                <tiles:insertAttribute name="header_Customer" />
            </header>
            <div class="clear"></div>
            <aside>
                <tiles:insertAttribute name="side_Customer" />
            </aside>
            <article>
                <tiles:insertAttribute name="body_Customer" />
            </article>
            <%-- 			<tiles:insertAttribute name="quickMenu" /> --%>
            <div class="clear"></div>
            <footer>
                <tiles:insertAttribute name="footer_Customer" />
            </footer>
        </div>
    </div>
</body>