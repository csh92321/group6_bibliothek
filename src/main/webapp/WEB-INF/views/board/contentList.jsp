<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.plus{
display: none;
padding-bottom: 30px;
}

#title {
 font-size: 30px;
 text-align: center;
}
.content{
border-bottom:1px solid #e0e0e0;
}
.notice{
font-size: 10px;
padding: 30px 0;
cursor: pointer;
border: none;
outline: none;
background: none;
width: 20px;
height:10px;
text-align: center;

}
.notice:hover {
color: #BC2424;
}
[id$="-toggle"]{
margin-right: 15px;
}
</style>
</head>
<body>contentList<br>
<div class="wrap">
	<span id="title" >공 지 사 항</span>  <!--접고 펼치기 참고 사이트 https://joshua-dev-story.blogspot.com/2020/09/javascript-collapse.html -->
	<table border="1" >
		<tr>
			<th>No</th> <th>SUBJECT</th> <th>DATE</th>
			<div class="content">
			
			</div>
		</tr>
		<tr>
		<td></td>
		<td>
			<div class="content" >
			
			<button class="notice" id="not-1"><span id="not-1-toggle">+</span>12월 일정입니다.</button>
			<div class="plus" id="plu-1">[12월 17일]<br> 02:30 부터 04:30까지 시스템 점검</div>
			</div>
		</td>
		<td>
		</td>
		</tr>
	</table>
</div>

</body>
</html>