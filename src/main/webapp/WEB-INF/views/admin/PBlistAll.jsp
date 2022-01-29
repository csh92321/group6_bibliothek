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
.wrap{width:1000px; margin:0 auto; text-align:center;}
.PBlistAll table {margin:0 auto; margin-top:20px; width:750px; text-align:center; border:0;}
.PBlistAll table tr th{text-align:center; font-size:16px; border:2px solid black; padding:2px 0px;}
.PBlistAll table tr td{border:0; padding:5px 0px; font-weight:bold;}
.PBlistAll table tr td a{color:black;}
.PBlistAll table tr td a:hover{color:#ffb532; text-decoration:none;}
</style>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">

<div class="PBlistAll">
	<table border="1" >
		<tr>
			<th>글번호</th>
			<th>작성날짜</th>
			<th>작성자</th>
			<th>제목</th>
			<th>답변여부</th>
		</tr>
		<c:if test="${pbListAll.size()==0 }">
			<tr>
				<td colspan="5"></td>
			</tr>
		</c:if>
		<c:set var="list" value="${pbListAll.size()+1 }"/>
		<c:forEach var="pbListAll" items="${pbListAll }">
			<c:set var="i" value="${i+1 }" />
			<tr>
				<td> ${list-i} </td>
				<td> ${pbListAll.savedate }</td>
				<td> ${pbListAll.id } </td>
				<td><a href="PBView?writeNum=${pbListAll.writeNum }">${pbListAll.title }</a></td>
				<td>
					<c:if test="${pbListAll.replyCheck==0 }"> 답변대기 </c:if>
					<c:if test="${pbListAll.replyCheck!=0 }"> <label style="color: #b8371b;"> 답변완료 </label></c:if>
			</tr>
		</c:forEach>
	</table>
	<div align="center" style="margin-top:15px;">
		<c:forEach var="num" begin="1" end="${repeat }">
			<a href="PBlistAll?num=${num }"  style="color:#183755;"> [${num }]</a>
		</c:forEach>
	</div>
</div>

</div>

<c:import url="../default/footer.jsp"/>
</body>
</html>