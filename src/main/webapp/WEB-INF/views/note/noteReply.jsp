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

	function submit() {
		var receiver=${"#receiver"}.val();
		var sender=${"#sender"}.val();
		var id=${"#id"}.val();
		var content=${"#content"}.val();
		let form={id:id, sender:sender, receiver:receiver, content:content};
		$.ajax({
			type:'POST',
			url:"noteReplyMsg",
			data:JSON.stringify(form),
			contentType : "application/json; charset=utf-8",
			success:function(result){
				alert("답장 완료")
				close()
			}
		})
	}


	function cancel() {
		close();
	}
</script>
</head>
<body>

<form id="replyForm" action="noteReplyMsg" method="post" >
	<table>
		<tr>
			<th> 받는사람 </th>
			<td> <input type="text" id="receiver" name="receiver" value="${noteView.sender }" readonly> </td>
			<th> 작성자 </th>
			<td> 
				<input type="text" id="sender" name="sender" value="${noteView.receiver }" readonly>
				<input type="hidden" id="id" name="id" value="${sessionId }">
			</td>
		</tr>
		<tr>
			<th colspan="4" style="text-align:left;"> 내용 </th>
		</tr>
		<tr>
			<td colspan="4" > <textarea rows="6" cols="65" id="content" name="content"> </textarea> </td>
		</tr>
		<tr> 
			<td colspan="2">
				<input type="submit" value="전송">
				<button type="button" onclick="cancel()"> 닫기 </button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>

