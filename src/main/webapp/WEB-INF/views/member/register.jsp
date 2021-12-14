<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<style type="text/css">
	.id_ok{color:green; display:none;}
	.id_already{color:red; display:none;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

var final_id = "false";
var final_pwd = "false";
var final_addr = "false";
var final_phone = "false";


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
  	
function idCheck(){
	var id=$("#id").val();
	id=id.trim();
	var id_form =/^[a-z][a-z0-9_]{4,9}$/;
	if(id_form.test(id)==true){
		$.ajax({
			type:'POST',
			url:"idCheck",
			data:{id:id},
			success:function(result){
				if(result==0){
					$("#check_id").html("사용 가능한 아이디입니다").css("color","green")
					final_id="true";
				} else {
					$("#check_id").html("이미 사용중인 아이디입니다").css("color","red")
				}
			}
		})
	} else {
		$("#check_id").html("아이디의 첫글자는 영소문자, 총 5-10글자의 영소문자와 숫자,_(언더바)로 생성 가능").css("color","black")
	}
}
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

function emailCheck() {
	var email=$("#email").val();
	var emailForm=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	
	if(emailForm.test(email)==true) {
		$.ajax({
			type:'POST',
			url:"emailCheck",
			data:{email:email},
			success:function(result){
				if(result==0){
					$("#check_email").html("사용 가능한 이메일입니다").css("color","green")
					final_email="true";
				} else {
					$("#check_email").html("이미 사용중인 이메일입니다").css("color","red")
				}
			}
		})
	} else {
		$("#check_email").html("부적절한 이메일 형식입니다").css("color","red")
	}
	
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

function addr() {
	var addr = ""
	addr1 = $("#addr1").val()
	addr2 = $("#addr2").val()
	addr3 = $("#addr3").val()
	var addr = addr1 + "/" + addr2 + "/" + addr3
	document.getElementById("addr").value = addr;
	console.log(addr)
}

function birth(){
	var birth=""
	birth_year=$("#birth_year").val()
	birth_month=$("#birth_month").val()
	birth_day=$("#birth_day").val()
	var birth = birth_year+"-"+birth_month+"-"+birth_day
	document.getElementById("birth").value = birth;	//https://yejip.com/web/2020-11-25-%EA%B2%8C%EC%8B%9C%ED%8C%902/
}

function register(){
	addr()
	birth()
	
	if(final_id=="false") {
		alert('아이디를 확인해주세요')
		$("#id").focus()
	} else if(final_pwd=="false") {
		alert("비밀번호를 확인해주세요")
		$("#pwd1").focus()
	} else if($("#name").val()=="")  {
		alert("이름을 확인해주세요")
		$("#name").focus()
	} else if($("#birth_year").val()=="1960" && $("#birth_month").val()=="0" && $("#birth_day").val()=="0") {
		alert("생년월일을 확인해주세요")
	} else if($("#birth_month").val()=="0" || $("#birth_day").val()=="0"){
		alert("생년월일을 확인해주세요")
	} else if(final_phone=="false") {
		alert("전화번호를 확인해주세요")
		$("#phone").focus()
	} else if(final_email=="false"){
		alert("이메일을 확인해주세요")
		$("#email").focus()
	} else if($("#addr1").val()=="") {
		alert("주소를 확인해주세요")
		$("#addr1").focus()
	} else {
		register_form.submit();
	}
}
</script>
</head>
<body>
	<form action="register" method="post" id="register_form">
	<table>
		<caption>
			<b>회원가입</b>
		</caption>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" name="id" onkeyup="idCheck()" > <br> <span id="check_id"></span>
			</td>
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
			<td><input type="text" id="name" name="name"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
			<select id="birth_year"> <!-- 1960~2020 -->
   				<c:forEach var="year" begin="1960" end="2020">
      		 		<option>${year}</option>
    			</c:forEach>
   		 	</select>년
   		 	<select id="birth_month">
   		 		<c:forEach var="month" begin="0" end="12">
   		 			<option>${month } </option>
   		 		</c:forEach>
   		 	</select>월
   		 	<select id="birth_day">
   		 		<c:forEach var="day" begin="0" end="31">
   		 			<option>${day }</option>
   		 		</c:forEach>
   		 	</select>일
   		 	<input type="hidden" id="birth" name="birth">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td>
				<input type="text" id="phone" name="phone" placeholder="-생략" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');phoneCheck(this.value);"> <br> <span id="check_phone"></span> 
				 <!-- <input type="text" name="phone" placeholder="-생략" onkeypress="phoneCheck()" > <br> <span id="check_phone"></span>  -->
				 <!-- this.value=this.value.replace(/[^0-9]/g,''); -->
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" id="email" name="email" onkeyup="emailCheck()">  <br> <span id="check_email"></span></td>
		</tr>
		<tr>
			<th rowspan="3">주소</th>
			<td>
				<input type="text" readonly id="addr1" name="addr1">
				<input type="button" onclick="daumPost()" value="우편번호 검색">
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
			<td colspan="2"> <button type="button" onclick="register()">회원가입</button> </td>
		</tr>
	</table>	
	</form>
</body>
</html>

<!-- 아이디,비밀번호 중복 체크 : https://munhwasudo.tistory.com/entry/%EC%95%84%EC%9D%B4%EB%94%94-%EC%A4%91%EB%B3%B5%EC%B2%B4%ED%81%AC%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8%EC%B2%B4%ED%81%AC -->
<!-- 이메일 유효성 검사 : https://kimvampa.tistory.com/116 -->