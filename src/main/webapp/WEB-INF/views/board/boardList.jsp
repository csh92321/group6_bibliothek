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
<body>boardList<br>

<table border="1">
			<tr>
				<th width="70">글 번호</th> <th width="500">제목</th> <th width="100">작성자 ID</th> <th width="100">등록 날짜</th>
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
			
		
			<button type="button" onclick="location.href='${contextPath}/board/writeForm'">새 글 작성하기</button>
		
	
</body>
</html>