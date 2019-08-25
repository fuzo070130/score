<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/score/resources/css/Board/board-list.css">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/base/header.jsp"/>
			<div class="container">
				<div class="column-left">
					<div class="left-section-top">
						<a href="/score/Game/insert">게임 추가</a>
						<a href="/score">메인화면으로가기</a>
					</div>
					<div class="left-section-bottom">
						<c:forEach items="${list}" var="GameVO">
							제목 : <a href='/score/Game/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&gameNumber=${GameVO.gameNumber}'>${GameVO.gameTitle }</a>
						<br>
						</c:forEach>
							<ul class="pagination">
					
							<c:if test="${pageMaker.prev}">
								<li><a
									href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
							</c:if>
							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="${pageMaker.makeSearch(idx)}">${idx}</a>
								</li>
							</c:forEach>
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
							</c:if>
						</ul>
					</div>
				</div>
				<div class="column-right">
					<div class="right-section">
						<c:choose>
							<c:when test="${empty sessionScope.vo }">
								<a href="/score/User/login">로그인</a>
								<a href="/score/User/register">회원가입하기</a>
							</c:when>
							<c:when test="${not empty sessionScope.vo }">
								${sessionScope.vo.userID }님 환영합니다.
								<a href="/score/User/logout">로그아웃</a>
							</c:when>
						</c:choose>
					</div>
					<div class="right-section2">
					123
					</div>
				</div>
				<div class="column-bottom">
					<div class="bottom-section-left">
						123
					</div>
					<div class="bottom-section-right">
						123
					</div>
				</div>
			</div>
		<jsp:include page="/WEB-INF/views/base/footer.jsp"/>
	</div>
	
</body>
</html>