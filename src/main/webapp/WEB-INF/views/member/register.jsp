<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>register</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	<!-- jquery -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
	function register() {
		addr1 = $("#addr1").val()
		addr2 = $("#addr2").val()
		addr3 = $("#addr3").val()
		addr = addr1 + "/" + addr2 + "/" + addr3
		$("#addr1").val(addr)
		
		birth_year=$("#birth_year").val()
		birth_month=$("#birth_month").val()
		birth_day=$("#birth_day").val()
		birth = birth_year+"-"+birth_month+"-"+birth_day
		document.getElementById("birth").value = birth;
		
		fo.submit()
	}
</script>
</head>
<body>
	<form action="register" method="post" id="fo">
	<table>
		<caption>
			<b>회원가입</b>
		</caption>
		<tr>
			<th>아이디</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="password" name="pwd"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="pwd_check"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name"></td>
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
   		 		<c:forEach var="month" begin="1" end="12">
   		 			<option>${month } </option>
   		 		</c:forEach>
   		 	</select>월
   		 	<select id="birth_day">
   		 		<c:forEach var="day" begin="1" end="31">
   		 			<option>${day }</option>
   		 		</c:forEach>
   		 	</select>일
   		 	<input type="hidden" id="birth" name="birth">
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" placeholder="-생략"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<th rowspan="3">주소</th>
			<td>
				<input type="text" readonly id="addr1" name="addr">
				<input type="button" onclick="daumPost()" value="우편번호 검색">
			</td>
		</tr>
		<tr>
			<td><input type="text" readonly id="addr2"></td>
		</tr>
		<tr>
			<td>
			<input type="text" id="addr3" placeholder="상세주소 입력">
			</td>
		</tr>
		<tr>
			<td colspan="2"> <input type="button" onclick="register()" value="회원가입">
		</tr>
	</table>	
	</form>
</body>
</html>