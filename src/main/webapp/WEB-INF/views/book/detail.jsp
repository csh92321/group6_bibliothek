<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/book.css" rel="stylesheet">
	<link href="resources/css/detail.css" rel="stylesheet">
<script type = "text/javascript">
	function detail() {
	var urlString = window.location.href;
    var strArray = urlString.split('?');
    var bookNum = strArray[1];
    	$
    			.ajax({
    				url : "detail",
    				type : "post",
    				data : {
    					bookNum : bookNum
    				},
    				success : function(list) {
    					let html = ""
    					let htmlBook = ""
    					let htmlTable = ""
    					let htmlWriter = ""
    						$
							.each(
									list,
									function(index, item) {
										if (item.subtitle==null) {
											item.subtitle=""
										}
    										html += "<div class=\"title-box\">"
    										html += "<div class=\"title\">"
    												+ item.title + "<br></div>"
    										html += "<div class=\"subtitle\">"
    												+ item.subtitle+ "<br>"
    										html += "<div class=\"small\">"
    										html += item.writer + "/"
    												+ item.company
    												+ "</div></div>"
    										html += "</div>"
    										html += "</div>"
    										html += "</div>"
    										htmlBook += "<div class=\"subtitle\">"
    													+item.bookIntro+"</div>"
    										htmlTable += "<div class=\"subtitle\">"
														+item.contentsTable+"</div>"
											htmlWriter += "<div class=\"subtitle\">"
														+item.writerIntro+"</div>"
									})
    									$("#detail").html(html)
    									$("#bookIntro").html(htmlBook)
    									$("#contentsTable").html(htmlTable)
    									$("#writerIntro").html(htmlWriter)
    				}
    			})
    let image =""
    image += "<img class=\"product-img\" src=\"/resources/coverImg/"+bookNum+".jpg\" />"
     $("#image").html(image)
	}
	var check = 0;
	var urlNum = 0;
	function originalImage() {
		
	}
	function like() {
		html = "<h4>찜하기♡</h4>"
		check += 1;
		if (check==2) {
		html = "<h4>찜하기♥</h4>"
		} else if(check==3) {
			html = "<h4>찜하기♡</h4>"
			check = 1;
		}
		$("#like").html(html)
	}

	
	function url() {
		html = ""
		urlNum += 1;
		if (urlNum==1) {
		var urlString = window.location.href;
		html += "<div class = \"rgt\">"
		html += "<h4> url : "+urlString+"</h4></div>"
		} else if (urlNum==2) {
			html += "<h3></h3>"
			urlNum = 0;
		}
		$("#url").html(html)
	}
    </script>
</head>
<body onload="detail(); like();">
<%@ include file="menu.jsp" %>
<main>
<div class = "main-container">
	<div class="temp-box box-one">
	<div class="border-dee3eb"><span id="image" onclick="originalImage();"></span></div>
	<div class="gap-box"></div>
	<div class="border-dee3eb"><span id="detail"></span>
	<button class="btn" onclick="();" type="button">읽기</button>
	<button class="btn" onclick="like();" type="button"><span id="like"></span></button>
	<button class="btn" onclick="url();" type="button">공유</button>
	<span id="url"></span>
	</div>
	</div>
	<div class="temp-box">책소개<span id="bookIntro"></span></div>
	<div class="temp-box">목차<span id="contentsTable"></span></div>
	<div class="temp-box">저자소개<span id="writerIntro"></span></div>
	<div class="temp-box">리뷰</div>
	<div class="temp-box">E-BOOK 이용안내<br>
	<div class="subtitle">본 상품은 별도로 배송되지 않는 전자책 서비스입니다.<br>
본 상품은 인쇄/저장/편집 기능이 불가합니다.<br>
2014년 11월 21일부터 ‘개정 도서정가제’ 시행에 따라 신구간 구분 없이 기본 이벤트 할인과 적립을 포함하여 최대 15%까지만 제공됩니다.</div></div>
</div>
</main>
</body>
</html>