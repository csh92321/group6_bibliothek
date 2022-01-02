<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin_header1.css">
</head>
<body>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<header>
       <div id="logo">
           <a href="/"><img src="../resources/images/logo.png" alt="Logo"></a>
        </div>
 
        <div id="top_menu">
           <c:choose>
              <c:when test="${loginUser==null }">
                   <a href="${contextPath}/member/login"><img src="${contextPath}/resources/images/h_mypage.jpg" alt="h_mypage" width="50px"></a>
                </c:when>
                <c:otherwise>
                   <a href="${contextPath}/successLogin?id=${loginUser }"><img src="${contextPath}/resources/images/h_mypage.jpg" alt="h_mypage" width="50px"></a>
                </c:otherwise>
             </c:choose>
             <a href="#"><img src="${contextPath}/resources/images/h_what.jpg" alt="h_what" width="50px"></a>
             <a href="#"><img src="${contextPath}/resources/images/h_community.jpg" alt="h_community" width="50px"></a>
             <a href="#"><img src="${contextPath}/resources/images/h_cash.jpg" alt="h_cash" width="50px"></a>
          </div>
          <div id="login">   
             <c:choose>
                <c:when test="${loginUser == null }">
                 <a href="${contextPath}/member/login">로그인</a> | 
                  <a href="${contextPath}/member/register_form">회원가입</a>
               </c:when>
               <c:otherwise>
                  ${loginUser }
               </c:otherwise>
            </c:choose>
        </div>

<!--메인 메뉴창 -->
<div id="admin_menu">

    <ul class="admin">

        <li><a href="${contextPath}/book?literature&novel">문의</a></li>
		<li><a href="${contextPath}/book?literature&novel">회원관리</a></li>
	</ul>
</div>
</header>
</body>
</html>