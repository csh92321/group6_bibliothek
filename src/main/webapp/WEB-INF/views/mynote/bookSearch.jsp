<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.wrap{margin:0 auto;}
.top_result {display:flex;}
.result{margin-right:30px;}
.result label:hover{color:#ffb532;}
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<script>
	function search() {
		var search = $("#bookName").val();
		
		if (search=="") {
			alert("검색창에 입력해주세요")
		} else {
		
		$.ajax({
			url : "search",
			type : "post",
			data : { search : search },
			async:false,
			success : function(list) {
			let html=""
				if(Object.keys(list).length == 0){
					html += "<h4>검색 결과가 없습니다</h4>"
				} else {
					html+="<div class='top_result'>"
					$
					.each(
							list,
							function(index, item) {
								
									html += "<div class='result'>"
									html += "<img width='100px' height='150px' src=\"${contextPath}/resources/coverImg/"+item.bookNum+".jpg\" /><br>"
									//html += "<a href=\'javascript:chooseBook("+item.bookNum+"\',\'"+item.title+"\',\'"+item.writer+"\',\'"+item.company+");\'>"+item.title+"</a><br>"
									//html += "<label style='font-size:15px; font-weight: bold;' onclick=chooseBook()>" + item.title + "</label><br>"
									//html += "<a href='javascript:chooseBook("+item.bookNum+","+item.title+","+item.writer+","+item.company+");'>"+item.title+"</a><br>"
									html += "<label onclick=\"chooseBook('"+item.bookNum+"','"+item.title+"','"+item.writer+"','"+item.company+"')\">"+item.title+"</label><br>";
									html += item.writer + "/" + item.company
									html += "</div>"
									html += "<div class='hideen'>"
									html += "<input type='hidden' id='bookNum' value='"+item.bookNum+"'>"
									html += "<input type='hidden' id='title' value='"+item.title+"'>"
									html += "<input type='hidden' id='writer' value='"+item.writer+"'>" 
									html += "<input type='hidden' id='company' value='"+item.company+"'>" 
									html += "</div>"
								
									
							})
							html+="</div>"
				}
				$("#bookList").html(html)
			},
			error : function() {
				alert('error')
			}
		})
		
		}
	}
	
	function chooseBook(bookNum,title, writer,company){
		
		var bookNum_n=bookNum;
		var title_n = title
		var writer_n = writer
		var company_n=company 
		
		window.opener.document.getElementById("bookNum").value=bookNum
		window.opener.document.getElementById("title").value=title
		window.opener.document.getElementById("writer").value=writer
		window.opener.document.getElementById("company").value=company
		//window.opener.document.getElementById("imgSpace").value="<img src=${contextPath}/resources/coverImg/"+bookNum+".jpg>"
		//window.opener.document.getElementById("imgSpace").innerText="<img src=${contextPath}/resources/coverImg/"+bookNum+".jpg>"
		$("#imgSpace",opener.document).html("<img width='130px' height='190px' src=${contextPath}/resources/coverImg/"+bookNum+".jpg>")
		
		window.close();
	}
</script>
</head>
<body>

<div class="wrap">

		<input type="text" id="bookName" class="bookName">
		<button class="bookSearch" id="bookSearch" onclick="search()"> <i class="fas fa-search" ></i> </button>
	<hr>
	<span id="bookList"></span>
</div>
	
</body>
</html>