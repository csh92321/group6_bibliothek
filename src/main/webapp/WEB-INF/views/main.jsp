<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="book/menu.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main page</title>
<link rel="stylesheet" href="resources/css/header1.css">
<link rel="stylesheet" href="resources/css/footer1.css">
<link rel="stylesheet" href="resources/css/search1.css">
<link rel="stylesheet" href="resources/css/contents1.css">
</head>
<body>
<!-- 검색창--> 
<div class="wrap">
   <div class="search">
      <input type="text" class="searchTerm" placeholder="Search...">
      <button type="submit" class="searchButton">
        <i class="fa fa-search"></i>
     </button>
   </div>
</div>

<!--  메뉴바  -->
	<header>
    	<div id="logo">
        	<a href="http://localhost:8081/root/#%22"><img src="resources/images/logo.png" alt="Logo"></a>
        </div>
 
        <div id="top_menu">
       		<a href="#"><img src="resources/images/mypage.jpg" alt="mypage" width="50"></a>
       		<a href="#"><img src="resources/images/what.jpg" alt="what" width="50"></a>
       		<a href="#"><img src="resources/images/community.jpg" alt="community" width="50"></a>
       		<a href="#"><img src="resources/images/cash.jpg" alt="cash" width="50"></a>
       	</div>
       	<div id="login">	
        	<a href="#">로그인</a> | 
            <a href="#">회원가입</a>
        </div>
 <hr>
        <nav>
        	<ul>
            	<li><a href="novel">문학</a></li>
                <li><a href="#">자기개발</a></li>
                <li><a href="#">문화</a></li>
                <li><a href="#">교육</a></li>
                <li><a href="#">생활</a></li>
                <li><a href="#">아동</a></li>
                <li><a href="bestSeller">베스트</a></li>
         		<li><a href="#">신간</a></li>
         		<li><a href="#">추천</a></li>
            </ul>
         </nav>	
 	</header>
 <hr>
<!-- 이벤트 -->
<section id='event'>
	<a href="#"><img src="resources/images/event.jpg" width="1200"></a>
</section>	
<!-- 본문 -->
<h3>베스트셀러</h3>
<h5><a href=#">더보기+</a></h5>
<div class="book-list">
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름1 글쓴이-김치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름2 글쓴이-고추장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름3 글쓴이-된장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>	
</div>

<h3>신간도서</h3>
<h5><a href=#">더보기+</a></h5>
<div class="book-list">
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름1 글쓴이-김치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름2 글쓴이-고추장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름3 글쓴이-된장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>
</div>

<h3>MD추천</h3>
<h5><a href=#">더보기+</a></h5>
<div class="book-list">
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름1 글쓴이-김치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름2 글쓴이-고추장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름3 글쓴이-된장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>
</div>	

	<div class="book-list">
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름1 글쓴이-김치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름2 글쓴이-고추장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름3 글쓴이-된장찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>
	<a href="#"><img src="resources/images/book1.jpg" width="225">
		<div class="book_name">책이름4 글쓴이-참치찌개</div>
	</a>
</div>
<!-- 푸터 -->

<div class='clear'></div><!--  float속성 해제 -->
<footer>
	<div id="footer">
			<ul>
				<div id="footer_box_adress"></div>
					<li>회사소개    |    이용약관    |   개인정보처리방침</a></li>
				<div>
					<li><a href="#">공지사항 +</a></li>
					<li>(주) Bibliothek 서울시 종로구 종로 3 대표이사 : 홍준모 사업자등록번호 : 123-45-67891
					<br>대표전화 : 1111-2222 (발신자 부담전화)
					<br>팩스 : 0101-010-1010 (지역번호공통) 서울시
							통신판매업신고번호 제 653호 ▶ 사업자정보확인
					<br>COPYRIGHT(C) Bibliothek CENTER ALL RIGHTS RESERVED</li>
			</ul>					
		</div>
	</div>
</footer>
</body>
</html>