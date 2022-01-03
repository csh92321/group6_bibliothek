<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style>
th {
	background-color: #b8371b;
	color: white;
}



input{
	background-color: #b8371b;
	color: white;
	font-size: 13px;
	padding: 5px;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<script type="text/javascript">
function replyMsg() {
	$("#replyMsg").show();
}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />
<!--  
아이디 : ${detailContent.id } <br>
글번호 : ${detailContent.writeNo }<br>
저장날짜 : ${detailContent.saveDate } <br>
모임 인원 : ${detailContent.mCnt } <br>
제목 : ${detailContent.title }<br>
내용 : ${detailContent.content }<br>
-->

	<div id="content">
	<font size="5" ><b>랜선 모임</b></font>
	<table border="1" align="center" style="margin-top: 30px;">	
		<tr>
			<th width="70">작성자 </th>
			<td width="150">${detailContent.id }</td>
			<th width="70">등록일자</th>
			<td width="150">${detailContent.saveDate }</td>
			<th width="70">모임 인원</th>
			<td width="150">${detailContent.mCnt }</td>
		</tr>
		
		<tr>
			<th width="100">제목</th>
			<td colspan="5">${detailContent.title }</td>			
		</tr>
		
		<tr height="300">
			<th>내 용</th>
			<td colspan="5">${detailContent.content }</td>
		</tr>
		<tr> 
			<td colspan="6" align="center">
			<c:if test="${loginUser == detailContent.id }">
				
					<input type="button" value="수정하기"
						onclick="location.href='${contextPath}/board/modify_form?writeNo=${detailContent.writeNo }'">
					<input type="button" value="삭제하기"
						onclick="location.href='${contextPath }/board/delete?writeNo=${detailContent.writeNo }'">
			</c:if> 
					<input type="button" onclick="replyMsg()" value="답글달기">
					<input type="button" onclick="location.href='${contextPath}/board/boardList'" value="리스트로 돌가가기">
			<hr>
			
				
			</td>
		</tr>
		
		
		</table>
		</div>
		<div id="replyMsg" >
				<form action="reply" method="post">
					<table border="1" align="center" style="margin-top: 30px;">
						<tr>
							<td> 작성자 </td>
							<td> <input style="background-color: white" type="text" id="writer" name="writer" value="${loginUser }" readonly> </td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: left;"> 내용</td>
						</tr>
						<tr>
							<td colspan="2">
								<textarea style="width:500px" hight="300px" name="content" id="content"></textarea>
							</td>
						</tr>
					</table>
				</form>
			</div>
<c:import url="../default/footer.jsp" />
</body>
</html>