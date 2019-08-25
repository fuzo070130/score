<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="/score/resources/js/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="/score/resources/css/Board/board-list.css">
</head>
<body>
		<div class="wrap">
		<jsp:include page="/WEB-INF/views/base/header.jsp"/>
			<div class="container">
				<div class="column-left">
					<div class="left-section-top">
					</div>
					<div class="left-section-bottom">
						<div class="session_value">
						<input type="hidden" value="${sessionScope.vo.userNickName }" class="session_userNickName"/>
						<input type="hidden" value="${sessionScope.vo.userNumber }" class="session_userNumber"/>
						</div>
						<input type="hidden" value="${vo.gameNumber}" name="gameNumber" class="gameNumber"/>
						번호 : ${vo.gameNumber }
						<br> 제목 : ${vo.gameTitle }
						<br>
						<input type="button" value="돌아가기" onclick="cancle();" />
					
						<a href="/score/Game/modify?gameNumber=${vo.gameNumber }">게시글 수정</a>
						
						<div class="reply">
							<button class="reply_AllList">댓글 전체보기</button>
							<div class="reply_list">
								
							</div>
							<c:choose>
								<c:when test="${not empty sessionScope.vo.userNickName}">
									<input type="text" name="gameReviewText" placeholder="리뷰내용을 작성해주세요." class="gameReviewText"/>
									<input type="button" value="리뷰작성" id="review_insert">
								</c:when>
							</c:choose>
						</div>
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
<script>

	var gameNumber = $(".gameNumber").val();
	
	$(document).ready(function(){
		//기본으로 5개 댓글리스트 출력
		getReplyBaseList(5);
		
		$(".reply_AllList").click(function(){
			getReplyBaseList(1);
		});
	});

	function cancle() {
		location.href = '/score/Game';
	}
	//댓글리스트 replyPoint 는 리스트 불러올 갯수 기본 5개 5이외의 숫자로보내면 전체
	function getReplyBaseList(replyPoint) {
		$.getJSON("/score/Reply/list/" + boardNumber + "/" + replyPoint, function(data) {
			$(data).each(function(){
				var str = "";
				$(data).each(function(){
					str += "<li data-replyNumber=" + this.replyNumber + ">" + this.replyContent + "</li>";
				});
				$(".reply_list").html(str);
			});
		});
	};
	
	
	
	//리뷰달기
	$("#review_insert").click(function(){
		var userNickName = $(".session_userNickName").val();
		var userNumber = $(".session_userNumber").val();
		var gameReviewText = $(".gameReviewText").val();
		
		$.ajax({
			type : 'post',
			url : '/score/GameReview/insert',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'text',
			data : JSON.stringify({
				userNickName : userNickName,
				userNumber : userNumber,
				gameReviewText : gameReviewText,
				gameNumber : gameNumber
			}),
			success : function(result) {
				if(result == "SUCCESS") {
					alert('등록되었습니다');
					history.go(0);
				}
			}
		});
	});
</script>