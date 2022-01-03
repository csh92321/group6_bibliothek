<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>E-book, Bibliothek</title>
<link rel="stylesheet" href="css/header1.css">
<link rel="stylesheet" href="css/search1.css?after">
<link rel="stylesheet" href="css/footer1.css">
<link rel="stylesheet" href="css/contents1.css">
<!-- 나눔고딕 폰트 적용 -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
</head>
<body>

<%@ include file="default/header.jsp" %>

<!-- 이벤트 -->
<section id='event'>
	<a href="#"><img src="resources/images/event.jpg" width="1200"></a>
</section>	


<!-- 본문 -->


<div class="contents">
		<div class="title">
			베스트셀러
		</div>
		<div class="more">
			<a href="#">더보기</a>
		</div>
		<div class="bl1">	
			<a href="#"><img src="resources/images/book01.jpg" width="100%">
				<div class="book_name">리딩지저스</div>
			</a>
		</div>
		<div class="bl1">	
			<a href="#"><img src="resources/images/book02.JPG" width="100%">
				<div class="book_name">불편한 편의점</div>
			</a>
		</div>
		<div class="bl1">
			<a href="#"><img src="resources/images/book03.JPG" width="100%">
				<div class="book_name">미드나잇 라이브러리</div>
			</a>
		</div>
		<div class="bl1">
			<a href="#"><img src="resources/images/book04.JPG" width="100%">
				<div class="book_name">책이름4 글쓴이-몰루</div>
			</a>
		</div>	
		<div class="bl1">
			<a href="#"><img src="resources/images/book05.JPG" width="100%">
				<div class="book_name">계절 산문</div>
			</a>
		</div>		
</div>

<div class="contents">
		<div class="title">
			신간 도서
		</div>
		<div class="more">
			<a href="#">더보기</a>
		</div>
		<div class="bl1">	
			<a href="#"><img src="resources/images/book06.JPG" width="100%">
				<div class="book_name">요도가와 열쇠가게의 미스터리 사건수첩 3</div>
			</a>
		</div>
		<div class="bl1">	
			<a href="#"><img src="resources/images/book07.PNG" width="100%">
				<div class="book_name">달러구트 꿈백화점</div>
			</a>
		</div>
		<div class="bl1">
			<a href="#"><img src="resources/images/book08.JPG" width="100%">
				<div class="book_name">해리포터 마법의 돌</div>
			</a>
		</div>
		<div class="bl1">
			<a href="#"><img src="resources/images/book09.JPG" width="100%">
				<div class="book_name">방금 떠나온 세계</div>
			</a>
		</div>	
		<div class="bl1">
			<a href="#"><img src="resources/images/book10.PNG" width="100%">
				<div class="book_name">그녀는 돌아오지 않는다</div>
			</a>
		</div>		
</div>
<div class="contents">
		<div class="title">
			MD 추천
		</div>
		<div class="more">
			<a href="#">더보기</a>
		</div>
		<div class="bl1">	
			<a href="#"><img src="resources/images/book11.JPG" width="100%">
				<div class="book_name">검은 햇빛</div>
			</a>
		</div>
		<div class="bl1">	
			<a href="#"><img src="resources/images/book12.JPG" width="100%">
				<div class="book_name">아몬드</div>
			</a>
		</div>
		<div class="bl1">
			<a href="#"><img src="resources/images/book13.JPG" width="100%">
				<div class="book_name">안녕 주정뱅이</div>
			</a>
		</div>
		<div class="bl1">
			<a href="#"><img src="resources/images/book14.JPG" width="100%">
				<div class="book_name">투명인간</div>
			</a>
		</div>	
		<div class="bl1">
			<a href="#"><img src="resources/images/book15.JPG" width="100%">
				<div class="book_name">소년이 온다</div>
			</a>
		</div>
		
</div>

<%@ include file="default/footer.jsp" %>
<!-- 푸터 -->

<div class='footer'></div><!--  float속성 해제 -->

</body>
</html>