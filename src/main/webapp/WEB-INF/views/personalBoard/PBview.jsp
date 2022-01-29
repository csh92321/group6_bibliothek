<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
.wrap{width:1000px; margin:0 auto; text-align:center;}
.mypage_title{margin-top:40px; text-align:left; margin-left:130px;}
.mypage_title label{border:2px solid #ffb532; background-color:#ffb532; padding:5px 7px; font-size:20px;}
.pbBoard table{margin:0 auto; width:750px; margin-top:30px;}
.pbBoard table tr th{text-align:center; padding:7px 0px; font-size:16px;}
.pbBoard_admin{width:750px; text-align:left; margin:0 auto;}
.pbBoard_admin hr{border: 0; height: 3px; background-color:#b8371b; width:750px; margin:30px auto;}
.pbBoard_admin b{font-size:16px; margin-left:45px; padding:7px 2px; border-bottom-color:#ffb532; border-bottom-style: solid; border-bottom-width: 2px; }
.ans_admin{margin-left:120px; font-weight:normal;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">
	<hr style="margin-top:30px;">
	<div class="mypage_title"> <a href="${contextPath }/personalBoard/PBlist?id=${loginUser }" style="color:black;"> <label> 1:1문의 </label></a> </div>
	<div class="pbBoard">
		<table>
			<tr>
				<th style="width:15%;"> 제목 </th>
				<td style="width:50%; text-align:left; padding:0px 10px; font-weight:bold;" > ${personalData.title } </td>
				<th style="width:15%;"> 등록일 </th>
				<td style="width:20%; text-align:left; padding:0px 10px;"> ${personalData.savedate } </td>
			</tr>
			<tr>
				<th> 내용 </th>
				<td colspan="3" style="text-align:left; padding:7px 10px;"> ${personalData.content }</td>
			</tr>
		</table>
	</div>
	<div class="pbBoard_admin">
		<br> <hr> <br>
	
		<c:choose>
		<c:when test="${personalData.replyCheck == 1 }">
			<b>관리자</b> <br> 
			<label class="ans_admin"> ${personalData.reply } </label>
		</c:when>
		<c:when test="${personalData.replyCheck == 0 }">
			<b>관리자</b> <br>
			<label class="ans_admin"> 답변이 아직 작성되지 않았습니다 </label>
		</c:when>
		</c:choose>
	</div>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>