<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style>
 a:hover {text-decoration:none; color:#ffb532; font-size:150%;}
 
 month{
 text-color: #b8371b;
 }
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>payMain<br>
<div class="wrap" style="font-size:120%" align="center">

 		<table border="1" style="width:500px; height:200px; text-align:center;">
 			<tr>
 				<td>
 				30일간 Bibliothek의 모든 도서 구독 가능<br> 및 30일간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payMonth/">30일권 결제 바로가기</a>
 				</td>		
 		</table> <br>
 		<table border="1" style="width:500px; height:200px; text-align:center;">
 			<tr>
 				<td>
 				12개월 25,800원 할인된 금액으로 Bibliothek의 모든 도서 구독 가능<br> 및 12개월간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payYear/">1년권 결제 바로가기</a>
 				</td>		 
 		</table>
</div>

<div style="color:#b8371b;" "font-size: 150%" align="cener">
	<table>
		<b>■ 30일 이용권</b><br>
</div>
<div style="color:#b8371b;" "font-size: 100%" align="center">
		30일간 Bibliothek의 모든 도서 구독 가능 및 30일간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payMonth/">30일 이용권 결제 바로가기</a>
	</table>
</div>

<div style="color:#b8371b;" "font-size: 200%" align="center">
	<table>
		<b>■ 1년 이용권</b><br>
</div>
<div style="color:#b8371b;" "font-size: 100%" align="center">
		12개월 25,800원 할인된 금액으로 Bibliothek의 모든 도서 구독 가능 및 12개월간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payMonth/">1년 이용권 결제 바로가기</a>
	</table>
</div>
</body>
</html>