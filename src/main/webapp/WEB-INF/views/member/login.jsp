<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
   <link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
   <link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
.loginform form table{margin:0 auto; margin-top:120px;}
.loginform table tr{padding:2px;}
.loginform table tr td{padding:2px;}
.input{border:2px solid #ffb532;}
.loginBtn{border:2px solid #b8371b; padding:13px; background-color:#C35134; color:white; }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
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
	win=window.open(url,"findPwd","width=500, height=400, left=100, top=100");
}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">
<hr>
	<div class="loginform">
	<form method="post" action="user_check">
		<table>
			<tr>
				<td><input class="input" type="text" id="id" name="id" value="${cookieID }" ></td>
				<td rowspan="2"><input class="loginBtn" type="submit" value="로그인"></td>
			</tr>
			<tr>
				<td><input class="input" type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
				<c:choose>
					<c:when test="${cookieID != null }">
						<input type="checkbox" name="saveId" id="saveId" onclick="checkBoxOnlyOne(this)" checked="checked"><label>&nbsp;아이디 저장</label>
					</c:when>
					<c:otherwise>
						<input type="checkbox" name="saveId" id="saveId" onclick="checkBoxOnlyOne(this)"><label>&nbsp;아이디 저장</label>
					</c:otherwise>
				</c:choose>
					&nbsp;&nbsp;
					<input type="checkbox" name="autoLogin"  onclick="checkBoxOnlyOne(this)"><label>&nbsp;자동 로그인</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label onclick="location.href='register_form'">회원가입</label> &nbsp;
					<label onclick="findId()">아이디</label>/<label onclick="findPwd()">비밀번호</label> <b>찾기</b>
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>

<c:import url="../default/footer.jsp" />
</body>
</html>