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
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
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
										 	html += "<div class=\"item-detail item-detail1\">"
    										html += "<div class=\"title-font\">"
    												+ item.title + "<br></div>"
    										html += "<div class=\"subtitle\">"
    												+ item.subtitle+ "<br>"
    										html += "<div class=\"small\">"
    										html += item.writer + "/"
    												+ item.company
    												+ "</div></div>"
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
		let htmlL = "<h4>찜하기♡</h4>"
		var urlString = window.location.href;
	    var strArray = urlString.split('?');
	    var bookNum = strArray[1];
        let id = 1;
        let arrayL = [id, bookNum];
		check += 1;
		if (check==2) {
       	$
		.ajax({
			url : "likePush",
			type : "post",
			traditional : true,
			data : {
				arrayL : arrayL
			},
			success : function() {
				htmlL = "<h4>찜하기♥</h4>"
				$("#like").html(htmlL)
			}
		})
           
		
		} else if(check==3) {
	       	$
			.ajax({
				url : "likeCancel",
				type : "post",
				traditional : true,
				data : {
					arrayL : arrayL
				},
				success : function() {
					htmlL = "<h4>찜하기♡</h4>"
					check = 1;
					$("#like").html(htmlL)
				}
			})

		} else {
		$("#like").html(htmlL)
		}
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
	function gradePost2() {
		gradeLevel = 2;
		gradePost(gradeLevel);
	}
	function gradePost3() {
		gradeLevel = 3;
		gradePost(gradeLevel);
	}
	function gradePost4() {
		gradeLevel = 4;
		gradePost(gradeLevel);
	}
	function gradePost5() {
		gradeLevel = 5;
		gradePost(gradeLevel);
	}
	
	function gradePost(gradeLevel) {
		var urlString = window.location.href;
	    var strArray = urlString.split('?');
	    var bookNum = strArray[1];
	    var array = new Array();
	    array[0] = bookNum;
	    array[1] = gradeLevel;
		$
				.ajax({
					url : "gradePost",
					type : "post",
					traditional : true,
					data : {
						array : array
					},
					success : function(gradeL) {
						let htmlGrade = "<h3>"+gradeL+"</h3>"	
						$("#gradeLevel").html(htmlGrade)
					}
				})
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
	<div class="imageArea"><span id="image" onclick="originalImage();"></span></div>
	<div class="gap-box"></div>
	<div class="container-contents">
	<span id="detail"></span>
	<div class="item-detail item-detail2">
	<a href="eBook?1"><button class="button" type="button">읽기</button></a>
	<button class="button" onclick="like();" type="button"><span id="like"></span></button>
	<button class="button" onclick="url();" type="button">공유</button>
	<button class="button" onclick="grade();" type="button">평점 주기</button>
	</div>
	<div class="item-detail item-detail3">
		<span id="url"></span>
		<span id="gradeSelect"></span>
		<span id="gradeLevel"></span>
	</div>
	</div>
	</div>
	<div class="temp-box">책소개	<div class="gap-box"></div><span id="bookIntro"></span></div>
	<div class="temp-box">목차	<div class="gap-box"></div><span id="contentsTable"></span></div>
	<div class="temp-box">저자소개	<div class="gap-box"></div><span id="writerIntro"></span></div>
	<div class="temp-box">리뷰	<div class="gap-box"></div></div>
	<div class="temp-box">E-BOOK 이용안내	<div class="gap-box"></div><br>
	<div class="subtitle">본 상품은 별도로 배송되지 않는 전자책 서비스입니다.<br>
본 상품은 인쇄/저장/편집 기능이 불가합니다.<br>
2014년 11월 21일부터 ‘개정 도서정가제’ 시행에 따라 신구간 구분 없이 기본 이벤트 할인과 적립을 포함하여 최대 15%까지만 제공됩니다.</div></div>
</div>
</main>
</body>
</html>