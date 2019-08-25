<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>UserRegister</title>
</head>
<body>
	<form action="/score/User/register" method="post">
		아이디 : <input type="text" name="userID"><br/>
		이름 : <input type="text" name="userName"><br/>
		비밀번호 : <input type="text" name="userPassWord"><br/>
		닉네임 : <input type="text" name="userNickName"><br/>
		<input type="submit" value="가입"><br/>
		<input type="button" value="취소" onclick="cancle();">
	</form>
</body>
</html>
<script>
	function cancle() {
		location.href = '/score';
	}
</script>