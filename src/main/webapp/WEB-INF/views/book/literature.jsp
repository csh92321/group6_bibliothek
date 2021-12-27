<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/book.css" rel="stylesheet">
<script type="text/javascript">
function getgenre() {
	var urlString = decodeURI(window.location.href);
    var strArray = urlString.split('?');
    var genreArray = strArray[1].split('&');
    var genre = genreArray[0];
	$
			.ajax({
				url : "literatures",
				type : "post",
				data : {
					genre : genre
				},
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
	function getBooks() {
		var urlString = decodeURI(window.location.href);
	    var strArray = urlString.split('?');
	    var genreArray = strArray[1].split('&');
	    var genre = genreArray[1];
	    alert(genre);
		$
				.ajax({
					url : "literatures",
					type : "post",
					data : {
						genre : genre
					},
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
<body onload="getBooks();">
	<%@ include file="menu.jsp"%>
	<h3 class="subtitle">문학</h3>
	<div class="rgt">
		<div class="rgtSub">
			<ul>
				<li><a href="literature?novel">소설</a>
				<li><a href="literature?poem">시</a>
				<li><a href="literature?essay">에세이</a>
			</ul>
		</div>
	</div>
	<br>
	<h3 class="subtitle">소설</h3>
	<hr>
	<span id="books"></span>
</body>
</html>