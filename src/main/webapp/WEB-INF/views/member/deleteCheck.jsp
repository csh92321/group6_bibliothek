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
			if($("#expensive").is(":checked")==true){
				$("#expensive").value=1
			} else {
				$("#expensive").value=0
			}
			if($("#recentNotUse").is(":checked")==true){
				$("#recentNotUse").value=1
			} else {
				$("#recentNotUse").value=0
			}
			if($("#nomoreRead").is(":checked")==true){
				$("#nomoreRead").value=1
			} else {
				$("#nomoreRead").value=0
			}
			if($("#otherSite").is(":checked")==true){
				$("#otherSite").value=1
			} else {
				$("#otherSite").value=0
			}
			if($("#etc").is(":checked")==true){
				$("#etc").value=1
			} else {
				$("#etc").value=0
			}
			deleteForm.submit();
		} else {
			location.href="${contextPath}/"
		}
	}
</script>
</head>
<body>

<form action="deleteMember" method="post" id="deleteForm">
	<input type="checkbox" name="expensive" value=1>비용 부담  <br>
	<input type="checkbox" name="recentNotUse" value=1>최근들어 이용한 적이 없어서<br>
	<input type="checkbox" name="nomoreRead" value=1>이용할 컨텐츠 부족 <br>
	<input type="checkbox" name="otherSite" value=1>타사이트 이용 예정<br>
	<input type="checkbox" name="etc" value="기타">기타 <br>
	<input type="hidden" name="id" value="${member.id }">
	<button type="button" onclick="deleteMember()">탈퇴</button>
</form>
</body>
</html>