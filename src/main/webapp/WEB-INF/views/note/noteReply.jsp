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
.noteReply table{width:430px; margin:0 auto; margin-top:20px;}
.noteReply table tr th{width:80px;}
.noteReply table button{margin-left:50px; margin-top:30px;}
.noteReply table textarea{resize: none;}
.inputText{width:120px;}
.submitBtn{border:2px solid #b8371b; color:#b8371b; background-color:white; font-size:15px; font-weight:bold;}
.cancelBtn{border:2px solix black; color:black; background-color:white; font-size:15px; font-weight:bold;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	function submit() {
		var receiver=$("#receiver").val();
		var sender=$("#sender").val();
		var id=$("#id").val();
		var content=$("#content").val();
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
		close()
	}
</script>
</head>
<body>
<div class="newWindowWrap">
	<div class="littleHeader">
		<label>답장 보내기</label>
		<img src="${contextPath}/resources/images/logo.png" alt="Logo">
	</div>
	<div class="noteReply">
		<hr>
		<form id="replyForm" action="noteReplyMsg" method="post" >
			<table>
				<tr>
					<th> 받는사람 </th>
					<td> <input type="text" id="receiver" name="receiver" class="inputText" value="${noteView.sender }" readonly> </td>
					<th class="thText" > 작성자 </th>
					<td> 
						<input type="text" id="sender" name="sender" value="${noteView.receiver }" class="inputText" readonly>
						<input type="hidden" id="id" name="id" value="${sessionId }">
					</td>
				</tr>
				<tr>
					<th class="thText"> 내용 </th>
					<td colspan="3" > <textarea rows="6" cols="46" id="content" name="content"> </textarea> </td>
				</tr>
				<tr> 
					<td colspan="4">
						<input type="submit" value="전송" class="submitBtn" >
						<button type="button" onclick="cancel()" class="cancelBtn">닫기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>

