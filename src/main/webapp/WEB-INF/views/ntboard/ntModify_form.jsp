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
	<div style="width:300px; margin: 0 auto;">
		<form action="${contextPath }/ntboard/ntModify" method="post">
			<input type="hidden" name="writeNo" value="${detailContent.writeNo }">
			
			제목 <input type="text" sizw="30" name="title" value="${detailContent.title }">
			<hr align="center" style="border:solid 1px #b8371b; width:100%;">
			내용 <textarea name="content" rows="15" cols="40">${detailContent.content }</textarea>
			<hr align="center" style="border:solid 1px #b8371b; width:100%;">
			
			<input type="submit" value="수정하기">
			<input type="button" onclick="history.back()" value="돌아가기">
		</form>	
	</div>
</body>
</html>