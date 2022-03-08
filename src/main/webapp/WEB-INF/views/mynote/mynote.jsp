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
.wrap{width:1200px; margin:0 auto; text-align:center;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function writeMyNote() {
		location.href="${contextPath}/myNote/writeNote";
	}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">

<hr>

<table border="1">
	<tr>
		<th>글번호</th>
		<th>작성일</th>
		<th>공개여부</th>
		<th>책 제목</th>
		<th>조회수</th>
	</tr>
	<c:if test="${mynoteList.size()==0 }">
	<tr>
		<td colspan="5"> 작성된 마이노트가 없습니다 </td>
	</tr>
	</c:if>
	<c:set var="list" value="${mynoteList.size()+1 }" />
	<c:forEach var="mynoteList" items="${mynoteList }">
	<c:set var="i" value="${i+1 }" />
	<tr>
		<td> ${list-i } </td>
		<td> ${mynoteList.savedate }</td>
		<td>
			<c:if test="${mynoteList.open == 0 }"> 비공개 </c:if>
			<c:if test="${mynoteList.open != 0 }"> 공개 </c:if> 
		</td>
		<td> ${mynoteList.title } </td>
		<td>  
			<c:if test="${mynoteList.open == 0 }"> 0 </c:if>
			<c:if test="${mynoteList.open != 0 }"> ${mynoteList.hit } </c:if> 
		</td>
	</tr>
	</c:forEach>
</table>


<button type="button" onclick="writeMyNote()">마이노트 작성하기</button>


</div>

<c:import url="../default/footer.jsp" />
</body>
</html>