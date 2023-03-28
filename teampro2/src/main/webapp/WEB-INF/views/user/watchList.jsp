<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>watchList</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/watchList.css">

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js">
        $('.check.all').on('change', function() {
            $('.check').prop('checked', $(this).prop('checked'));
        });

        $(document).on('click', '.page-box .btn.number', function() {
            $('.page-box .btn.number').removeClass('on');
            $(this).addClass('on');
            return false;
        })
    </script>
</head>

<body>
    <h1>관심 목록</h1>
    <br>
    <%-- 관심 목록 --%>
    <section class="article-list table-common con">
        <table border="1">
            <thead>
                <tr>
                    <th>이미지</th>
                    <th>건물유형</th>
                    <th>건물이름</th>
                    <th>건물층수</th>
                    <th>공급면적</th>
                    <th>거래유형</th>
                    <th>거래가</th>
                    <th>등록일자
                    <th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img class="myPageImg" src="#" alt="상품1" onclick=""></td>
                    <td>아파트</td>
                    <td>목련아파트</td>
                    <td>7층</td>
                    <td>평수</td>
                    <td>매매</td>
                    <td>2억7000</td>
                    <td>2023-05-12</td>
                </tr>
                <tr>
                    <td><img class="myPageImg" src="#" alt="상품1" onclick=""></td>
                    <td>아파트</td>
                    <td>목련아파트</td>
                    <td>7층</td>
                    <td>평수</td>
                    <td>매매</td>
                    <td>2억7000</td>
                    <td>2023-05-12</td>
                </tr>
                <tr>
                    <td><img class="myPageImg" src="#" alt="상품1" onclick=""></td>
                    <td>아파트</td>
                    <td>목련아파트</td>
                    <td>7층</td>
                    <td>평수</td>
                    <td>매매</td>
                    <td>2억7000</td>
                    <td>2023-05-12</td>
                </tr>

            </tbody>
        </table>
    </section>
    <br>
    <!--  숫자 버튼  -->
    <div class="page-box">
        <a class="btn" href="#">&lt;</a>
        <a class="btn number" href="#">1</a>
        <a class="btn number" href="#">2</a>
        <a class="btn number on" href="#">3</a>
        <a class="btn number" href="#">4</a>
        <a class="btn number" href="#">5</a>
        <a class="btn" href="#">&gt;</a>
    </div>
    <br>
</body>

</html>