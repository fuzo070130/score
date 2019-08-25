<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>UserInfo</title>
	<link rel="stylesheet" href="/score/resources/css/User/UserLogin.css">
</head>
<body>
	<jsp:include page="../base/header.jsp"/>
	<div class="wrap">
		<div class="container">
			<div class="section-login">
				<div class="Login-area">
					<form action="/score/User/login" method="post">
						아이디 : <input type="text" name="userID"><br/>
						비밀번호 : <input type="text" name="userPassWord"><br/>
						<input type="submit" value="로그인"><br/>
						<input type="button" value="취소" onclick="cancle();">
					</form>
				</div>
			</div>
		</div>
	<jsp:include page="../base/footer.jsp"/>
	</div>
</body>
</html>
<script>
	function cancle() {
		location.href = '/score';
	}
</script>