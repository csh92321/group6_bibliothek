<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap{margin:0 auto;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	function search() {
		var search = $("#bookName").val();
		
		$.ajax({
			url : "search",
			type : "post",
			data : { search : search },
			async:false,
			success : function(list) {
				if(Object.keys(list).length == 0){
					debugger;
					$("#bookList").html("검색 결과가 없습니다")
					debugger;
				} else {
					debugger;
					$
					.each(
							list,
							function(index, item) {
								debugger;
									let html=""
									//html += "<a href=\"detail?"+item.bookNum+"\"><img class=\"product-img\" src=\"resources/coverImg/"+item.bookNum+".jpg\" /></a>"
									html += "<h4><a href=\"detail?"+item.bookNum+"\">" + item.title + "<br></a></h4>"
									html += item.writer + "/" + item.company
									debugger;
									$("#bookList").html(html)
							})
				}
			},
			error : function() {
				alert('error')
			}
		})
		debugger;
	}
</script>
</head>
<body>

<div class="wrap">

		<input type="text" id="bookName" class="bookName">
		<button class="bookSearch" id="bookSearch" onclick="search()"> <i class="fas fa-search" ></i> </button>
	

	<hr>
	<span id="bookList"></span>
</div>

</body>
</html>