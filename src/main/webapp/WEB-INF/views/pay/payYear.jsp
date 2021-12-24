<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function clickCheck(select) {
    if(select.chkButton.disabled == true)
    	select.chkButton.disabled=false
    	else
    		select.chkButton.disabled=true
}

</script>
</head>
<body>payYear<br>
	<div class="wrap">
		
				<h1 style= "text-align:center">[약관]</h1>
				<form name="form">
				<textarea cols="50" rows="30" wrap="physical">
				1년동안 이용할 수 있으며 어쩌고 저쩌고 블라블라 dddddddddddddddddddddddddddddddd 가격은 129,000원입니당.
				</textarea><br>		
						동의		 	
					<input type="checkbox" id="ok" onclick="clickCheck(this.form)"/> 
								 
					 <button type="button"; name="chkButton"; onclick="location.href='/pay/payMentYear'"  disabled>결제하기</button> 

				</td>
				</form>
	</div>
</body>
</html>