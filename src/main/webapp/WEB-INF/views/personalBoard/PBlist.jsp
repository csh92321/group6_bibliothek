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
<body>
개인 1:1문의 페이지	<br>
${id}, ${loginUser }<br>

<table border="1">
	<tr>
		<th>글번호</th>
		<th>작성날짜</th>
		<th>제목</th>
		<th>답변여부</th>
	</tr>
	<c:if test="${personalBoardList.size()==0 }">
	<tr>
		<td colspan="4">  </td>
	</tr>
	</c:if>
	<c:set var="list" value="${personalBoardList.size()+1 }" />
	<c:forEach var="personalBoardList" items="${personalBoardList }">
	<c:set var="i" value="${i+1 }" />
	<tr>
		<td> ${list-i }</td>
		<td> ${personalBoardList.savedate }</td>
		<td> ${personalBoardList.title }</td>
		<td> ${personalBoardList.replyCheck }</td>
	</tr>
	</c:forEach>
</table>

<button type="button" onclick="location.href='PBform?id=${id}'">문의하기</button>

</body>
</html>