<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function findId(){
	console.log("아이디 찾기 선택")
	var name=$("#name").val();
	var email=$("#email").val();
	var form={name:name, email:email}
	//console.log(form)

	if(name!=""&&email!=""){
		//console.log(name)
		//console.log(email)
		//findId_form.submit()
		$.ajax({
			type:'POST',
			url:"findId",
			dataType:"json", 
			data:JSON.stringify(form),
			contentType:"application/json;charset=utf-8",
			success:function(result){
				$("#resultId").text("아이디 : " + result.id)
			},
			error : function(){
				$("#resultId").text("해당되는 아이디가 존재하지 않습니다")
			}
		})
	}
}

function cancel(){
	console.log("닫기")
	close()
}
</script>
</head>
<body>
<h3>아이디 찾기</h3> <hr>
<form action="findId" method="post" id="findId_form">
	<table>
		<tr>
			<td>이름</td> <td><input type="text" name="name" id="name"></td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="text" name="email" id="email"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="findId()">아이디 찾기</button>
				<button type="button" onclick="cancel()">닫기</button>
			</td>
		</tr>
	</table>
	<hr>
	<span id="resultId"></span>
</form>
</body>
</html>