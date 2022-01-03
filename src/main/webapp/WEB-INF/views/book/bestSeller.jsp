<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/css/book.css" rel="stylesheet">
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<title>Insert title here</title>
<script type="text/javascript">
	function getHit() {
		$	.ajax({
					url : "hits",
					type : "get",
					dataType : "json",
					success : function(best) {
						console.log(best)
						let html = ""
						$
								.each(
										best,
										function(index, item) {
											html += "<div class=\"product-title\">"
											html += "<div class=\"product-img-div\">"
											html += "<a href=\"detail?"+item.bookNum+"\"><img class=\"product-img\" src=\"resources/coverImg/"+item.bookNum+".jpg\" /></a>"
											html += "<div class=\"product-letter\">"
											html += "<h3> <a href=\"detail?"+item.bookNum+"\">"
													+ item.title + "<br></a>"
											html += "<div class=\"small\">"
											html += item.writer + "/"
													+ item.company
													+ "</div></h3>"
											html += "</div>"
											html += "</div>"
											html += "</div>"
										})
						$("#best").append(html)
					}
				})
	}
</script>
</head>
<body onload="getHit();">
<%@ include file="../default/header.jsp" %>
	<div class="container">
	<div class="item item1">
	<div class="subtitle" style="margin-left:30px">
	<br>
		베스트 셀러
	</div>
	</div>
	<div class="item item2">
	<span id="best"></span>	
	</div>
	</div>	
</body>
</html>