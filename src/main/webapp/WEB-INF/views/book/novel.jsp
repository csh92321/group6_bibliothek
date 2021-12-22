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
					url : "novels",
					type : "get",
					dataType : "json",
					success : function(list) {
						let html = ""
						$
								.each(
										list,
										function(index, item) {
											html += "<div class=\"product-title\">"
											html += "<div class=\"product-img-div\">"
											html += "<a href=\"detail?"+item.bookNum+"\"><img class=\"product-img\" src=\"/resources/coverImg/"+item.bookNum+".jpg\" /></a>"
											html += "<div class=\"product-letter\">"
											html += "<h3> <a href=\"detail?"+item.bookNum+"\">"
													+ item.title + "<br>"
											html += "<div class=\"small\">"
											html += item.writer + "/"
													+ item.company
													+ "</div></a> </h3>"
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
	<h3 class="subtitle">소설</h3>
	<hr>
	<body onload="getBooks();">
	<span id="books"></span>
</body>
</html>