<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bibliothek</title>
<link rel="stylesheet" href="css/header1.css">
<link rel="stylesheet" href="css/search1.css">
<link rel="stylesheet" href="css/footer1.css">
<link rel="stylesheet" href="css/contents1.css">
<link rel="stylesheet" href="css/book.css">

<script src="resources/js/book.js"></script>
<!-- 나눔고딕 폰트 적용 -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
</head>
<body onload="getHit(); getNew(); getRecommend();">

<%@ include file="default/header.jsp" %>

<div class="container-main">

<!-- 이벤트 -->
	<div class = "item-main" style="height:450px;">
		<div class = "item-main-item1">
<section id='event'>
	<a href="#"><img src="resources/images/event.jpg" width="1024px"></a>
</section>	
</div>
</div>


<!-- 본문 -->

	<div class = "item-main" >
	<div class = "item-main-item1">
					<div class = "item1-it1">
		<div class="title">
			베스트셀러
		</div>
		</div>
						<div class = "item1-it2">	
		<div class="more">
			<a href="${contextPath}/bestSeller">더보기</a>
		</div>
		</div>
		</div>
			<div class = "item-main-item2">
	<span id="best"></span>
			</div>

</div>
	<div class = "item-main">
		<div class = "item-main-item1">
				<div class = "item1-it1">
		<div class="title">
			신간 도서
		</div>
		</div>
				<div class = "item1-it2">		
		<div class="more">
			<a href="${contextPath}/newBook">더보기</a>
		</div>
		</div>
		</div>
					<div class = "item-main-item2">
			<span id="new"></span>
			</div>
			</div>		
	<div class = "item-main">
		<div class = "item-main-item1">
						<div class = "item1-it1">
		<div class="title">
			MD 추천
		</div>
				</div>
								<div class = "item1-it2">	
		<div class="more">
			<a href="${contextPath}/recommend">더보기</a>
		</div>
				</div>
		</div>
				<div class = "item-main-item2">
					<span id="recommend"></span>
					</div>
</div>
</body>

<footer>
<%@ include file="default/footer.jsp" %>
</footer>
</html>

