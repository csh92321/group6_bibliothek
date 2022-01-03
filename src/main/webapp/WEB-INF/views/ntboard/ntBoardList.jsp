<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style>
table {
	width: 700px;
	border: 3px solid #444444;
	border-collapse: collapse;
	margin-bottom: 15px;
}

th {
	background-color: #b8371b;
	color: white;
}

td {
	background-color: #E7E7E7;
	height: 30px;
}

button {
	border-radius: 5px;
	background-color: #b8371b;
	color: white;
	font-size: 15px;
	padding: 5px;
}
a:hover {text-decoration: none; }
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.aa a{
color: #b8371b;
}
.aa a:hover {text-decoration:none; color: black;}

 }
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
<div align="center">
	<table class="aa" border="1" align="center" color="black">
			<tr>
				<th width="70" height="40">글 번호</th> <th width="500">제목</th> <th width="100">작성자</th> <th width="100">등록 날짜</th>
			</tr>
			<tr>
			<c:if test="${ntAllList.size() == 0 }">
			</tr>
			<tr>
				<td colspan="4">등록된 글이 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach var="dto" items="${ntAllList }">
			<tr>
				<td>${dto.writeNo}</td> <td> <a href="${contextPath}/ntboard/ntBoardContentView?ntWriteNo=${dto.writeNo}"> ${dto.title }</a></td>
				<td>${dto.admin }</td> <td>${dto.saveDate }</td>
				</tr>
			</c:forEach>
	</table>
	<c:if test="${loginUser eq 'group6' }">
		<button type="button" onclick="location.href='${contextPath}/ntboard/ntBoardWriteForm'">새 글 작성하기</button>
	</c:if>
	</div>
<c:import url="../default/footer.jsp" />
</body>
</html>