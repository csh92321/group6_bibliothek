<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="resources/css/book.css" rel="stylesheet">
	<link href="resources/css/detail.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/header1.css">
	<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<script type = "text/javascript">

	let gradeLevel = 0;	
	let gradeClick = 0;

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
	
	function gradePost1() {
		gradeLevel = 1;
		gradePost(gradeLevel);
	}
	
	function gradePost(gradeLevel) {
		var urlString = window.location.href;
	    var strArray = urlString.split('?');
	    var bookNum = strArray[1];
// 		$
// 				.ajax({
// 					url : "gradePost",
// 					type : "post",
// 					data : {
// 						gradeLevel : gradeLevel
//     					bookNum : bookNum
// 					},
// 					success : function(gradeLevel) {
// 						let html = ""
// 						html += "<h3>"+gradeLevel+"</h3>"
						

// 					}
// 				})
// 				$("#gradeLevel").html(html)
	}
	
	function grade() {
		gradeClick += 1;
		let html=""
		if (gradeClick==1) {
		 html += "<div id=\"btn_group\">"
		 html += "<button onclick=\"gradePost1();\" id= \"gradeBtn\" type=\"button\" class=\"btm_image\" id=\"img_btn\"><img id=\"gradeImg\" src=\"/resources/images/star1.png\"></button>"
		 html += "<button onclick=\"gradePost2();\" id= \"gradeBtn\" type=\"button\" class=\"btm_image\" id=\"img_btn\"><img id=\"gradeImg\" src=\"/resources/images/star2.png\"></button>"
		 html += "<button onclick=\"gradePost3();\" id= \"gradeBtn\" type=\"button\" class=\"btm_image\" id=\"img_btn\"><img id=\"gradeImg\" src=\"/resources/images/star3.png\"></button>"
		 html += "<button onclick=\"gradePost4();\" id= \"gradeBtn\" type=\"button\" class=\"btm_image\" id=\"img_btn\"><img id=\"gradeImg\" src=\"/resources/images/star4.png\"></button>"
		 html += "<button onclick=\"gradePost5();\" id= \"gradeBtn\" type=\"button\" class=\"btm_image\" id=\"img_btn\"><img id=\"gradeImg\" src=\"/resources/images/star5.png\"></button>"
		 html += "</div>"
		} else {
			gradeClick = 0;
			html = "";
		}
		$("#gradeSelect").html(html)
	}
	
    </script>
</head>
<body onload="detail(); like();">
<%@ include file="../header.jsp" %>
<main>
<div class = "main-container">
	<div class="temp-box box-one">
	<div class="border-dee3eb"><span id="image" onclick="originalImage();"></span></div>
	<div class="gap-box"></div>
	<div class="border-dee3eb"><span id="detail"></span>
	<a href="eBook?1"><button class="btn" type="button">읽기</button></a>
	<button class="btn" onclick="like();" type="button"><span id="like"></span></button>
	<button class="btn" onclick="url();" type="button">공유</button>
	<button class="btn" onclick="grade();" type="button">평점 주기</button>
		<span id="url"></span>
		<span id="gradeSelect"></span>
		<span id="gradeLevel"></span>
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