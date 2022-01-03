<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findPwd</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
body{font-family:'Nanum Gothic', sans-serif;}
.newWindowWrap{width:300px; margin:0 auto; text-align:center;}
.littleHeader{margin:0 auto;margin-top:15px; padding-top:20px; padding-bottom:20px;}
.littleHeader label{font-size:20px; font-weight:bold; margin-left:30px;}
.littleHeader img{width:70px; height:55px; float:right; margin-right: 20px; margin-top:-18px; }
.findPwdForm{margin:0 auto;}
.findPwdForm hr{ border: 0; height: 3px; background-color:#b8371b; margin:15px 0px 15px 0px;}
.findPwdFormTable{margin:0 atuo; margin-left:30px;}
.findPwdFormTable tr td{padding:5px;}
.findPwdBtn{border:2px solid #b8371b; color:#b8371b; background-color:white; font-size:15px; font-weight:bold;}
.cancelBtn{border:2px solix black; color:black; background-color:white; font-size:15px; font-weight:bold;}
</style>
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
					if(result == 0) {
						$("#resultPwd").html("존재하는 아이디가 없습니다").css("color","#b8371b")
					} else if(result == -1) {
						$("#resultPwd").html("존재하는 이메일이 없습니다").css("color","#b8371b")
					} else {
						alert("임시 비밀번호를 이메일로 발송하였습니다")
					}
				}, 
			})
		} else if (id=="" && email!="") {
			$("#resultPwd").html("아이디를 입력해주세요").css("color","#b8371b")
		} else if (id!="" && email==""){
			$("#resultPwd").html("이메일을 입력해주세요").css("color","#b8371b")
		} else {
			$("#resultPwd").html("아이디와 이메일을 입력해주세요").css("color","#b8371b")
		}
	}
	
	function cancel(){
		console.log("닫기")
		close()
	}
</script>
</head>
<body>
<div class="newWindowWrap">
	<div class="littleHeader">
		<label>비밀번호 찾기</label>
		<img src="${contextPath}/resources/images/logo.png" alt="Logo">
	</div>
	<div class="findPwdForm">
		<hr>
		<form action="findPwd" method="post" id="findPwd_form">
			<table class="findPwdFormTable">
				<tr>
					<th>아이디</th><td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<th>이메일</th><td><input type="text" name="email" id="email"></td>
				</tr>
				<tr>
					<td colspan="2" style="padding-top: 30px;">
						<button type="button" onclick="findPwd()" class="findPwdBtn">비밀번호 찾기</button>
						<button type="button" onclick="cancel()" class="cancelBtn">닫기</button>
					</td>
				</tr>
			</table>
	</form>
	<hr>
	<span id="resultPwd"></span>
	</div>
</div>
</body>
</html>