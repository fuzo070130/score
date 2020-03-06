<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
	<title>title</title>
	<!-- Bootstrap -->
	<link href="/score/resources/css/bootstrap-4.4.1/css/bootstrap.min.css" rel="stylesheet">
	
	<link rel="stylesheet" href="/score/resources/css/base.css">
	<link rel="stylesheet" href="/score/resources/css/header.css">
</head><body>
	<nav class="navbar navbar-expand-sm bg-light"> <!-- 리스트 : 부트스트랩은 모바일 우선이라 화면이 작으면 아래로 쌓아서 내려온다 --> 
		<ul class="navbar-nav">
			<li class="nav-item"> 
				<a class="nav-link" href="/score">메인</a> 
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/score/Game">게임</a> 
			</li> 
			<li class="nav-item">
				<a class="nav-link" href="/score/Board">게시판</a> 
			</li>
			<li class="nav-item">
				<a class="nav-link" href="/score/Board">리뷰</a> 
			</li>
		</ul>
		<div class="login ml-auto">
			<c:choose>
				<c:when test="${empty sessionScope.vo }">
					<a href="/score/User/login">로그인</a>을 해주세요
				</c:when>
				<c:when test="${not empty sessionScope.vo }">
					<a href="/score/User">${sessionScope.vo.userNickName }</a>
					<a href="/score/User/logout">로그아웃</a>
					<input type="hidden" value="${sessionScope.vo.userNumber }" name="globalVarUserNumber" class="globalVarUserNumber">
				</c:when>
			</c:choose>
		</div> 
	</nav>
	<div class="container">
		<div class="header">
			
		</div>
	</div>
	<script src="/score/resources/js/jquery-3.4.1.min.js"></script>
</body></html>