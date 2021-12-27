<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="resources/js/bootstrap.js"></script>
<script type="text/javascript">
function search() {
	var search = $("#search").val();
	var link = 'search?'+search
	var encode = encodeURI(link)
	location.href = encode
}
</script>
<div class="container">
	<div class="form-group row center">
		<div class="col-xs-8">
			<input class="form-control" id="search"
				onKeypress="javascript:if(event.keyCode==13) {search()}"
				type="text" size="20">
		</div>
		<div class="col-sx-2">
			<button class="btn btn-primary" onclick="search();" type="button">검색</button>
		</div>
	</div>
</div>
<div style="text-align: center">
</div>
</html>