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
<body>writeForm<br>
	<form action="writeSave" method="POST">
		<b>작성자 ID</b> <input type="text" name="id" id="id" />
			<!--  <input type="text" name="id" value="${loginUser }" readonly /> -->
			<b>모임인원</b> <select name="mCnt"
				style="color: #BC2424; width: 70px; height: 23px;">
				<option>2 명</option>
				<option>3 명</option>
				<option>4 명</option>
			</select>
			<hr>
			<b>제 목</b> <input type="text" name="title" style="width: 340px">
			<hr>
			<b>내용</b>
			<hr>
			<textarea name="content" rows="15" cols="50"></textarea>
			<hr>
			<input type="submit" value="등록" /> 
			<input type=button value="취소"
				onClick="location.href='${contextPath}/board/boardList'" />
	</form>

</body>
</html>