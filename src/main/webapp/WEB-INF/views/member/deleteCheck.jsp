<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}resources/css/search1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
.dc_title{margin-top:40px; text-align:left; margin-left:130px;}
.dc_title label{border:2px solid #ffb532; background-color:#ffb532; padding:5px 7px; font-size:20px;}
.delete form{margin:0 auto; margin-top:70px;}
.inputList{width:220px; text-align:left; margin:0 auto; font-size:17px;}
.delete button{margin-top:70px; border:1px solid #b8371b; background-color:#b8371b; color:white; padding:3px 5px;}
</style>
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
<c:import url="../default/header.jsp" />
<div class="wrap">
	<hr>
	<div class="dc_title"> 
		<label>회원 탈퇴</label> 회원 탈퇴하는 이유를 선택해주세요 
	</div>
	<div class="delete">
	<form action="deleteMember" method="post" id="deleteForm">
		<div class="inputList">
		<input type="checkbox" name="expensive" value=1>비용 부담  <br>
		<input type="checkbox" name="recentNotUse" value=1>최근들어 이용한 적이 없어서<br>
		<input type="checkbox" name="nomoreRead" value=1>이용할 컨텐츠 부족 <br>
		<input type="checkbox" name="otherSite" value=1>타사이트 이용 예정<br>
		<input type="checkbox" name="etc" value="1">기타 <br>
		<input type="hidden" name="id" value="${member.id }">
		</div>
		<button type="button" onclick="deleteMember()">탈퇴</button>
	</form>
	</div>
</div>
</body>
</html>