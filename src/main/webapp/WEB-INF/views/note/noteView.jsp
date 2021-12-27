<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<table>
		<tr>
			<c:choose>
				<c:when test="${sessionId == noteView.sender }">
					<th>(내가)보낸사람</th>
					<td><input type="text" id="receiver" name="receiver" value="${noteView.receiver }" readonly></td>	
				</c:when>
				<c:when test="${sessionId != noteView.sender }">
					<th>(나한테)보낸사람</th>
					<td><input type="text" id="sender" name="sender" value="${noteView.sender }" readonly></td>
				</c:when>
			</c:choose>
			<th>날짜</th>
			<td><input type="text" id="savedate" name="savedate" value="${noteView.savedate }" readonly></td>
		</tr>
		<tr>
		<td colspan="2"> ${noteView.content }</td>
		</tr>
		<tr>
			<c:if test="${sessionId != noteView.sender }">
				<td><button type="button" name="noteReply" id="noteReply" onclick="noteReply()">답장</button></td> 
			</c:if>
			<td><button type="button" name="cancel" id="cancel" onclick="cancel()">닫기</button></td>
		</tr>
	</table>

</body>
</html>