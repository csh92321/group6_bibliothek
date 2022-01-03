	function getHit() {
		$	.ajax({
					url : "hits",
					type : "get",
					dataType : "json",
					success : function(best) {
						console.log(best)
						let html = ""
						let cnt = 0;
						$
								.each(
										best,
										function(index, item) {
											if (cnt<3) {
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
											cnt += 1;
											}
										})
						$("#best").append(html)
					}
				})
	}
	
	function getNew() {
		$	.ajax({
					url : "news",
					type : "get",
					dataType : "json",
					success : function(newBook) {
						console.log(newBook)
						let html = ""
						let cnt = 0;
						$
								.each(
										newBook,
										function(index, item) {
											if (cnt<3) {
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
											cnt += 1;
											}
										})
						$("#new").append(html)
					}
				})
	}
	
		function getRecommend() {
		$	.ajax({
					url : "recommends",
					type : "get",
					dataType : "json",
					success : function(list) {
						console.log(list)
						let html = ""
						let cnt = 0;
						$
								.each(
										list,
										function(index, item) {
											if (cnt<3) {
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
											cnt += 1;
											}
										})
						$("#recommend").append(html)
					}
				})
	}