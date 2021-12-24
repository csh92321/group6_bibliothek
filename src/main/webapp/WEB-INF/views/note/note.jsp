<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#receive{display: none;}
	#send{display: none;}
	#msg{display:none;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function receive() {
	$("#send").hide();
	$("#msg").hide();
	$("#receive").show();
}

function send() {
	$("#msg").hide();
	$("#receive").hide();
	$("#send").show();
}

function msg() {
	$("#send").hide();
	$("#receive").hide();
	$("#msg").show();
}

</script>
</head>
<body>
쪽지<br>
${id}, ${loginUser }<br>

<button type="button" onclick="receive()">받은쪽지</button>
<button type="button" onclick="send()">보낸쪽지</button>
<button type="button" onclick="msg()">쪽지보내기</button>

<br><hr><br>

<div id="view"></div>

<div id="receive">
<table border="1">
	<tr>
		<th>수/발신</th>
		<th>상대방</th>
		<th>내용</th>
		<th>날짜</th>
	</tr>
	<c:if test="${noteList_rec.size()==0 }">
	<tr>
		<td colspan="4"> </td>
	</tr>
	</c:if>
	<c:forEach var="noteList_rec" items="${noteList_rec }">
	<tr>
		<td> 수신 </td>
		<td> ${noteList_rec.sender } </td>
		<td> <a href="#"> ${noteList_rec.content }</a></td>
		<td> ${noteList_rec.savedate } </td>
	</tr>
	</c:forEach>
</table>
</div>

<div id="send">
<table border="1">
	<tr>
		<th>수/발신</th>
		<th>상대방</th>
		<th>내용</th>
		<th>날짜</th>
	</tr>
	<c:if test="${noteList_send.size()==0 }">
	<tr>
		<td colspan="4"> </td>
	</tr>
	</c:if>
	<c:forEach var="noteList_send" items="${noteList_send }">
	<tr>
		<td> 발신 </td>
		<td> ${noteList_send.receiver } </td>
		<td> <a href="#"> ${noteList_send.content }</a></td>
		<td> ${noteList_send.savedate } </td>
	</tr>
	</c:forEach>
</table>
</div>

<div id="msg">
<form method="post" action="noteMsg">
	<table>
		<tr>
			<th> 받는사람 </th>
			<td> <input type="text" id="receiver" name="receiver"> </td>
			<th> 작성자 </th>
			<td> <input type="text" id="id" name="id" value="${id }" readonly> <input type="hidden" id="sender" name="sender" value="${id }"> </td>
		</tr>
		<tr>
			<th colspan="4" style="text-align: left;"> 내용 </th>
		</tr>
		<tr>
			<td colspan="4"> <textarea rows="6" cols="65" id="content" name="content"></textarea> </td>	
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" value="전송">
				<button type="button" onclick="cancel()">취소</button> 
			</td>
		</tr>
	</table>
</form>
</div>

</body>
</html>