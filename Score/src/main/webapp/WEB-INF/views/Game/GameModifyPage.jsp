<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserInfo</title>
<script type="text/javascript"
	src="/score/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form action="/score/Game/modify" method="post" id="formmodify">
		<input type="hidden" name="gameNumber" value="${vo.gameNumber }">
		게임 제목 : <input type="text"name="gameTitle" value="${vo.gameTitle }"><br /> 
		게임 개발사 : <input type="text"name="gameDeveloper" value="${vo.gameDeveloper }"><br /> 
		게임 유통사 : <input type="text"name="gameDistributor" value="${vo.gameDistributor }"><br /> 
		게임 플랫폼 : <input type="text"name="gamePlatform" value="${vo.gamePlatform }"><br /> 
		게임 지원상태 : <input type="text"name="gameSupportStatus" value="${vo.gameSupportStatus }"><br /> 
		게임 장르 : <input type="text"name="gameGenre" value="${vo.gameGenre }"><br /> 
		게임 연령제한 : <input type="text"name="gameAgeGroup" value="${vo.gameAgeGroup }"><br />
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
		location.href = '/score/Game';
	}
</script>