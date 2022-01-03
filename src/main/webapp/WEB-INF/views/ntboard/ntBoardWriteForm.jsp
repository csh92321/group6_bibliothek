<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.nt {
align: center;
}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
<div id="nt" align="center">
	<table border="1">
	<form action="ntWriteSave" method="POST">
		<b>작성자</b> <input type="text" name="admin" id="admin" value="${loginUser }" readonly/>
		
		<hr align="center" style="border:solid 1px #b8371b; width:20%;">
			<b>제 목</b> <input type="text" name="title" style="width: 340px">
		<hr align="center" style="border:solid 1px #b8371b; width:20%;">
			<b>내용</b>
		<hr align="center" style="border:solid 1px #b8371b; width:20%;">
			<textarea name="content" rows="15" cols="50"></textarea>
		<hr align="center" style="border:solid 1px #b8371b; width:20%;">
			<input type="submit" value="등록" /> &nbsp;
			<input type=button value="취소"
				onClick="location.href='${contextPath}/ntboard/ntBoardList'" />
	</form>
	</table>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>