<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/book.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/header1.css">
<link rel="stylesheet" href="resources/css/search1.css">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<script type="text/javascript">
function getKorean() {
	var urlString = decodeURI(window.location.href);
    var strArray = urlString.split('?');
    var genreArray = strArray[1].split('&');
    var genre = genreArray[0];
	$
			.ajax({
				url : "korean",
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
										html += "<h3 class=\"subtitle\">"+item.korean+"</h3>"	
									})			
					$("#korean").append(html)
				}
			})
}
function getKoreanD() {
	var urlString = decodeURI(window.location.href);
    var strArray = urlString.split('?');
    var genreArray = strArray[1].split('&');
    var genre = genreArray[1];
	$
			.ajax({
				url : "koreanD",
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
										html += "<h3 class=\"subtitle\">"+item.korean+"</h3>"	
									})			
					$("#koreanD").append(html)
				}
			})
}
function getgenre() {
	var urlString = decodeURI(window.location.href);
    var strArray = urlString.split('?');
    var genreArray = strArray[1].split('&');
    var genre = genreArray[0];
	$
			.ajax({
				url : "genre",
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
										html += "<a href=\"book?"+item.division+"&"+item.genre+"\">"+item.korean+"</a>&emsp;&emsp;&emsp;"
									})			
					$("#genre").append(html)
				}
			})
}
	function getBooks() {
		var urlString = decodeURI(window.location.href);
	    var strArray = urlString.split('?');
	    var genreArray = strArray[1].split('&');
	    var genre = genreArray[1];
		$
				.ajax({
					url : "books",
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
<body onload="getBooks(); getgenre(); getKoreanD(); getKorean();">
	<%@ include file="../header.jsp" %>
	<div class="container">
	<div class="item item1">
	<div class="gap-box-book"></div>
	<span id="korean"></span></div>
	<div class="item item2">
	<div id="book">
		<ul>
		<li><span id="genre"></span>
		</ul>
	</div>
			<div class="gap-box-book"></div>
	</div>

	<div class="item item3">
	<div class="item item3-box1">
	<span id="koreanD"></span>
	</div>
	<div class="item item3-box2">
	<form>
		<select id="range" name="range">
		<option value="">인기순▲</option>
		<option value="">인기순▽</option>
		<option value="">신작순▲</option>
		<option value="">신작순▽</option>
		<option value="">평점순▲</option>
		<option value="">평점순▽</option>
		<option value="">이름순▲</option>
		<option value="">이름순▽</option>
		</select>
	</form>

	</div>
	</div>
	<div class="item item4">
	<hr>
					<div class="gap-box-book"></div>
	<div class="bookList">
	<span id="books"></span>
	</div>
	</div>
	</div>
</body>
</html>