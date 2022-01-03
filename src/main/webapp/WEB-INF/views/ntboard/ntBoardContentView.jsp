<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style>
th {
	background-color: #b8371b;
	color: white;
}



.boardView input{
	background-color: #b8371b;
	color: white;
	font-size: 13px;
	padding: 5px;
}

.wrap {
	width: 1200px;
	margin: 0 auto;
	text-align: center;
}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
<!--  
아이디 : ${detailContent.admin } <br>
글번호 : ${detailContent.writeNo }<br>
저장날짜 : ${detailContent.saveDate } <br>
제목 : ${detailContent.title }<br>
내용 : ${detailContent.content }<br>
-->
<div class="wrap">
		<hr style="margin-top: 30px;">
<div align="center" text-color="black" style="margin-top: 40px;">
	<table border="1" align="center" style="margin-top: 30px;" class="boardView">

		<tr>
			<th width="70">작성자</th>
			<td width="150">${detailContent.admin }</td>
			<th width="70">등록일자</th>
			<td width="150">${detailContent.saveDate }</td>
		</tr>
		
		<tr>
			<th width="100">제목</th>
			<td colspan="3">${detailContent.title }</td>			
		</tr>
		
		<tr height="300">
			<th>내 용</th>
			<td colspan="4">${detailContent.content }</td>
		</tr>
		<tr> 
			<td colspan="4" align="center">
			<c:if test="${loginUser eq 'group6' }">
				<input type="button" value="수정하기"
					onclick="location.href='${contextPath}/ntboard/ntModify_form?writeNo=${detailContent.writeNo }'">
				<input type="button" value="삭제하기"
					onclick="location.href='${contextPath }/ntboard/delete?writeNo=${detailContent.writeNo }'">
			</c:if>
				<input type="button" onclick="location.href='${contextPath}/ntboard/ntBoardList'" value="리스트로 돌가가기">
			<hr>
			<br>
				
			</td>
		</tr>
		
		
		</table>
	</div>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>