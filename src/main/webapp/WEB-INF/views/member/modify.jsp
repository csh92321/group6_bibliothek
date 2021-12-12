<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="modify" method="post" id="modify_form">
	<table>
		<caption>
			<b>회원 수정</b>
		</caption>
		<tr>
			<th>아이디</th>
			<td> <input type="text" id="id" name="id" value="${member.id }" readonly> </td>
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
			<td><input type="text" id="name" name="name" value="${member.name }" readonly >
		</tr>
		<tr>
			<th>생년월일</th>
			<td> <input type="text" id="birth" name="birth" value="${member.birth }" readonly> </td>
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
			<td><input type="text" id="email" name="email" value="${member.email }" readonly></td>
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
			<td colspan="2"> 
				<button type="button" onclick="modify()">수정</button>
				<button type="button" onclick="withdraw()">탈퇴</button> 
			</td>
		</tr>
	</table>	
	</form>
</body>
</html>