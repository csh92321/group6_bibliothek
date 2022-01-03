<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.pbBoard table{margin:0 auto; margin-top:20px; width:750px; text-align:center; border:0;}
.pbBoard table tr th{text-align:center; font-size:16px; border:2px solid black; padding:2px 0px;}
.pbBoard table tr td{border:0; padding:5px 0px; font-weight:bold;}
.pbBoard table tr td a{color:black;}
.pbBoard table tr td a:hover{color:#ffb532; text-decoration: none;}
.pbBoard button{margin-left:680px; margin-top:10px; border:2px solid #b8371b; color:#b8371b; background-color:white; font-size:15px; font-weight:bold; padding:2px 5px;}
.ans{color:#b8371b;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">
	<hr>
	<div class="mypage_title"> <label>1:1문의</label> </div>
	<div class="pbBoard">
		<button type="button" onclick="location.href='PBform?id=${id}'">문의하기</button>
		<table border="1">
			<tr>
				<th style="width:10%;">글번호</th>
				<th style="width:20%;">작성날짜</th>
				<th style="width:50%;">제목</th>
				<th style="width:20%;">답변여부</th>
			</tr>
			<c:if test="${personalBoardList.size()==0 }">
			<tr>
				<td colspan="4">  </td>
			</tr>
			</c:if>
			<c:set var="list" value="${personalBoardList.size()+1 }" />
			<c:forEach var="personalBoardList" items="${personalBoardList }">
			<c:set var="i" value="${i+1 }" />
			<tr>
				<td> ${list-i }</td>
				<td> ${personalBoardList.savedate }</td>
				<td><a href="PBview?writeNum=${personalBoardList.writeNum}">${personalBoardList.title }</a> </td>
				<td>
		 			<c:if test="${personalBoardList.replyCheck==0 }"> 답변대기 </c:if>
		 			<c:if test="${personalBoardList.replyCheck!=0 }"> <label class="ans"> 답변완료 </label> </c:if>
		 		</td>
			</tr>
			</c:forEach>
		</table>
		<div align="center" style="margin-top:15px;">
			<c:forEach var="num" begin="1" end="${repeat}">	<!-- repeat:전체 페이지 갯수 -->
				<a href="PBlist?id=${loginUser }&num=${num }" style="color:#183755;"> [${num }]</a>
			</c:forEach>
		</div>
	</div>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>