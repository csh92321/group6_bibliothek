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
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
.mypage_title{margin-top:40px; text-align:left; margin-left:130px;}
.mypage_title label{border:2px solid #ffb532; background-color:#ffb532; padding:5px 7px; font-size:20px;}
.pbForm table{margin:0 auto; width:750px; margin-top:25px;}
.pbForm table tr{padding:}
.pbForm table tr th{text-align:center; font-size:16px; padding-left:70px;}
.pbForm table tr td{text-align:left; padding:5px 0px 5px 10px;}
.pbForm table input{width:550px;}
.pbForm table textarea{width:550px; resize: none;}
.pbForm table button{margin-top:30px; margin-left:100px;}
.saveBtn{padding:2px 3px; border:2px solid #b8371b; color:#b8371b; background-color:white; font-size:15px; font-weight:bold;}
.cancelBtn{padding:2px 3px; border:2px solix black; color:black; background-color:white; font-size:15px; font-weight:bold;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function save() {
	if($("#title").val()==""){
		alert("제목을 입력해주세요")
	} else if($("#content").val()=="") {
		alert("내용을 입력해주세요")
	} else {
		PBform.submit();
	}
}
function cancel() {
	location.href="${contextPath }/personalBoard/PBlist?id=${loginUser}"
}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">
	<hr>
	<div class="mypage_title"> <a href="${contextPath }/personalBoard/PBlist?id=${loginUser }" style="color:black;"> <label> 1:1문의 </label></a> </div>
	<div class="pbForm">
		<form action="save" id="PBform" method="post">
			<table>
				<tr>
					<td colspan="2"><input type="hidden" id="id" name="id" value="${id }"></td>
				</tr>
				<tr>
					<th style="width:20%;"> 제목 </th>
					<td style="width:80%;"> <input type="text" name="title" id="title"> </td>
				</tr>
				<tr>
					<th> 내용 </th>
					<td> <textarea rows="10" cols="50" name="content" id="content"></textarea> </td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;"> 
						<button type="button" onclick="save()" class="saveBtn">등록</button>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="cancel()" class="cancelBtn">취소</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>