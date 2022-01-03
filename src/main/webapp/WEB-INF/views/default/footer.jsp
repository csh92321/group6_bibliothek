<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
</head>

<div class='footer'><!--  float속성 해제 -->
	<!--  <div id="address">
		<li><a href="#">공지사항 +</a></li>
	</div>
	-->
	<div class="footer-foot_box">
		<ul>
			
			<li>회사소개    |    이용약관    |   개인정보처리방침</li>
			<li>(주) Bibliothek 서울시 종로구 종로 3 대표이사 : 홍준모 사업자등록번호 : 123-45-67891
					<br>대표전화 : 1111-2222 (발신자 부담전화)
					<br>팩스 : 0101-010-1010 (지역번호공통) 서울시
							통신판매업신고번호 제 653호 ▶ 사업자정보확인
					<br>COPYRIGHT(C) Bibliothek CENTER ALL RIGHTS RESERVED</li>
			</ul>					
	</div>
	
	
	<div class="footer-notice">
		<ul>
			<li style="text-align: center; font-size:18px">
				<a href="${contextPath }/ntboard/ntBoardList">
					<b>공지 사항 바로가기 >> </b>
				</a>
			</li>
			<hr>
			<li style="text-align: center;">[고객센터] <br>
			TEL. 1544-0011	<br>
			- 평일 09:00 ~ 18:00 (점심 12:00 ~ 13:30) <br>
			- 토, 일, 공휴일 휴무</li>
			
		</ul>
	</div>		
	</div>
</body>
</html>