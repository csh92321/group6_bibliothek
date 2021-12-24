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
<body>ntBoardContentView<br>


아이디 : ${detailContent.admin } <br>
글번호 : ${detailContent.writeNo }<br>
저장날짜 : ${detailContent.saveDate } <br>
제목 : ${detailContent.title }<br>
내용 : ${detailContent.content }<br>
</body>
</html>