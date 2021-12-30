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
<!-- 검색창--> 
<div class="container">
      <form action="/" method="GET" class="form">
        <input type="search" placeholder="Search" class="search-field" />
<!--        <button type="submit" class="search-button">
            <img src="search.png">
        </button>-->
      </form>
    </div>
<!--  메뉴바  -->
<header>
    	<div id="logo">
        	<a href="${contextPath}"><img src="resources/images/logo.png" alt="Logo"></a>
        </div>
 
        <div class="top_menu">
        	<c:choose>
        		<c:when test="${loginUser==null }">
	       			<a href="${contextPath}/member/login"><img src="resources/images/h_mypage.jpg" alt="h_mypage" width="50px"></a>
    	   		</c:when>
       			<c:otherwise>
       				<a href="${contextPath}/member/mypage?id=${loginUser }"><img src="${contextPath}/resources/images/h_mypage.jpg" alt="h_mypage" width="50px"></a>
       			</c:otherwise>
       		</c:choose>
       		<a href="#"><img src="resources/images/h_what.jpg" alt="h_what" width="50px"></a>
       		<a href="#"><img src="resources/images/h_community.jpg" alt="h_community" width="50px"></a>
       		<a href="#"><img src="resources/images/h_cash.jpg" alt="h_cash" width="50px"></a>
       	</div>
       	<div class="login">	
       		<c:choose>
       			<c:when test="${loginUser == null }">
        			<a href="${contextPath}/member/login">로그인</a> | 
            		<a href="${contextPath}/member/register_form">회원가입</a>
            	</c:when>
            	<c:otherwise>
            		${loginUser } &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
            		<a href="${contextPath }/member/logout">로그아웃</a>
            	</c:otherwise>
            </c:choose>
        </div>

<!--메인 메뉴창 -->
<div class="menu1">

    <ul class="main">

        <li><a href="literature?literature&novel">문학</a>

            <ul class="sub">

                <li><a href="literature?literature&novel">소설</a></li>

                <li><a href="literature?literature&poem">시</a></li>

                <li><a href="literature?literature&essay">에세이</a> </li>

            </ul>

        </li>

        <li><a href="#">자기개발</a>

            <ul class="sub">

                <li><a href="#">소메뉴1</a></li>

                <li><a href="#">소메뉴2</a></li>

                <li><a href="#">소메뉴3</a> </li>

            </ul>

        </li>

        <li><a href="#">문화</a>

            <ul class="sub">

                <li><a href="#">소메뉴1</a></li>

                <li><a href="#">소메뉴2</a></li>

                <li><a href="#">소메뉴3</a> </li>

            </ul>

        </li>

        <li><a href="#">교육</a>

            <ul class="sub">

                <li><a href="#">소메뉴1</a></li>

                <li><a href="#">소메뉴2</a></li>

                <li><a href="#">소메뉴3</a></li>

            </ul>

        </li>
       <li><a href="#">생활</a>

            <ul class="sub">

                <li><a href="#">소메뉴1</a></li>

                <li><a href="#">소메뉴2</a></li>

                <li><a href="#">소메뉴3</a></li>

            </ul>

        </li>
        
       <li><a href="#">아동</a>

            <ul class="sub">

                <li><a href="#">소메뉴1</a></li>

                <li><a href="#">소메뉴2</a></li>

                <li><a href="#">소메뉴3</a></li>

            </ul>

        </li>      
        <li><a href="bestSeller">베스트셀러</a></li> 
        <li><a href="#">신간</a></li>
        <li><a href="#">추천</a></li> 
</ul>

</div>
</header>
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