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
	<form action="/score/Game/insert" method="post" id="formInsert">
		<input type="hidden" name="userNickName"value="${sessionScope.vo.userNickName }">
		<input type="hidden" name="userNumber"value="${sessionScope.vo.userNumber }"> 
		게임 제목 : <input type="text"name="gameTitle" ><br /> 
		게임 개발사 : <input type="text"name="gameDeveloper"><br /> 
		게임 유통사 : <input type="text"name="gameDistributor"><br /> 
		게임 플랫폼 : <input type="text"name="gamePlatform"><br /> 
		게임 지원상태 : <input type="text"name="gameSupportStatus"><br /> 
		게임 장르 : <input type="text"name="gameGenre"><br /> 
		게임 연령제한 : <input type="text"name="gameAgeGroup"><br />
		<input type="button" value="추가"onclick="insert();"><br /> 
		<input type="button" value="취소"onclick="cancle();">
	</form>
</body>
</html>
<script>
	function cancle() {
		location.href = '/score/Game';
	}
	function insert() {
		var userNickName = $('[name="userNickName"]').val();

		//로그인 확인
		//세션 유저의 닉네임 불러옴(고유) -> null 일경우 alert(회원가입 유도) -> 로그인 페이지 이동 -> End
		//세션 유저의 닉네임 불러옴(고유) -> null 아닐경우 게시글 작성 -> End
		if (!userNickName) {
			alert("로그인이 필요한 기능입니다");
		} else {
			//게시글 작성 여부 확인
			$('#formInsert').submit();
		}
	}
</script>