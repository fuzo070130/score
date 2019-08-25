<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/score/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form action="/score/Board/modify" method="post" id="formmodify">
		<input type="hidden" name="boardNumber" value="${vo.boardNumber }">
		제목 : <input type="text" name="boardTitle" value="${vo.boardTitle }"><br />
		내용 : <input type="text" name="boardContent" value="${vo.boardContent }"><br /> 
		<input type="button" value="수정하기" onclick="modify();"><br /> 
		<input type="button" value="돌아가기" onclick="cancle();" />
	</form>
</body>
</html>
<script>
	function modify() {
		$('#formmodify').submit();
	}
	function cancle() {
		location.href = '/score/Board';
	}
</script>