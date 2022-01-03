<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<style>
table {
	width: 700px;
	border: 3px solid #444444;
	border-collapse: collapse;
	margin-bottom: 15px;
}

th {
	background-color: #b8371b;
	color: white;
}

td {
	background-color: #E7E7E7;
	height: 30px;
}

button {
	border-radius: 5px;
	background-color: #b8371b;
	color: white;
	font-size: 15px;
	padding: 5px;
}

.aa{
	margin-top:40px;
}

.aa a{
color: #b8371b;
}
.aa a:hover {text-decoration:none; color: black;}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/search1.css">
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
	
	function writeForm(){
		var loginUser = $("#loginUser").val()
		if(loginUser == ""){
			alert('로그인 후 이용 가능합니다.')
			location.href='${contextPath}/member/login'
		}else{
			location.href='${contextPath}/board/writeForm?id='+loginUser
		}
	}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />
<div class="wrap">
<hr style="margin-top:30px;">

<input type="hidden" name="loginUser" id="loginUser" value="${loginUser }">
<div align="center">
<table class="aa" border="1" align="center">
			<tr>
				<th width="70" height="40">글 번호</th> <th width="500">제목</th> <th width="100">작성자 ID</th> <th width="100">등록 날짜</th>
			</tr>
			<tr>
			<c:if test="${allList.size() == 0 }">
			</tr>
			<tr>
				<td colspan="4">등록된 글이 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach var="dto" items="${allList }">
			<tr>								<!-- 1. a tag로 제목 선택했을 때, primary key인 writeNo를 가지고 해당 디테일 페이지로 이동 -->
												<!-- ?가 있다면 GetMapping으로 전달시켜줘야한다 (POST는 전체적인 내용이 많을 때) -->
				<td>${dto.writeNo}</td> <td> <a href="${contextPath}/board/contentView?writeNo=${dto.writeNo}"> ${dto.title } </a></td> 
				<td>${dto.id }</td> <td>${dto.saveDate }</td>
				</tr>
			</c:forEach>
		</table>
			
		
			<!-- <button type="button" onclick="location.href='${contextPath}/board/writeForm'">새 글 작성하기</button>  -->
			<button type="button" onclick="writeForm()">새글 작성하기</button>
		
	</div>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>