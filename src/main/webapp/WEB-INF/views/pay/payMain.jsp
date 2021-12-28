<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>payMain<br>
<div class="wrap">

 		<table border="1">
 			<tr>
 				<td style="width:400px; heigth:300px; text-align:center;">
 				30일간 Bibliothek의 모든 도서 구독 가능<br> 및 30일간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payMonth/">30일권 결제 바로가기</a>
 				</td>		
 		</table>
 		<table border="1">
 			<tr>
 				<td style="width:400px; heigth:300px; text-align:center;">
 				12개월 25,800원 할인된 금액으로 Bibliothek의 모든 도서 구독 가능<br> 및 12개월간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payMonth/">1년권 결제 바로가기</a>
 				</td>		 
 		</table>
</div>
</body>
</html>