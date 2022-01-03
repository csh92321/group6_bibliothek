<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header1.css">
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function checkBoxOnlyOne(target) {
    document.querySelectorAll('input[type=checkbox]').forEach(el => el.checked = false);
    target.checked = true;
}
function findId(){
	var url="newpage_findId"
	win=window.open(url,"findId","width=400, height=400, left=100, top=100");
}
function findPwd(){
	var url="newpage_findPwd"
	win=window.open(url,"findPwd","width=400, height=400, left=100, top=100");
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<form method="post" action="user_check">
	<table>
		<tr>
			<td><input type="text" id="id" name="id" value="${cookieID }"></td>
			<td rowspan="2"><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td colspan="2">
			<c:choose>
				<c:when test="${cookieID != null }">
					<input type="checkbox" name="saveId" id="saveId" onclick="checkBoxOnlyOne(this)" checked="checked"><label>아이디 저장</label>
				</c:when>
				<c:otherwise>
					<input type="checkbox" name="saveId" id="saveId" onclick="checkBoxOnlyOne(this)"><label>아이디 저장</label>
				</c:otherwise>
			</c:choose>
				
				<input type="checkbox" name="autoLogin"  onclick="checkBoxOnlyOne(this)"><label>자동 로그인</label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label onclick="location.href='register_form'">회원가입</label>
				<label onclick="findId()">아이디</label>/<label onclick="findPwd()">비밀번호</label> 찾기
			</td>
		</tr>
	</table>
</form>
</body>
</html>