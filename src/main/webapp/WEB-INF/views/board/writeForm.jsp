<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style>
submit{
background-color: red;
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
<div align="center">
	<table border="1">
	<form action="writeSave" method="POST">
	
		<b>작성자 ID</b> <input type="text" name="id" id="id" value="${id }" readonly/>
			<!--  <input type="text" name="id" value="${loginUser }" readonly /> -->
			<b>모임인원</b> <select name="mCnt"
				style="color: #b8371b; width: 70px; height: 23px;">
				<option>2 명</option>
				<option>3 명</option>
				<option>4 명</option>
			</select>
			<hr align="center" style="border:solid 1px #b8371b; width:20%;">
			<b>제 목</b> <input type="text" name="title" style="width: 340px">
			<hr align="center" style="border:solid 1px #b8371b; width:20%;">
			<b>내용</b>
			<hr align="center" style="border:solid 1px #b8371b; width:20%;">
			<textarea name="content" rows="15" cols="50"></textarea>
			<hr align="center" style="border:solid 1px #b8371b; width:20%;">
		
			<input type="submit" id="submit" value="등록" class="submit"/> &nbsp;
		
			<input type=button id="button" value="취소"
				onClick="location.href='${contextPath}/board/boardList'" />
	
	</form>
	</table>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>