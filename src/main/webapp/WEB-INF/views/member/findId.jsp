<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findId</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
body{font-family:'Nanum Gothic', sans-serif;}
.newWindowWrap{width:300px; margin:0 auto; text-align:center;}
.littleHeader{margin:0 auto;margin-top:15px; padding-top:20px; padding-bottom:20px;}
.littleHeader label{font-size:20px; font-weight:bold; margin-left:30px;}
.littleHeader img{width:70px; height:55px; float:right; margin-right: 20px; margin-top:-18px; }
.findIdForm{margin:0 auto;}
.findIdForm hr{ border: 0; height: 3px; background-color:#b8371b; margin:15px 0px 15px 0px;}
.findIdFormTable{margin:0 atuo; margin-left:30px;}
.findIdFormTable tr td{padding:5px;}
.findIdBtn{border:2px solid #b8371b; color:#b8371b; background-color:white; font-size:15px; font-weight:bold;}
.cancelBtn{border:2px solix black; color:black; background-color:white; font-size:15px; font-weight:bold;}
</style>
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
				//$("#resultId").text("아이디").css("color","black").css("font-weight","bold")
				//$("#resultId").text(" : ")
				//$("#resultId").text(result.id).css("color","blue")
				html="<label style='color:black;'> 아이디 : </label>"
				html+="<label style='color:#0F65B0; font-weight:bold;'>"
				html+= result.id
				html+= "</label>"
				$("#resultId").html(html)
			},
			error : function(){
				$("#resultId").text("해당되는 아이디가 존재하지 않습니다").css("color","red");
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
<div class="newWindowWrap">
	<div class="littleHeader">
		<label>아이디 찾기</label>
		<img src="${contextPath}/resources/images/logo.png" alt="Logo">
	</div>
	<div class="findIdForm">
 		<hr>
		<form action="findId" method="post" id="findId_form">
			<table class="findIdFormTable">
				<tr>
					<th>이름</th> <td><input type="text" name="name" id="name"></td>
				</tr>
				<tr>
					<th>이메일</th><td><input type="text" name="email" id="email"></td>
				</tr>
				<tr>
					<td colspan="2" style="padding-top: 30px;">
						<button type="button" onclick="findId()" class="findIdBtn">아이디 찾기</button>
						<button type="button" onclick="cancel()" class="cancelBtn">닫기</button>
					</td>
				</tr>
			</table>
		</form>
		<hr>
		<span id="resultId"></span>
	</div>
</div>
</body>
</html>