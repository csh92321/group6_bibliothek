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
<body>ntBoardContentView<br>


아이디 : ${detailContent.admin } <br>
글번호 : ${detailContent.writeNo }<br>
저장날짜 : ${detailContent.saveDate } <br>
제목 : ${detailContent.title }<br>
내용 : ${detailContent.content }<br>

<font size="5" ><b>공지사항</b></font>
	<table border="1" align="center" style="margin-top: 30px;">	
		<tr>
			<th width="70">작성자</th>
			<td width="150">${detailContent.admin }</td>
			<th width="70">등록일자</th>
			<td width="150">${detailContent.saveDate }</td>
		</tr>
		
		<tr>
			<th width="100">제목</th>
			<td colspan="3">${detailContent.title }</td>			
		</tr>
		
		<tr>
			<th>내 용</th>
			<td colspan="4">${detailContent.content }</td>
		</tr>
		<tr> 
			<td colspan="4" align="center">
	
				<input type="button" value="수정하기"
					onclick="location.href='${contextPath}/ntboard/ntModify_form?writeNo=${detailContent.writeNo }'">
				<input type="button" value="삭제하기"
					onclick="location.href='${contextPath }/ntboard/delete?writeNo=${detailContent.writeNo }'">

				<input type="button" onclick="" value="리스트로 돌가가기">
			<hr>
			
				
			</td>
		</tr>
		
		
		</table>
</body>
</html>