<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html lang="en">
	<jsp:include page="../base/header.jsp"/>
<head>
<head>
	<meta charset="UTF-8">
	<title>GameList</title>
	
	<link rel="stylesheet" href="/score/resources/css/Board/board-list.css">
</head>
	<body>
		<div class="container container-main">
			<div class="main">
				<c:forEach items="${list}" var="GameVO">제목 : <a href='/score/Game/readPage${pageMaker.makeSearch(pageMaker.cri.page)}&gameNumber=${GameVO.gameNumber}'>${GameVO.gameTitle }</a>
				<br>
				</c:forEach>
					<ul class="pagination">
			
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
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
				<a href="/score/Game/insert">게임 추가</a>
				<a href="/score">메인화면으로가기</a>
			</div>
		</div>
	</body>
	<jsp:include page="/WEB-INF/views/base/footer.jsp"/>
</html>