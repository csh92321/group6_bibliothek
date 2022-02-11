<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="resources/css/book.css" rel="stylesheet">
<link rel="stylesheet" href="css/header1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
function recommendModify() {
	$.ajax({
		type : 'get',
		url : 'modify',
		dataType : "json",
		success : function(list) {
			let html = ""
					$.each(list, function(index, item) {
										html += "<h3 style=\"margin-top:20px; margin-left:10px\"> <a href=\"detail?"+item.bookNum+"\"> - "
												+ item.bookNum +"  "+ item.title + "</a><br>"
										html += "</h3>"
									})
					$("#recommendList").html(html)
				}
			});
}
function recommendPlus() {
	let bookNum = $("#bookNum").val();
	$.ajax({
		type : 'post',
		url : 'recommendPlus',
		data : {
			bookNum : bookNum
		},
		success : function(title) {
			if(!!title){
		    if (!confirm(bookNum+"은"+title+" 입니다. 추가하시겠습니까?")) {
		        alert(bookNum+"이 추가되지 않았습니다.");
		    } else {
		        alert(bookNum+"이 추가되었습니다.");
		    	$.ajax({
		    		type : 'post',
		    		url : 'recommendModify',
		    		data : {
		    			bookNum : bookNum
		    		},
		    		success : function(list) {
		    			let html = ""
		    					$.each(list, function(index, item) {
		    										html += "<h3 style=\"margin-top:20px; margin-left:10px\"> <a href=\"detail?"+item.bookNum+"\"> - "
		    												+ item.bookNum +"  "+ item.title + "</a><br>"
		    										html += "</h3>"
		    									})
		    					$("#recommendList").html(html)
		    				}
		    			});
		    }
			} else if (!title) {
				alert(bookNum+"은 등록되어있지 않습니다.")
			}
				}
			});
}
function recommendDelete() {
	let bookNum = $("#bookNum").val();
	$.ajax({
		type : 'post',
		url : 'recommendPlus',
		data : {
			bookNum : bookNum
		},
		success : function(title) {
			if(!!title){
				$.ajax({
					type : 'post',
					url : 'recommendCheck',
					data : {
						bookNum : bookNum
					},
					success : function(result) {
						if(!!result){
		    if (!confirm(bookNum+"은"+title+" 입니다. 삭제하시겠습니까?")) {
		        alert(bookNum+"이 삭제되지 않았습니다.");
		    } else {
		        alert(bookNum+"이 삭제되었습니다.");
		    	$.ajax({
		    		type : 'post',
		    		url : 'recommendDelete',
		    		data : {
		    			bookNum : bookNum
		    		},
		    		success : function(list) {
		    			let html = ""
		    					$.each(list, function(index, item) {
		    										html += "<h3 style=\"margin-top:20px; margin-left:10px\"> <a href=\"detail?"+item.bookNum+"\"> - "
		    												+ item.bookNum +"  "+ item.title + "</a><br>"
		    										html += "</h3>"
		    									})
		    					$("#recommendList").html(html)
		    				}
		    			});
		    }
						} else if (!result) {
							alert(bookNum+"은 추천 리스트에 등록되어있지 않습니다.");
						}
		    }
				});
			} else if (!title) {
				alert(bookNum+"은 등록되어있지 않습니다.")
			}
				}
			});
}
</script>
</head>
<body onload="recommendModify();">
<%@ include file="../default/header.jsp" %>
	<h3 style="margin-top:50px; margin-bottom:30px;">현재 추천 도서 목록</h3>
	<span id="recommendList"></span>	
	<input class="input" type="text" style="margin-top:50px" id="bookNum" >
	<button class="btn" onclick="recommendPlus();" type="button">추가</button>
	<button class="btn" onclick="recommendDelete();" type="button">삭제</button>
	<br>
	<a href="${contextPath }/member/user_check"><button class="btn" type="button" style="margin-top:30px;">돌아가기</button></a>
</body>
</html>