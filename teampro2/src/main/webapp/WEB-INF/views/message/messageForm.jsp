<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"  %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>messageForm</title>
    
    <style>
        /* 쪽지쓰기 */

        #noteWrite table {
            width: 720px
        }

        #noteWrite th {
            width: 100px;
            padding: 5px;
            text-align: right;
            vertical-align: top
        }

        #noteWrite td {
            width: 620px;
            padding: 5px
        }

        #noteWrite #send_id {
            width: 180px
        }

        #noteWrite #recv_id {
            width: 180px
        }

        #noteWrite #Title {
            width: 700px
        }

        #noteWrite #content {
            width: 700px;
            height: 300px
        }

        #boardWrite .btnSet {
            text-align: center
        }
        
        /*추가*/
        .con {
        	max-width:950px;
        	margin:0 auto;
        }
        
        body, ul, li, h1, h2, h3, h4, h5, h6 {
			margin: 0;
			padding: 0;
			list-style: none;
		}
        
        #note_btn input[type="submit"], input[type="button"] {
        	width: 80px;
   			line-height: 26px;
   			background-color: #848484;
    		color: #fff;
   			text-align: center;
   			border: 0;
    		font-size: 15px;
        }
        
        .note {
      		margin-top:20px;
		    margin-bottom:20px;
		    border:2px solid lightgray;
		    padding:15px;
		    box-sizing:border-box;
		}
      			      
    </style>
    
    <script>
	function checkInput() {
		var recvId = document.getElementById("recv_id").value;
		if (recvId == "") {
			alert("받는 사람을 입력해주세요.");
			return false;
		}
		return true;
	}
    </script>
    
</head>

<body>
	<h1>쪽지함</h1>
	
	<div class="con note" style="text-align:center;">
	
	<section class="note-form">
    <form action="${contextPath}/message/insert.do" method="post">

        <table id="noteWrite">
            <tbody>
                <tr>
                    <th scope="row"><label for="send_id">보내는 사람</label>
                    <td class="send_id"><input type="text" name="send_id" id="send_id" value="${member.member_id}" readonly="readonly"></td>
                </tr>
                <tr>
                    <th scope="row"><label for="recv_id">받는 사람</label>
                    <td class="recv_id"><input type="text" name="recv_id" id="recv_id"></td>
                </tr>
                <tr>
                    <th scope="row"><label for="title">제목</label>
                    <td class="title"><input type="text" name="title" id="title"></td>
                </tr>
                <tr>
                    <th scope="row"><label for="content">내용</label>
                    <td class="content"><textarea name="content" id="content"></textarea></td>
                </tr>
            <tbody>

        </table>

        <div id=note_btn>
            <input type="submit" value="쪽지 보내기">
            <input type="button" value="목록으로" onclick="location.href = '${contextPath}/message/listMessage.do'">
        </div>
    </form>
	</section>
   </div>	
</body>

</html>