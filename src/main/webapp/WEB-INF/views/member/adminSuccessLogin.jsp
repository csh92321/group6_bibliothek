<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

 a:link { color:black;text-decoration: none;}
 a:visited { color:black; text-decoration: none;}
 a:hover { color:#b8371b; bold; text-decoration: underline;}


.ac{ 
		font-size: 20px;
		padding:50px 0 80 80px;
		
		display:flex;
		width:300px;
		text-align:center;
		margin-left: auto;
		margin-right: auto;

	  }

h3{
		
		margin-left: auto;
		margin-right: auto;
		font-size:50px;
		text-align:center;
		width: 100px;
   		 height: 100px;
   	 	line-height: 100px;
   	 	display: block;
   	 	padding:0 auto;
    	text-align: center;
    
}


.admin_name{
		text-align: center;
}

</style>
<title>Admin</title>
</head>

<body>
	

		<h3>ADMIN</h3>
	
		<div class="ac">
			<a href="${contextPath }/personalBoard/PBlist?id=group6"><img src="${contextPath }/resources/images/adminQnA.png" width="200">
				<div class="admin_name">답변문의</div>
			</a>
			<a href="${contextPath }/ntboard/ntBoardList"><img src="${contextPath }/resources/images/adminNotice.png" width="200">
				<div class="admin_name">공지사항</div>
			</a>
			<a href="${contextPath }/bookPlus"><img src="${contextPath }/resources/images/bookPlus.png" width="200">
				<div class="admin_name">도서 추가</div>
			</a>
			<a href="${contextPath }/recommendModify"><img src="${contextPath }/resources/images/recommendBook.png" width="200">
				<div class="admin_name">추천도서 변경</div>
			</a>
		</div>	
	</div>
</body>