<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}resources/css/header1.css">
<link rel="stylesheet" href="${contextPath}resources/css/search1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
.wrap{width:1200px; margin:0 auto; text-align:center;}
.modify_title{margin-top:40px; text-align:left; margin-left:130px;}
.modify_title label{border:2px solid #ffb532; background-color:#ffb532; padding:5px 7px; font-size:20px;}
.modify form table{margin:0 auto; margin-top:70px;}
.modify table tr th{font-size:16px;text-align:right;width:700px; padding:3px 10px 3px 0px;}
.modify table tr td{padding:3px 0px 3px 10px; text-align:left; width:700px;}
.modify table tr td input{width:190px; text-align:center;}
.modify table tr td button{width:60px; height:30px; border:2px solid #b8371b; background-color:#b8371b; color:white;}
#addr1{width:115px;}
#zoneCodeBtn{width:70px; border:2px solid #ffb532; background-color:#FFDA98;}
#modifyTd{padding-top:40px; text-align:center; padding-left:135px;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function pwdCheck() {
	var pwd1=$("#pwd1").val();
	var pwd2=$("#pwd2").val();
	
	pwd1=pwd1.trim();
	pwd2=pwd2.trim();
	
	var pwd_form=/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	if(pwd_form.test(pwd1)==true) {
		if (pwd1 != pwd2) {
			$("#check_pwd2").html("비밀번호가 일치하지 않습니다").css("color","red")
		} else {
			$("#check_pwd1").html("")
			$("#check_pwd2").html("")
			final_pwd="true";
		}
	} else {
		$("#check_pwd1").html("비밀번호는 숫자,문자,특수문자 포함 8-15자리로 생성 가능").css("color","black")
	}	
}

function daumPost(){
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
               // R : 도로명, J : 지번
               console.log("data.userSelectedType : " +data.userSelectedType)
               console.log("data.roadAddress : " +data.roadAddress)
               console.log("data.jibunAddress : " +data.jibunAddress)
               console.log("data.zonecode(우편번호) : " +data.zonecode)
               var addr=""
               if(data.userSelectedType ==='R'){
                  addr = data.roadAddress
               }else{
                  addr = data.jibunAddress
               }
             $("#addr1").val(data.zonecode)
             $("#addr2").val(addr)
             $("#addr3").focus()
        }
    }).open();
}

function addr() {
	var addr = ""
	addr1 = $("#addr1").val()
	addr2 = $("#addr2").val()
	addr3 = $("#addr3").val()
	var addr = addr1 + "/" + addr2 + "/" + addr3
	document.getElementById("addr").value = addr;
	console.log(addr)
}

function phoneCheck() {
	var phone=$("#phone").val();
	var phoneForm=/^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/
	if(phoneForm.test(phone)==true) {
		$("#check_phone").html("")
		$.ajax({
			type:'POST',
			url:"phoneCheck",
			data:{phone:phone},
			success:function(result){
				if(result==0){
					$("#check_phone").html("사용 가능한 번호입니다").css("color","green")
					final_phone="true";
				} else {
					$("#check_phone").html("이미 사용중인 번호입니다").css("color","red")
				}
			}
		})
	} else {
		$("#check_phone").html("잘못된 전화번호 형식입니다").css("color","red")
	}
	
}

function modify() {
	addr();
	if($("#pwd1").val()==""){ 
		alert("비밀번호를 입력해주세요")
		$("#pwd1").focus()
	} else if($("#pwd2").val()==""){
		alert('비밀번호를 다시 확인해주세요')
		$("#pwd2").focus()
	} else if($("#addr1").val()=="") {
		alert("주소를 확인해주세요")
		$("#addr1").focus()
	} else {
		modify_form.submit();
	}
}

function deleteMember() {
	var result = confirm("회원 탈퇴하시겠습니까?")
	if(result){
		location.href="${contextPath}/member/deleteCheck"
	} else {
		location.href="${contextPath}/"
	}
}
</script>
</head>
<body>
<c:import url="../default/header.jsp" />
<div class="wrap">
	<hr>
<div class="modify_title"> <label>회원 정보 수정</label> </div>
<div class="modify">
	<form action="modify" method="post" id="modify_form">
		<table>
			<tr>
				<th>아이디</th>
				<td> <input type="text" id="id" name="id" value="${member.id }" style="background-color: #E5E5E5;" readonly> </td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd" id="pwd1" onkeyup="pwdCheck()"> <br> <span id="check_pwd1"> </span></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td>
					<input type="password" name="pwd_check" id="pwd2" onkeyup="pwdCheck()"> <br> <span id="check_pwd2"></span>
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name" value="${member.name }" style="background-color: #E5E5E5;" readonly >
			</tr>
			<tr>
				<th>생년월일</th>
				<td> <input type="text" id="birth" name="birth" value="${member.birth }" style="background-color: #E5E5E5;" readonly> </td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="phone" name="phone" placeholder="-생략" value="${member.phone }" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');phoneCheck(this.value);" > <br> <span id="check_phone"></span> 
				 	<!-- <input type="text" name="phone" placeholder="-생략" onkeypress="phoneCheck()" > <br> <span id="check_phone"></span>  -->
				 	<!-- this.value=this.value.replace(/[^0-9]/g,''); -->
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="email" name="email" value="${member.email }" style="background-color: #E5E5E5;" readonly></td>
			</tr>
			<tr>
				<th rowspan="3">주소</th>
				<td>
					<input type="text" readonly id="addr1" name="addr1">
					<input type="button" onclick="daumPost()" value="우편번호" id="zoneCodeBtn">
				</td>
			</tr>
			<tr>
				<td><input type="text" readonly id="addr2"></td>
			</tr>
			<tr>
				<td>
					<input type="text" id="addr3" placeholder="상세주소 입력">
					<input type="hidden" id="addr" name="addr">
				</td>
			</tr>
			<tr>
				<td colspan="2" id="modifyTd"> 
					<button type="button" onclick="modify()">수정</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;					
					<button type="button" onclick="deleteMember()">탈퇴</button> 
				</td>
			</tr>
		</table>	
	</form>
</div>
</div>
</body>
</html>