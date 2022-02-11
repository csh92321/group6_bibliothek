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
										html += "<h3 class=\"division\">"+item.korean+"</h3>"	
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
										html += "<h3 class=\"division\">"+item.korean+"</h3>"	
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
	function getBooks(criterion) {
		var urlString = decodeURI(window.location.href);
	    var strArray = urlString.split('?');
	    var genreArray = strArray[1].split('&');
	    var genre = genreArray[1];
	    var arrayBook = new Array();
	    arrayBook[0] = genre;
	    arrayBook[1] = criterion;
		$
				.ajax({
					url : "books",
					type : "post",
					traditional : true,
					data : {
						arrayBook : arrayBook
					},
					success : function(range) {
						let html = ""
						$
								.each(
										range,
										function(index, item) {
											html += "<div class=\"product-title\">"
											html += "<div class=\"product-img-div\">"
											html += "<a href=\"detail?"+item.bookNum+"\"><img class=\"product-img\" src=\"resources/coverImg/"+item.bookNum+".jpg\" /></a>"
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
						$("#books").html(html)
					}
				})
	}
	
	let criterion = "popularityAsc";
	
	function rangePost(criterionV) {
		getBooks(criterionV);
	}
</script>
</head>
<body onload="getBooks(criterion); getgenre(); getKoreanD(); getKorean();">
<%@ include file="../default/header.jsp" %>
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
		<select id="range" name="range" onchange="rangePost(this.value);">
		<option value="popularityAsc">인기순▲</option>
		<option value="popularityDes">인기순▽</option>
		<option value="releaseAsc">신작순▲</option>
		<option value="releaseDes">신작순▽</option>
		<option value="gradeAsc">평점순▲</option>
		<option value="gradeDes">평점순▽</option>
		<option value="nameAsc">이름순▲</option>
		<option value="nameDes">이름순▽</option>
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
<footer>
<%@ include file="../default/footer.jsp" %>
</footer>
</html>