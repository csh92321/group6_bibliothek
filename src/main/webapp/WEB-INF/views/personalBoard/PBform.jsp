<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function save() {
	if($("#title").val()==""){
		alert("제목을 입력해주세요")
	} else if($("#content").val()=="") {
		alert("내용을 입력해주세요")
	} else {
		PBform.submit();
	}
}
</script>
</head>
<body>
1:1문의 작성<br>
${id }, ${loginUser }<br>

<form action="save" id="PBform" method="post">
	<table>
		<tr>
			<td colspan="2"><input type="hidden" id="id" name="id" value="${id }">${id }</td>
		</tr>
		<tr>
			<th> 제목 </th>
			<td> <input type="text" name="title" id="title"> </td>
		</tr>
		<tr>
			<th> 내용 </th>
			<td> <textarea rows="10" cols="50" name="content" id="content"></textarea> </td>
		</tr>
		<tr>
			<td colspan="2"> 
				<button type="button" onclick="save()">등록</button>
				<button type="button" onclick="cancel()">취소</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>