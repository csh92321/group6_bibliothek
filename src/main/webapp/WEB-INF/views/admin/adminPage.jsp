<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header1.css">
<head>
<meta charset="UTF-8">
<title>login</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1000px; margin:0 auto; text-align:center;}
</style>
</head>
<body>

<c:import url="../default/header.jsp" />

<div class="wrap">

	<a href="${contextPath }/admin/PBlistAll">1:1문의</a> <hr>
	<a href="${contextPath }/#">도서추가</a> <hr>
	<a href="${contextPath }/#">추천도서 설정</a>

	

</div>

<c:import url="../default/footer.jsp" />

</body>
</html>