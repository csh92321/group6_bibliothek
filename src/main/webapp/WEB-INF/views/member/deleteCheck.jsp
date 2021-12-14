<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function deleteMember() {
		var result = confirm("정말로 회원 탈퇴하시겠습니까?")
		if(result){
			deleteForm.submit();
		} else {
			location.href="${contextPath}/"
		}
	}
</script>
</head>
<body>

<form action="deleteMember" method="post" id="deleteForm">
	<button type="button" onclick="deleteMember()">탈퇴</button>
</form>
</body>
</html>