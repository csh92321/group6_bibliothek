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
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
.mypage_title{margin-top:40px; text-align:left; margin-left:130px;}
.mypage_title label{border:2px solid #ffb532; background-color:#ffb532; padding:5px 7px; font-size:20px;}
.Btns{float:left; width:250px; height:400px; margin-left:140px; margin-top:20px; border-right-color: gray; border-right-style: solid; border-right-width: 1px;}
.Btns button{margin:20px 0px; padding:1px 2px; border:2px solid #ffb532; color:#ffb532; background-color:white; font-weight:bold; font-size:16px; padding:3px 5px;}
.views{width:600px; margin-top:40px; margin-left:480px;}
.views table{width:600px;}
.views img{width:28px; height:28px;}
.readNote table tr th{text-align:center; font-size:16px; padding:10px 0px; border-bottom-color: gray; border-bottom-style: solid; border-bottom-width: 1px; }
.readNote table tr td{text-align:left; padding:3px 5px;}
.readNote table a{text-decoration:none;}
.txt_line { width:250px; padding:0 5px; overflow:hidden; text-overflow:ellipsis; white-space:nowrap; }
#send{display: none;}
#send a{color:black; }
#msg{display:none;}
#msg table tr th{text-align:center; font-size:16px; padding:10px 5px;}
#msg table input{width:190px;}
#msg table textarea{resize: none;}
#msg table button{margin-left:100px;}
.msgBtn{border:2px solid #b8371b; color:#b8371b; background-color:white; font-size:15px; font-weight:bold; padding:2px 5px;}
.cancelBtn{border:2px solix black; color:black; background-color:white; font-size:15px; font-weight:bold; padding:2px 5px;}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function receive(){
	$("#receiver").val("");
	$("#content").val("");	
	$("#send").hide();
	$("#msg").hide();
	$("#receive").show();
}

function send() {
	$("#receiver").val("");
	$("#content").val("");	
	$("#receive").hide();
	$("#msg").hide();
	$("#send").show();
}

function msg(){
	$("#receive").hide();
	$("#send").hide();
	$("#msg").show();
}



function noteMsg() {
	var id=$("#receiver").val()
	if(id != "") {
		$.ajax({
			type:'POST',
			url:"${contextPath}/member/idCheck",
			data:{id:id},
			success:function(result){
				if(result==0) {
					alert('존재하는 사용자가 아닙니다')
				} else {
					noteMsg_form.submit()
				}
			}
		})	
	} else {
		alert('쪽지 받을 사용자를 입력해주세요')
		$("#receiver").focus()
	}
}


function cancel() {
	location.href="${contextPath }/note/note?id=${loginUser}"
}

</script>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">
	<hr>
	<div class="mypage_title"> <label>쪽지</label> </div>
	<input type="hidden" id="sessionId" name="sessionId" value="${id }">
	<div class="Btns">
		<button type="button" onclick="receive()">받은 쪽지함</button> <br>
		<button type="button" onclick="send()">보낸 쪽지함</button> <br>
		<button type="button" onclick="msg()">쪽지 보내기</button> <br>
	</div>

	<div class="views">
		<div class="readNote">
			<div id="receive">
				<table>
					<tr>
						<th style="width:7%;"> </th>
						<th style="width:14%;">상대방</th>
						<th style="width:53%;">내용</th>
						<th style="width:26%;">날짜</th>
					</tr>
					<c:if test="${noteList_rec.size()==0 }">
					<tr>
						<td colspan="4"> </td>
					</tr>
					</c:if>
					<c:forEach var="noteList_rec" items="${noteList_rec }">
					<tr>
						<td> <img src="${contextPath}/resources/images/noteRec.JPG" alt="noteRec"> </td>
						<td> ${noteList_rec.sender } </td>
						<td style="padding-left:20px;">
						<div class="txt_line"> 
						<c:choose>
							<c:when test="${noteList_rec.readYN==0 }">
			 					<a style="color: black;" href="noteView?noteNum=${noteList_rec.noteNum }" onclick="window.open(this.href,'noteView','width=500, height=400, left=100, top=100'); return false;"> ${noteList_rec.content } </a>
			 				</c:when> 
			 				<c:otherwise>
			 					<a style="color: gray;" href="noteView?noteNum=${noteList_rec.noteNum }" onclick="window.open(this.href,'noteView','width=500, height=400, left=100, top=100'); return false;"> ${noteList_rec.content } </a>
			 				</c:otherwise>
			 			</c:choose>
						</div>
						</td>
						<td> ${noteList_rec.savedate } </td>
					</tr>
					</c:forEach>
				</table>
			</div>

			<div id="send">
				<table>
					<tr>
						<th style="width:7%;"> </th>
						<th style="width:14%;">상대방</th>
						<th style="width:53%;">내용</th>
						<th style="width:26%;">날짜</th>
					</tr>
					<c:if test="${noteList_send.size()==0 }">
					<tr>
						<td colspan="4"> </td>
					</tr>
					</c:if>
					<c:forEach var="noteList_send" items="${noteList_send }">
					<tr>
						<td> <img src="${contextPath}/resources/images/noteSend.JPG" alt="noteSend"> </td>
						<td> ${noteList_send.receiver } </td>
						<td style="padding-left:20px;">  
						<div class="txt_line">
							<a href="noteView?noteNum=${noteList_send.noteNum }" onclick="window.open(this.href,'noteView','width=500, height=400, left=100, top=100'); return false;">${noteList_send.content } </a>
						</div>
						</td>
						<td> ${noteList_send.savedate } </td>
					</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="msg">
			<form id="noteMsg_form" method="post" action="noteMsg">
				<table>
					<tr>
						<th> 받는사람 </th>
						<td> <input type="text" id="receiver" name="receiver"> </td>
						<th> 작성자 </th>
						<td> <input type="text" id="id" name="id" value="${id }" readonly> <input type="hidden" id="sender" name="sender" value="${id }"> </td>
					</tr>
					<tr>
						<th style="padding-bottom: 190px;"> 내용 </th>
						<td colspan="3"> <textarea rows="10" cols="65" id="content" name="content"></textarea> </td>	
					</tr>
					<tr>
						<td colspan="4" style="padding-top:30px;">
							<button type="button" onclick="noteMsg()" class="msgBtn">전송</button>
							<button type="button" onclick="cancel()" class="cancelBtn">취소</button> 
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</div>
</body>
</html>