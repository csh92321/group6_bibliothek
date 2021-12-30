<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>successLogin</title>
<link rel="stylesheet" href="resources/css/header1.css">
<link rel="stylesheet" href="resources/css/search1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
<h3> LOGIN SUCCESS </h3>
<label> Welcome, ${loginUser }! </label>
<br>
<br>
<table>
	<tr>
		<td><a href="beforeModify">회원정보수정</a></td>
		<td><a href="${contextPath }/note/note?id=${loginUser}">쪽지</a></td>
		<td><a href="${contextPath }/personalBoard/PBlist?id=${loginUser}">1:1문의</a></td>
	</tr>
	<tr>
		<td><a href="">북리스트</a></td>
		<td><a href="">찜</a></td>
		<td><a href="">마이노트</a></td>
	<tr>
</table>
</body>
</html>
