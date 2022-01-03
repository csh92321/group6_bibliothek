<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.pay a{
color: #ffb532;
}
 .pay a:hover {text-decoration:none; color:#b8371b; font-size:150%;}

 }
</style>

</head>
<body>
<c:import url="../default/header.jsp" />
<br>
<div class="wrap" style="font-size:100%" align="center">
			
 		<table class="pay" border="3" style="width:600px; height:100px; text-align:center; border-color:#b8371b;">
 				
 			<tr>
 				<td>
 				30일간 Bibliothek의 모든 도서 구독 가능<br> 및 30일간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payMonth/" >30일권 결제 바로가기</a>
 				</td>		
 		</table> <br>
 		<table class="pay" border="3" style="width:600px; height:100px; text-align:center; border-color:#ffb532">
 			<tr>
 				<td>
 				12개월 25,800원 할인된 금액으로 Bibliothek의 모든 도서 구독 가능<br> 및 12개월간 랜선 독서 모임 참여 가능<br>
				<a href="${contextPath }/pay/payYear/">1년권 결제 바로가기</a>
 				</td>		 
 		</table>
</div>

<!--  
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
-->
<c:import url="../default/footer.jsp" />
</body>
</html>