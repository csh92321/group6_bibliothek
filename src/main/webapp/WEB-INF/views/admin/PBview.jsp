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
.pbBoard table{margin:0 auto; width:750px; margin-top:30px;}
.pbBoard table tr th{text-align:center; padding:7px 0px; font-size:16px;}
.ans{color:#b8371b;}
.pbBoard_admin table{margin:0 auto; width:750px; margin-top:30px;}
</style>
<script type="text/javascript">
	function PBlistAll() {
		location.href="${contextPath}/admin/PBlistAll";
	}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">

	<div class="pbBoard">
		<table>
			<tr> 
				<th>글번호</th>
				<td>${pbView.writeNum }</td>
				<th>작성자 </th>
				<td>${pbView.id}</td>
				<th>등록일</th>
				<td>${pbView.savedate} </td>
				<th>답변여부</th>
				<td>
					<c:if test="${pbView.replyCheck==0 }"> 답변대기 </c:if>
					<c:if test="${pbView.replyCheck!=0 }"> <label class="ans"> 답변완료 </label></c:if>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${pbView.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${pbView.content} </td>
			</tr>
		</table>
	</div>
	
	<hr>
	
	<div class="pbBoard_admin">
		<form action="reply"  method="post">
		<table>
			<tr>
				<th>관리자</th>
			</tr>
			<c:choose>
				<c:when test="${pbView.replyCheck==0 }">
					<tr>	
						<td>
						<input type="hidden" name="writeNum" id="writeNum" value="${pbView.writeNum }">
						<textarea rows="10" cols="50" name="reply" id="reply"></textarea>
						</td>
					</tr>
					<tr>
						<td>
							<button type="submit">등록 </button>
						</td>
					</tr>
				</c:when>
				<c:when test="${pbView.replyCheck!=0 }">
					<tr>
						<td>${pbView.reply }</td>
					</tr>
					<tr>
						<td>
							<button type="button" onclick="PBlistAll()"> 목록 </button>
						</td>
					</tr>
				</c:when>
			</c:choose>
		</table>
		</form>
	</div>
	
</div>

</body>
</html>