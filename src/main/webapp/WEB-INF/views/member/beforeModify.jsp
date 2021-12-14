<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="checkPwd" method="post">
		<table>
			<tr>
				<td> <input type="password" id="pwd" name="pwd"> </td>
			</tr>
			<tr>
				<td> <input type="submit" value="비밀번호 확인">
			</tr>
		</table>
	</form>
	
</body>
</html>