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
<body> boardAllList<br>

 	<div class="wrap">
 		<table border="1" bordercolor="gray" width="300px" height="400px">
 			<tr>
 			<th>고객센터</th><br>
 		</table>
 		<table border="1" bordercolor="gray" width="400px" height="400px">
 			<tr>
 			<a href="${contextPath }/board/contentList/">더보기</a>
 			<th>공지사항</th>
 		</table>
 		
 	</div>



</body>
</html>