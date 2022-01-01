<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
body{font-family:'Nanum Gothic', sans-serif;}
.newWindowWrap{width:450px; margin:0 auto; text-align:center;}
.littleHeader{margin:0 auto;margin-top:15px; padding-top:20px; padding-bottom:20px;}
.littleHeader label{font-size:20px; font-weight:bold; margin-left:30px;}
.littleHeader img{width:70px; height:55px; float:right; margin-right: 20px; margin-top:-18px; }
.noteReply table{width:430px; margin:0 auto;}
.noteReply table tr th{width:17.5%; }
.noteReplyBtn{border:2px solid #b8371b; color:#b8371b; background-color:white; font-size:15px; font-weight:bold;}
.cancelBtn{border:2px solix black; color:black; background-color:white; font-size:15px; font-weight:bold;}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function noteReply() {
	location.href="noteReply?noteNum="+${noteView.noteNum}
}

function cancel() {
	close()
}
</script>
</head>
<body>
<div class="newWindowWrap">
	<div class="littleHeader">
		<label>받은 쪽지함</label>
		<img src="${contextPath}/resources/images/logo.png" alt="Logo">
	</div>
	<div class="noteReply">
		<hr>
		<table>	
			<tr>
				<c:choose>
					<c:when test="${sessionId == noteView.sender }">
						<th>상대방</th>
						<td> ${noteView.receiver }</td>	
					</c:when>
					<c:when test="${sessionId != noteView.sender }">
						<th>상대방</th>
						<td style="width:25%; "> ${noteView.sender }</td>
					</c:when>
				</c:choose>
				<th>날짜</th>
				<td style="width:50%; ">${noteView.savedate } </td>
			</tr>
			<tr>
			<td colspan="4"  style="padding:15px 10px 0px 10px; text-align:left; "> ${noteView.content }</td>
			</tr>
			<tr>
				<td colspan="4" style="padding-top:30px;">
				<c:if test="${sessionId != noteView.sender }">
					<button type="button" name="noteReply" class="noteReplyBtn" onclick="noteReply()">답장</button> 
				</c:if>
					<button type="button" name="cancel" class="cancelBtn" onclick="cancel()">닫기</button>
				</td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>