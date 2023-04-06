<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!-- fmt를 사용하기위한 태그 라이브러리 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> -->
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>viewMessage</title>
    <style>
        /* 쪽지쓰기 */
        html {
            font-family: "Noto Sans KR", sans-serif !important;
        }

        /* 라이브러리 */
        .con {
            margin: 0 auto;
        }

        /* 커스텀 */
        /* 반응형 레이아웃 */
        .con {
            max-width: 950px;
        }

        .table-common>table {
            width: 100%;
            border-collapse: collapse;
        }

        .table-common>table th,
        .table-common>table td {
            border: 1px solid black;
            padding: 10px;
        }

        .article-detail {
            border: 2px solid lightgray;
        }

        .article-detail>table {
            border: none;

        }

        .article-detail>table th,
        .article-detail>table td {
            border: none;
        }

        .article-detail>table tr:not(:last-child) {
            border-bottom: 1px solid lightgray;
        }

        .article-detail>table tr.article-title>td {

            font-weight: bold;
            font-size: 1.5rem;
        }

        .article-body {

            height: 500px;
            font-size: 1rem;
        }

        #note_btn {
            text-align: center;
        }
    </style>


</head>

<body>
    <h1>쪽지함</h1>
    <br>
    <section class="article-detail table-common con row">

        <table class="cell" border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
                <tr class="article-title">
                    <th>${data.no}</th>
                    <td colspan="5">${data.title}</td>
                </tr>
                <tr class="article-info">
                    <th>날짜</th>
                    <td>${data.writeDate}</td>
                    <th>보내는 사람</th>
                    <td>${data.send_id}</td>
                    <th>받는 사람</th>
                    <td>${data.recv_id}</td>
                </tr>
                <tr class="article-body">
                    <td style="vertical-align:top" colspan="6">${data.content}</td>

                </tr>
            </tbody>
        </table>
    </section>
    <br>
    <div id=note_btn>
        <input type="button" value="쪽지삭제" onclick="location.href = '${contextPath}/message/delete.do?no=${data.no}'">
        <input type="button" value="목록으로" onclick="location.href = '${contextPath}/message/listMessage.do'">
    </div>


</body>

</html>