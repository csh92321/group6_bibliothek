<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<body>

<form method="post" action="${contextPath }/member/user_check">
	<table>
		<tr>
			<td><input type="text" name="id"></td>
			<td rowspan="2"><input type="submit" value="로그인"></td>
		</tr>
		<tr>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="checkbox" name="saveId"><label>아이디 저장</label>
				<input type="checkbox" name="autoLogin"><label>자동 로그인</label>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>회원 가입</label>
				<label>아이디/비밀번호 찾기</label>
			</td>
		</tr>
	</table>
</form>
</body>
</html>