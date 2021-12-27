<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>ntBoardWriteForm<br>

	<form action="ntWriteSave" method="POST">
		<b>작성자</b> <input type="text" name="admin" id="admin"/>
		
		<hr>
			<b>제 목</b> <input type="text" name="title" style="width: 340px">
		<hr>
			<b>내용</b>
		<hr>
			<textarea name="content" rows="15" cols="50"></textarea>
		<hr>
			<input type="submit" value="등록" /> 
			<input type=button value="취소"
				onClick="location.href='${contextPath}/ntboard/ntBoardList'" />
	</form>
</body>
</html>