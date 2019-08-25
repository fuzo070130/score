<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="/score/resources/css/base.css">
	<link rel="stylesheet" href="/score/resources/css/header.css">
	
	<script type="text/javascript" src="/score/resources/js/jquery-3.3.1.min.js"></script>
</head>
<body>
	<div class="header">
		<div class="section-top">
			<div class="top-area">
				
			</div>
		</div>
		<div class="section-navbar">
			<div class="navbar-area">
				<ul class="header-item-ul">
					<li class="header-item-li">
						<a href="/score/Board" class="header-item">
							<span class="item-txt">뉴스</span>
						</a>
					</li>
					<li class="header-item-li">
						<a href="/score/Game" class="header-item">
							<span class="item-txt">게임</span>
						</a>
					</li>
					<li class="header-item-li">
						<a href="/score/Board" class="header-item">
							<span class="item-txt">게시판</span>
						</a>
					</li>
					<li class="header-item-li">
						<a href="/score/Board" class="header-item">
							<span class="item-txt">리뷰</span>
						</a>
					</li>
				</ul>
				<div class="header-info">
					<div class="header-info-txt">
						<c:choose>
							<c:when test="${empty sessionScope.vo }">
								<a href="/score/User/login">로그인</a>을 해주세요
							</c:when>
							<c:when test="${not empty sessionScope.vo }">
								${sessionScope.vo.userID }님 환영합니다
								<a href="/score/User/logout">로그아웃</a>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>