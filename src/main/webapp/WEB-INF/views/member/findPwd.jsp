<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwd</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function findPwd() {
		var id=$("#id").val()
		var email=$("#email").val()
		var form={id:id, email:email}
		
		if(id!="" && email!=""){
			console.log(id)
			console.log(email)
			$.ajax({
				type:'POST',
				url:"findPwd",
				dataType:"json", 
				data:JSON.stringify(form),
				contentType:"application/json;charset=utf-8",
				success:function(result){
						alert("임시 비밀번호를 이메일로 발송하였습니다")
				}
			})
		} else if (id=="" && email!="") {
			$("#resultPwd").html("아이디를 입력해주세요")
		} else if (id!="" && email==""){
			$("#resultPwd").html("이메일을 입력해주세요")
		} else {
			$("#resultPwd").html("아이디와 이메일을 입력해주세요")
		}
	}
	
	function cancel(){
		console.log("닫기")
		close()
	}
</script>
</head>
<body>
<h3>비밀번호 찾기</h3> <hr>
<form action="findPwd" method="post" id="findPwd_form">
	<table>
		<tr>
			<td>아이디</td><td><input type="text" name="id" id="id"></td>
		</tr>
		<tr>
			<td>이메일</td><td><input type="text" name="email" id="email"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="findPwd()">비밀번호 찾기</button>
				<button type="button" onclick="cancel()">닫기</button>
			</td>
		</tr>
	</table>
	<hr>
	<span id="resultPwd"></span>
</form>
</body>
</html>