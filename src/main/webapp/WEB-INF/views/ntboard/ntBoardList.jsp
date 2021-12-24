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
<body>ntBoardList<br>

	<table border="1">
			<tr>
				<th width="70">글 번호</th> <th width="500">제목</th> <th width="100">작성자</th> <th width="100">등록 날짜</th>
			</tr>
			<tr>
			<c:if test="${allList.size() == 0 }">
			</tr>
			<tr>
				<td colspan="4">등록된 글이 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach var="dto" items="${ntAllList }">
			<tr>
				<td>${dto.ntWriteNo}</td> <td> <a href="${contextPath}/ntBoardContentView?writeNo=${dto.writeNo}"> ${dto.title }</a></td>
				<td>${dto.admin }</td> <td>${dto.saveDate }</td>
				</tr>
			</c:forEach>
	</table>
	
		<button type="button" onclick="location.href='${contextPath}/ntboard/ntBoardWriteForm'">새 글 작성하기</button>
	
</body>
</html>