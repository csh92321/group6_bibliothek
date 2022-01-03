<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
.mypage_title{margin-top:40px; text-align:left; margin-left:130px;}
.mypage_title label{border:2px solid #ffb532; background-color:#ffb532; padding:5px 7px; font-size:20px;}
.beforModify table{margin:0 auto; margin-top:100px;}
#pwd{border:6px solid #ffb532; width:220px; height:45px; margin-bottom:15px;}
.submit{border:2px solid #b8371b; color:#b8371b; background-color:white; padding:2px 5px; font-size:15px; font-weight: bold;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
<div class="wrap">
	<hr style="margin-top:30px;">
	<div class="mypage_title"> <label>MY PAGE</label> </div>
	<div class="beforModify">
	<form action="checkPwd" method="post">
		<table>
			<tr>
				<td> <input type="password" id="pwd" name="pwd"> </td>
			</tr>
			<tr>
				<td> <input class="submit" type="submit" value="비밀번호 확인">
			</tr>
		</table>
	</form>
	</div>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>