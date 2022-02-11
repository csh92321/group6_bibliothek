<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="bookPlusForm" method="post" name="bookPlusForm" enctype="multipart/form-data">
<p>
<label for="bookNum">북 넘버: </label>
<input id="bookNum" type="text" name="bookNum">
</p>
<label for="coverImg">북 커버 : </label>
<input type="file" id="coverImg" name="coverImg" accept="image/*">
<p>
<label for="title">책 제목: </label>
<input id="title" type="text" name="title">
</p>
<p>
<label for="subtitle">책 부제목: </label>
<input id="subtitle" type="text" name="subtitle">
</p>
<p>
<label for="writer">작가: </label>
<input id="writer" type="text" name="writer">
</p>
<p>
<label for="company">출판사: </label>
<input id="company" type="text" name="company">
</p>
<p>
<label for="bookIntro">책소개 :  </label>
<textarea id="bookIntro" name="bookIntro" rows="10" cols="100"></textarea>
</p>
<p>
<label for="contentsTable">목차 : </label>
<textarea id="contentsTable" name="contentsTable" rows="10" cols="100"></textarea>
</p>
<p>
<label for="writerIntro">작가소개 : </label>
<textarea id="writerIntro" name="writerIntro" rows="10" cols="100"></textarea></p>
<p>
<input type="submit" value="등록"/>
</p>

	<a href="${contextPath }/member/user_check"><button class="btn" type="button" style="margin-top:30px;">돌아가기</button></a>

</form>
</body>
</html>