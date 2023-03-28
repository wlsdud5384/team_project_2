<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>    


<html>
<head>
<meta charset=UTF-8">
<title>계약 내역</title>
</head>
<body>
<h1>계약 내역</h1>

	<table border="1"  align="center"  width="80%">
	    <tr align="center"   bgcolor="lightgreen">
	      <td><b>번호</b></td>
	      <td><b>매물아이디</b></td>
	      <td><b>사용자아이디</b></td>
	      <td><b>매물금액</b></td>
	      <td><b>계약날짜</b></td>
	      <td><b>위치</b></td>
	   </tr>
	   
	 <c:forEach var="contract" items="${contractListB}">
  <c:if test="${contract.bp_id == memberB.bp_id}">
    <tr align="center">
      <td>${contract.goodscon_id}</td>
      <td>${contract.goods_id}</td>
      <td>${contract.member_id}</td>
      <td>${contract.price}</td>
      <td>${contract.sale_date}</td>
      <td>${contract.region}</td>
    </tr>
  </c:if>
</c:forEach>
  
	</table>

</body>
</html>
