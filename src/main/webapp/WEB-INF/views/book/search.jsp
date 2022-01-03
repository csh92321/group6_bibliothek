<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<link href="resources/css/book.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/header1.css">
	<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<script type = "text/javascript">
function searchPost() {
	var urlString = decodeURI(window.location.href);
    var strArray = urlString.split('?');
    var search = strArray[1];
	$
			.ajax({
				url : "searchPost",
				type : "post",
				data : {
					search : search
				},
				success : function(list) {
					let html = ""
						if(Object.keys(list).length == 0){
							html += "<h3>검색 결과가 없습니다</h3>"
						} else {
							$
							.each(
									list,
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
						}

									$("#searchs").html(html)
				}
			})
}
</script>
</head>
<body>
<%@ include file="../default/header.jsp" %>
	<body onload="searchPost();">
		<h3 class="subtitle">검색</h3>
		<span id="searchs"></span>
</body>
</html>