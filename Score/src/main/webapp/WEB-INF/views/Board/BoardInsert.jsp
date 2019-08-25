<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>UserInfo</title>
<script type="text/javascript"
	src="/score/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<form action="/score/Board/insert" method="post" id="formInsert">
		<input type="hidden" name="userNickName"value="${sessionScope.vo.userNickName }"> 
		<input type="hidden" name="userNumber"value="${sessionScope.vo.userNumber }"> 
		제목 : <input type="text"name="boardTitle"><br /> 
		내용 : <input type="text"name="boardContent"><br /> 
		<input type="button" value="작성"onclick="insert();"><br /> 
		<input type="button" value="취소"onclick="cancle();">
	</form>
</body>
</html>
<script>
	function cancle() {
		location.href = '/score/Board';
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