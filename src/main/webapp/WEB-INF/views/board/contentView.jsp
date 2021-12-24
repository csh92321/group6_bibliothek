<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
ContentView<br>

아이디 : ${detailContent.id } <br>
글번호 : ${detailContent.writeNo }<br>
저장날짜 : ${detailContent.saveDate } <br>
모임 인원 : ${detailContent.mCnt } <br>
제목 : ${detailContent.title }<br>
내용 : ${detailContent.content }<br>


	<font size="5" ><b>랜선 모임</b></font>
	<table border="1" align="center" style="margin-top: 30px;">	
		<tr>
			<th width="70">작성자</th>
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
		
		<tr>
			<th>내 용</th>
			<td colspan="5">${detailContent.content }</td>
		</tr>
		<tr> 
			<td colspan="6" align="center">
	
				<input type="button" value="수정하기"
					onclick="location.href='${contextPath}/board/modify_form?writeNo=${detailContent.writeNo }'">
				<input type="button" value="삭제하기"
					inclick="location.href='${contextPath }/board/delete?writeNo=${detailContent.writeNo }'">

				
				<input type="button" onclick="slideClick()" value="답글달기">
				<input type="button" conclick="" value="리스트로 돌가가기">
			<hr>
			<div id="reply"></div>
				
			</td>
		</tr>
		
		
		</table>
</body>
</html>