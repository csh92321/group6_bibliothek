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
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/vue.js"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;
</style>
<script type="text/javascript">
	let gradeLevel = 0;
	let gradeClick = 0;

	let check = 0;
	var urlNum = 0;
	let gradeOg = 0;

	function detail() {
		var urlString = window.location.href;
		var strArray = urlString.split('?');
		var bookNum = strArray[1];
		$.ajax({
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
				$.each(list, function(index, item) {
					if (item.subtitle == null) {
						item.subtitle = ""
					}
					html += "<div class=\"item-detail item-detail1\">"
					html += "<div class=\"title-font\">" + item.title
							+ "<br></div>"
					html += "<div class=\"subtitle\">" + item.subtitle + "<br>"
					html += "<div class=\"small\">"
					html += item.writer + "/" + item.company + "</div></div>"
					html += "</div>"
					html += "</div>"

					htmlBook += "<div class=\"contents\">" + item.bookIntro
							+ "</div>"
					htmlTable += "<div class=\"contents\">"
							+ item.contentsTable + "</div>"
					htmlWriter += "<div class=\"contents\">" + item.writerIntro
							+ "</div>"
				})
				$("#detail").html(html)
				$("#bookIntro").html(htmlBook)
				$("#contentsTable").html(htmlTable)
				$("#writerIntro").html(htmlWriter)
			}
		})
		let image = ""
		image += "<img class=\"product-img\" src=\"resources/coverImg/"+bookNum+".jpg\" />"
		$("#image").html(image)
	}

	function originalImage() {

	}

	function like() {
		var urlString = window.location.href;
		var strArray = urlString.split('?');
		var bookNum = strArray[1];
		let id = "${loginUser}";
		let arrayL = [ id, bookNum ];
		$.ajax({
			url : "likeCheck",
			type : "post",
			traditional : true,
			data : {
				arrayL : arrayL
			},
			success : function(result) {
				if (result == 1) {
					check = 1;
					htmlL = "<h4>찜하기♥</h4>"
					$("#like").html(htmlL)
				} else if (result == 0) {
					check = 2;
					htmlL = "<h4>찜하기♡</h4>"
					$("#like").html(htmlL)
				}
			}

		})
	}

	function likePush() {
		var urlString = window.location.href;
		var strArray = urlString.split('?');
		var bookNum = strArray[1];
		let id = "${loginUser}";
		let arrayL = [ id, bookNum ];

		if (!!id) {
			if (check == 2) {
				$.ajax({
					url : "likePush",
					type : "post",
					traditional : true,
					data : {
						arrayL : arrayL
					},
					success : function() {
						check = 1;
						htmlL = "<h4>찜하기♥</h4>"
						$("#like").html(htmlL)
					}
				})
			} else if (check == 1) {
				$.ajax({
					url : "likeCancel",
					type : "post",
					traditional : true,
					data : {
						arrayL : arrayL
					},
					success : function() {
						check = 2;
						htmlL = "<h4>찜하기♡</h4>"
						$("#like").html(htmlL)
					}
				})

			}
		} else if (!id) {
			alert("로그인 후 이용하실 수 있는 기능입니다");
		}

	}

	function url() {
		html = ""
		urlNum += 1;
		if (urlNum == 1) {
			$("#gradeSelect").html(html)
			var urlString = window.location.href;
			html += "<div class = \"rgt\">"
			html += "<p style=\"font-size:15px; margin : 3px;\"> url : "
					+ urlString + "</p></div>"
		} else if (urlNum == 2) {
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

	function gradePost() {
		var urlString = window.location.href;
		var strArray = urlString.split('?');
		var bookNum = strArray[1];
		var array = new Array();
		let id = "${loginUser}";
		let gradeSelect = $('input[name="rating"]:checked').val();
		array[0] = bookNum;
		array[1] = gradeSelect;
		array[2] = id;

		if (!!id) {
			$
					.ajax({
						url : "gradePost",
						type : "post",
						traditional : true,
						data : {
							array : array
						},
						success : function(result) {
							if (result[0] == 0) {
								if (result[1] != gradeOg) {
									alert("평점이 변경되었습니다.")
								}
							} else if (result[0] == 1) {
								alert("평점이 등록되었습니다.")
							}
							let htmlGradeO = ""
							htmlGradeO += "<div class=\"star-ratings\">"
							htmlGradeO += "<div class=\"star-ratings-fill space-x-2 text-lg\""
							htmlGradeO += "style=\"width: " + result[1] * 20
									+ "%;\">"
							htmlGradeO += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>"
							htmlGradeO += "<div class=\"star-ratings-base space-x-2 text-lg\">"
							htmlGradeO += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
							htmlGradeO += "</div></div>"
							htmlGradeO += "<p style=\"font-size:23px; margin-left:10px;\">"
									+ result[1] + "</p>"
							gradeOg = result[1];
							$("#gradeLevel").html(htmlGradeO)
						}
					})

		} else if (!id) {
			alert("로그인 후 이용하실 수 있는 기능입니다");
		}
	}

	function gradeOriginal() {
		var urlString = window.location.href;
		var strArray = urlString.split('?');
		var bookNum = strArray[1];
		$
				.ajax({
					url : "gradeOriginal",
					type : "post",
					traditional : true,
					data : {
						bookNum : bookNum
					},
					success : function(gradeO) {
						let htmlGradeO = ""
						htmlGradeO += "<div class=\"star-ratings\">"
						htmlGradeO += "<div class=\"star-ratings-fill space-x-2 text-lg\""
						htmlGradeO += "style=\"width: " + gradeO * 20 + "%;\">"
						htmlGradeO += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span></div>"
						htmlGradeO += "<div class=\"star-ratings-base space-x-2 text-lg\">"
						htmlGradeO += "<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>"
						htmlGradeO += "</div></div>"
						htmlGradeO += "<p style=\"font-size:23px; margin-left:10px;\">"
								+ gradeO + "</p>"
						gradeOg = gradeO
						$("#gradeLevel").html(htmlGradeO)
					}
				})
	}

	let gradeSelect = $('input[name="rating"]:checked').val();

	function grade() {
		gradeClick += 1;
		let html = ""
		if (gradeClick == 1) {
			$("#url").html(html)
			html += "<div id=\"star-radio\" class=\"star-rating space-x-4 mx-auto\">"
			html += "<button class=\"button\" onclick=\"gradePost();\" type=\"button\">등록</button>"
			html += "<input type=\"radio\" id=\"5-stars\" name=\"rating\" value=\"5\" v-model=\"ratings\"/>"
			html += "<label for=\"5-stars\" class=\"star pr-4\">★</label>"
			html += "<input type=\"radio\" id=\"4-stars\" name=\"rating\" value=\"4\" v-model=\"ratings\"/>"
			html += "<label for=\"4-stars\" class=\"star\">★</label>"
			html += "<input type=\"radio\" id=\"3-stars\" name=\"rating\" value=\"3\" v-model=\"ratings\"/>"
			html += "<label for=\"3-stars\" class=\"star\">★</label>"
			html += "<input type=\"radio\" id=\"2-stars\" name=\"rating\" value=\"2\" v-model=\"ratings\"/>"
			html += "<label for=\"2-stars\" class=\"star\">★</label>"
			html += "<input type=\"radio\" id=\"1-star\" name=\"rating\" value=\"1\" v-model=\"ratings\" checked/>"
			html += "<label for=\"1-star\" class=\"star\">★</label>"
			html += "</div>"
		} else {
			gradeClick = 0;
			html = "";
		}
		$("#gradeSelect").html(html)
	}
</script>
</head>
<body onload="detail(); like(); gradeOriginal();">
	<%@ include file="../default/header.jsp"%>
	<main>
		<div class="main-container">
			<div class="temp-box box-one">
				<div class="imageArea">
					<span id="image" onclick="originalImage();"></span>
				</div>
				<div class="gap-box"></div>
				<div class="container-contents">
					<span id="detail"></span>
					<div class="item-datail itme-detail4">
						<span id="gradeLevel"
							style="display: flex; justify-content: center; align-items: center;"></span>
					</div>
					<div class="item-detail item-detail2">
						<button class="button" type="button"
							onclick="location.href='eBook?1'">읽기</button>
						<button class="button" onclick="likePush();" type="button">
							<span id="like"></span>
						</button>
						<button class="button" onclick="url();" type="button">공유</button>
						<button class="button" onclick="grade();" type="button">평점
							주기</button>
					</div>
					<div class="item-detail item-detail3">
						<span id="url"></span><span id="gradeSelect"></span>
					</div>
				</div>
			</div>
			<div class="temp-box">
				<div id="content-font">책소개</div>
				<div class="gap-box"></div>
				<span id="bookIntro"></span>
			</div>
			<div class="temp-box">
				<div id="content-font">목차</div>
				<div class="gap-box"></div>
				<span id="contentsTable"></span>
			</div>
			<div class="temp-box">
				<div id="content-font">저자소개</div>
				<div class="gap-box"></div>
				<span id="writerIntro"></span>
			</div>
			<div class="temp-box">
				<div id="content-font">리뷰</div>
				<div class="gap-box"></div>
			</div>
			<div class="temp-box">
				<div id="content-font">E-BOOK 이용안내</div>
				<div class="gap-box"></div>
				<div class="guide">
					본 상품은 별도로 배송되지 않는 전자책 서비스입니다.<br> 본 상품은 인쇄/저장/편집 기능이 불가합니다.<br>
					2014년 11월 21일부터 ‘개정 도서정가제’ 시행에 따라 신구간 구분 없이 기본 이벤트 할인과 적립을 포함하여 최대
					15%까지만 제공됩니다.
				</div>
			</div>
		</div>
	</main>
	<%@ include file="../default/footer.jsp"%>
</body>
</html>