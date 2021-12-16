<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/book.css" rel="stylesheet">
	<script type="text/javascript">
	function getBooks() {
		$
				.ajax({
					url : "essays",
					type : "get",
					dataType : "json",
					success : function(list) {
						console.log(list)
						let html = ""
						$
								.each(
										list,
										function(index, item) {
											html += "<div class=\"product-title\">"
											html += "<div class=\"product-img-div\">"
											html += "<a href=\"\"><img class=\"product-img\" src=\"/resources/coverImg/"+item.bookNum+".jpg\" /></a>"
											html += "<div class=\"product-letter\">"
											html += "<h3> <a href=\"\">"
													+ item.title + "<br></a>"
											html += "<div class=\"small\">"
											html += item.writer + "/"
													+ item.company
													+ "</div></h3>"
											html += "</div>"
											html += "</div>"
											html += "</div>"
										})
						$("#books").append(html)
					}
				})
	}
</script>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%@ include file="literature.jsp"%>
	<br>
	<h3 class="subtitle">에세이</h3>
	<hr>
		<button class="btn" onclick="getBooks();" type="button">검색</button>
	<body onload="getBooks();">
	<span id="books"></span>
</body>
</html>