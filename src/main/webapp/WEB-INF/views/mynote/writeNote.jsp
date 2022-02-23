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
<link rel="stylesheet" href="${contextPath}/resources/css/footer1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	function bookSearch() {
		var url = "bookSearch"
		win = window.open(url, "bookSearch", "width=500, height=800, top=110,  left=50");
	}
	
	function checkOnlyOne(target) {
		document.querySelectorAll('input[type=checkbox]').forEach(el => el.checked=false);
		target.checked=true;
	}	
	
</script>
</head>
<body>
<c:import url="../default/header.jsp" />

<div class="wrap">

<hr>

	<div class="writeForm">
		<table border="1">
			<tr>
				<td rowspan="4" style="border: 1px solid black;" > 
						<span id="imgSpace">
						<c:if test="${bookNum eq null}">
							이미지 없음
						</c:if>
						</span>
				</td>
				<th> 제목</th>
				<td colspan="3">
					<input type="hidden" id="bookNum">
					<input type="text" id="title" readonly="readonly" >
					<button class="bookSearch" id="bookSearch" onclick="bookSearch()"> <i class="fas fa-search" ></i> </button>
				</td>
			</tr>
			<tr>
				<th> 저자 </th>
				<td> 
					<input type="text" id="writer" readonly>
				</td>
				<th> 출판사</th>
				<td>
					<input type="text" id="company" readonly>
				</td>
			</tr>
			<tr>
				<th> 독서 기간 </th>
				<td colspan="3">
					<input type="date" id="startDate"> ~ <input type="date" id="endDate">
				</td>
			</tr>
			<tr>
				<th> 공개여부 </th>
				<td colspan="3">
					<input type="checkbox" id="openYN" name="openYN" value="openY" onclick="checkOnlyOne(this)" checked="checked"> 공개
					<input type="checkbox" id="openYN" name="openYN" value="openN" onclick="checkOnlyOne(this)" > 비공개   
				</td>
			</tr>
			<tr> 
				<td colspan="6"> <textarea rows="50" cols="80" id="content" class="content" > </textarea></td>
			</tr>
			<tr>
				<td colspan="6">
					<button type="button" onclick="register()">등록 </button>
					<button type="button" onclick="cancel()"> 취소 </button>
				</td>
			</tr>
		</table>
	</div>


</div>

<c:import url="../default/footer.jsp" />
</body>
</html>