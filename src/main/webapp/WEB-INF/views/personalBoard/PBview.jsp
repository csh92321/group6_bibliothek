<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<tr>
		<th> 제목 </th>
		<td> ${personalData.title } </td>
		<th> 등록일 </th>
		<td> ${personalData.savedate } </td>
	</tr>
	<tr>
		<th colspan="4" style="text-align: left;"> 내용 </th>
	</tr>
	<tr>
		<td colspan="4"> ${personalData.content }</td>
	</tr>
</table>

<br> <hr> <br>

<c:choose>
	<c:when test="${personalData.replyCheck == 1 }">
		<b>관리자</b> <br>
		${personalData.reply }
	</c:when>
	<c:when test="${personalData.replyCheck == 0 }">
		<b>관리자</b> <br>
		답변이 아직 작성되지 않았습니다
	</c:when>
</c:choose>

</body>
</html>