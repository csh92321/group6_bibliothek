<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<style>

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function clickCheck(select) {
    if(select.chkButton.disabled == true)
    	select.chkButton.disabled=false
    	else
    		select.chkButton.disabled=true
}

function pop(){
	alert("결제가 완료되었습니다.")
	document.location.href="../../";
	
}
</script>
</head>
<body>payMonth<br>
	<div class="wrap" align="center">
		
		<h1 style= "text-align:center; color:#b8371b;">[약관]</h1>
			
				<form action="payMonth" id="form" name="form" method="post">
				<textarea cols="50" rows="30" wrap="physical">
1. eBook은 인터넷을 통해 서비스를 제공합니다.
2. 회사가 제공하는 eBook 뷰어 소프트웨어를 설치하여야 이용할 수 있습니다.
3. 콘텐츠는 회사가 콘텐츠 제공자로부터 사용권한을 부여 받은 것으로 콘텐츠 제공자 또는 원 권리자에 모든 권리가 귀속되며 저작권 법령 또는 관련 지적 재산권 법률 및 조약에 의해 보호됩니다.
4. 콘텐츠 제공자의 요구에 의해 일부 eBook은 해외 지역에서 구매가 제한될 수 있습니다.
5. 회원은 콘텐츠를 구매하기 전에 구매하려는 상품의 상세 내용과 조건을 정확하게 확인해야 합니다. 구매하려는 상품의 내용과 거래 조건을 확인하지 않고 구매하여 발생한 모든 손해의 책임은 회원 본인에게 있습니다.
6. eBook은 구매 후 승인된 회원ID로만 이용이 가능하고, 타ID로 사용권한을 양도하실 수 없습니다.
7. eBook 상품은 구매 후 다운로드 받거나 한번이라도 읽었을 경우, 이미 콘텐츠를 이용한 것으로 간주하고 주문 취소가 불가능합니다. 단, 아래의 경우에 대해서는 주문 취소 및 환불이 가능합니다.
① eBook 및 서비스를 구매하였음에도 사용자 환경으로 이용이 불가하다고 판단할 경우
② eBook 서비스 중 디지털 콘텐츠를 다운로드 받지 않거나 스트리밍 서비스를 통해 열람하지 않은 경우 (결제일로부터 7일 이내에 취소를 요청하면 결제금액 전액을 환불 받을 수 있으며, 대여 및 정액서비스의 경우는 결제일로부터 7일이 지난 후 이용기한 내에 취소를 요청하면 결제금액의 90%에 해당하는 금액을 환불 받을 수 있음)
③ 회사의 귀책사유로 인해 회원이 이용기간 동안 서비스를 제공받을 수 없게 되는 경우, 회사는 회원에게 그 기간만큼 동일, 유사한 콘텐츠를 제공합니다.
8. 회사는 다음 각호에 해당하는 경우를 부정 이용행위로 봅니다.
① 동일한 ID로 5대 이상의 기기(PC, 스마트폰, 태블릿PC, 전용 단말기 등)에서 동시 접속하여 서비스를 이용하는 경우
② 자신의 ID 및 전자책, 이용권, 쿠폰, e캐시 등을 타인에게 판매, 대여, 양도하는 행위 및 이를 광고하는 경우
③ eBook 이용시 상품 전부 혹은 일부를 복사, 복제 혹은 녹화하고 이를 배포하는 경우
④ eBook 저작권을 보호하기 위해 적용된 DRM을 무력화하는 경우
⑤ 상품을 불법적으로 다운로드 받거나 이를 타인에게 제공하는 경우
9. 회사는 전항에 따른 부정 회원을 발견할 경우, 다음 각 호에 다른 조치를 취할 수 있습니다.
① 전자우편, SMS 등 전자통신을 통해 부정이용을 알리고, 해당 ID에 대한 서비스 이용을 정지시킬 수 있으며, 부정 취득 및 사용된 콘텐츠 및 결제수단은 회수 조치 및 배상을 요구할 수 있습니다.
② 부정사용이 재차 발견될 경우 회사는 위반 내용 고지와 함께 필요시 법적인 대응을 할 수 있습니다. 회사는 회원에게 30일 간의 소명기간을 부여하고, 소명기간 동안 정당한 사유를 제시하지 못할 경우, 회원등록을 말소하고 구입한 콘텐츠 및 권한을 종료할 수 있습니다.
	30일 이용 금액 : 12,900원.
				</textarea><br>		
				위 내용을 확인하였으며 결제에 대해 동의합니다. &nbsp;
				</textarea><br>		
						위 내용을 확인하였으며 결제에 대해 동의합니다. &nbsp;	동의	 	
					<input type="checkbox" id="ok" onclick="clickCheck(this.form)"/> <br>
							<table border="1" cols="2">	 
							30일 이용 금액: 12,900 원.
						<hr align="center" style="border:solid 1px #b8371b; width:50%;">
							<b>결제 수단 선택</b><br>
					<input type="checkbox" id="card" onclick="cardCheck(this.form)"/>신용카드 결제 &nbsp; <b>or</b> &nbsp;
					<input type="checkbox" id="cash" onclick="cashCheck(this.form)"/>무통장 입금 &nbsp;
					<select id="bank" name="bank" size="1">
						<option value="">은행 선택</option>
						<option value="농협은행">농협은행</option>
						<option value="국민은행">국민은행</option>
						<option value="신한은행">신한은행</option>
						<option value="우리은행">우리은행</option>
						<option value="KEB하나은행">KEB하나은행</option>
						<option value="기업은행">기업은행</option>
						<option value="대구은행">대구은행</option>
						<option value="부산은행">부산은행</option>
						<option value="우체국">경남은행</option>
						<option value="광주은행">광주은행</option>
						<option value="SC제일은행">SC제일은행</option>
						<option value="수협은행">수협은행</option>
						<option value="씨티은행">씨티은행</option>
					</select>
							
							</table>
					 <input type="button" name="chkButton" onclick="pop();" value="결제하기" disabled/> 
					 
				</td>
				</form>
			</table>
	</div>

</body>
</html>