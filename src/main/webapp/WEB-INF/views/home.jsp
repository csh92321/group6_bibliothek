<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E-book, Bibliothek</title>
<link rel="stylesheet" href="css/header1.css">
<link rel="stylesheet" href="css/search1.css?after">
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
<%@ include file="header.jsp" %>



<!-- 이벤트 -->
<div class="contents">
<section id='event'>
	<a href="#"><img src="resources/images/event.jpg" width="1024px"></a>
</section>	
</div>


<!-- 본문 -->


<div class="contents">
	<div class = "item-main item1">
		<div class="title">
			베스트셀러
		</div>
		<div class="more">
			<a href="${contextPath}/bestSeller">더보기</a>
		</div>
		</div>
			<div class = "item-main item2">
	<span id="best"></span>
			</div>

</div>
<div class="contents">
		<div class="title">
			신간 도서
		</div>
		<div class="more">
			<a href="${contextPath}/newBook">더보기</a>
		</div>
			<span id="new"></span>		
</div>
<div class="contents">
		<div class="title">
			MD 추천
		</div>
		<div class="more">
			<a href="${contextPath}/recommend">더보기</a>
		</div>
					<span id="recommend"></span>
		
</div>

		




<!-- 푸터 -->

<div class='footer'></div><!--  float속성 해제 -->
<footer>
	<!--  <div id="address">
		<li><a href="#">공지사항 +</a></li>
	</div>
	-->
	<div id="footer_box">
		<ul>
			<li><a href="#">공지사항 +</a></li>
			<li>회사소개    |    이용약관    |   개인정보처리방침</a></li>
			<li>(주) Bibliothek 서울시 종로구 종로 3 대표이사 : 홍준모 사업자등록번호 : 123-45-67891
					<br>대표전화 : 1111-2222 (발신자 부담전화)
					<br>팩스 : 0101-010-1010 (지역번호공통) 서울시
							통신판매업신고번호 제 653호 ▶ 사업자정보확인
					<br>COPYRIGHT(C) Bibliothek CENTER ALL RIGHTS RESERVED</li>
			</ul>					
		</div>
			
	
</footer>
</body>
</html>