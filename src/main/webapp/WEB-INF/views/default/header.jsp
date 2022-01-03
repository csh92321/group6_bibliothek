<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/contents1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<script type="text/javascript">
function search() {
	var search = $("#search").val();
	var link = 'search?'+search
	var encode = encodeURI(link)
	location.href = encode
}
</script>
</head>
<body>
<!--  메뉴바  -->
	<div class="header-container">
	<div class="header-item">
	<div class="header-item-item1">
       <div id="logo">
           <a href="/root"><img src="${contextPath }/resources/images/logo.png" alt="Logo"></a>
        </div>
        </div>
        <div class="header-item-item3">
        <!-- 검색창-->
		<div class="item_search">
	<div class="container-search">
		<input class="search-field" id="search" placeholder="Search Book"
				onKeypress="javascript:if(event.keyCode==13) {search();}"
				type="text" size="20">
<!--       <form action="/" method="GET" class="form"> -->
<!--         <input type="search" placeholder="Search" class="search-field" -->
<!--         onKeypress="javascript:if(event.keyCode==13) {search();}" /> -->
<!-- <!--        <button type="submit" class="search-button"> -->
<!--             <img src="search.png"> -->
<!--         </button>--> 
<!--       </form> -->
    </div>
    </div>
        </div>
 	<div class="header-item-item2">
 	 	<div class="header-item-item2-item1">
        <div id="top_menu">
           <c:choose>
              <c:when test="${loginUser==null }">
                   <a href="${contextPath}/member/login"><img src="${contextPath}/resources/images/h_mypage.jpg" alt="h_mypage" width="50px"></a>
                </c:when>
                <c:otherwise>
                   <a href="${contextPath}/member/mypage?id=${loginUser }"><img src="${contextPath}/resources/images/h_mypage.jpg" alt="h_mypage" width="50px"></a>
                </c:otherwise>
             </c:choose>
             <a href="${contextPath }/ntboard/ntBoardList"><img src="${contextPath}/resources/images/h_what.jpg" alt="h_what" width="50px"></a>
             <a href="${contextPath }/board/boardList"><img src="${contextPath}/resources/images/h_community.jpg" alt="h_community" width="50px"></a>
             <a href="${contextPath }/pay/payMain"><img src="${contextPath}/resources/images/h_cash.jpg" alt="h_cash" width="50px"></a>
          </div>
          </div>
           <div class="header-item-item2-item2">
          <div id="login">   
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
            </div>
        </div>
        </div>


<!--메인 메뉴창 -->
	<div class="header-item">
<div id="menu1">

    <ul class="main">

        <li><a href="${contextPath}/book?literature&novel">문학</a>

            <ul class="sub">

                <li><a href="${contextPath}/book?literature&novel">소설</a></li>

                <li><a href="${contextPath}/book?literature&poem">시</a></li>

                <li><a href="${contextPath}/book?literature&essay">에세이</a> </li>

            </ul>

        </li>

        <li><a href="${contextPath}/book?self&business">자기계발</a>

            <ul class="sub">

                <li><a href="${contextPath}/book?self&business">비즈니스</a></li>

                <li><a href="${contextPath}/book?self&relation">인간관계</a></li>

            </ul>

        </li>

        <li><a href="${contextPath}/book?culture&philosophy">문화</a>

            <ul class="sub">

                <li><a href="${contextPath}/book?culture&philosophy">철학</a></li>
                <li><a href="${contextPath}/book?culture&history">역사</a></li>
                <li><a href="${contextPath}/book?culture&society">사회</a></li>
                <li><a href="${contextPath}/book?culture&science">과학</a></li>
                <li><a href="${contextPath}/book?culture&art">예술</a></li>
                <li><a href="${contextPath}/book?culture&religion">종교</a></li>

            </ul>

        </li>

        <li><a href="${contextPath}/book?education&language">교육</a>

            <ul class="sub">

                <li><a href="${contextPath}/book?education&language">언어</a></li>

                <li><a href="${contextPath}/book?education&it">IT</a></li>

            </ul>

        </li>
       <li><a href="${contextPath}/book?life&travel">생활</a>

            <ul class="sub">

                <li><a href="${contextPath}/book?life&travel">여행</a></li>

                <li><a href="${contextPath}/book?life&cooking">요리</a></li>

                <li><a href="${contextPath}/book?life&health">건강</a></li>
                
                <li><a href="${contextPath}/book?life&hobby">취미</a></li>

            </ul>

        </li>
        
       <li><a href="${contextPath}/book?child&baby">아동</a>

            <ul class="sub">

                <li><a href="${contextPath}/book?child&baby">유아</a></li>
                <li><a href="${contextPath}/book?child&picture">그림책</a></li>
                <li><a href="${contextPath}/book?child&reference">참고서</a></li>

            </ul>

        </li>       
        <li/>  
        <li><a href="${contextPath}/bestSeller">베스트셀러</a></li> 
        <li><a href="${contextPath}/newBook">신간</a></li>
        <li><a href="${contextPath}/recommend">추천</a></li> 
	</ul>
	</div>

</div>
        </div>

</body>
</html>