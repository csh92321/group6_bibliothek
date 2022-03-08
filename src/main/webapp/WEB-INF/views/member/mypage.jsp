<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage </title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
.mypage_title{margin-top:40px; text-align:left; margin-left:130px;}
.mypage_title label{border:2px solid #ffb532; background-color:#ffb532; padding:5px 7px; font-size:20px;}
.mypage table{margin:0 auto; margin-top:100px;}
.mypage tr td{padding:0 55px;}
.mypage tr td a{color:black;}
.mypage label{margin-top:10px;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />
<div class="wrap">
	<hr style="margin-top:30px;">
	<div class="mypage_title"> <label>MY PAGE</label> </div>
	<div class="mypage">
		<table>
			<tr>
				<td><a href="beforeModify"><img src="${contextPath}/resources/images/membermodify.jpg" alt="membermodify" width="100px"><br><label class="info"> 회원정보수정 </label></a></td>
				<td><a href="${contextPath }/note/note?id=${loginUser}"><img src="${contextPath}/resources/images/note.jpg" alt="note" width="100px"><br><label class="info"> 쪽지 </label></a></td>
				<td><a href="${contextPath }/personalBoard/PBlist?id=${loginUser}"><img src="${contextPath}/resources/images/personalBoard.jpg" alt="personalBoard" width="100px"><br><label class="info"> 1:1문의 </label></a></td>
			</tr> 
			<tr>
				<!--  
				<td><a href="">북리스트</a></td>
				<td><a href="">찜</a></td>
				-->
				<td><a href="${contextPath }/myNote/mynote?id=${loginUser}">마이노트</a></td>
			<tr>
		</table>
	</div>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>
