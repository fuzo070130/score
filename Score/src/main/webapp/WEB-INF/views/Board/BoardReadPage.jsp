<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html lang="en">
	<jsp:include page="../base/header.jsp"/>
<head>
	<meta charset="UTF-8">
	<title>BoardReadPage</title>
	
	<link rel="stylesheet" href="/score/resources/css/Board/board-list.css">
</head>
	<body>
		<div class="container container-main">
			<div class="main">
				<input type="hidden" value="${sessionScope.vo.userNickName }" class="session_userNickName"/>
				<input type="hidden" value="${sessionScope.vo.userNumber }" class="session_userNumber"/>
				<input type="hidden" value="${vo.boardNumber}" name="boardNumber" class="boardNumber"/>
				번호 : ${vo.boardNumber }
				<br> 제목 : ${vo.boardTitle }
				<br> 내용 : ${vo.boardContent }
				<br>
				<input type="button" value="돌아가기" onclick="cancle();" />
			
				<c:choose>
					<c:when test="${sessionScope.vo.userNickName eq vo.userNickName}">
						<a href="/score/Board/modify?boardNumber=${vo.boardNumber }">게시글 수정</a>
						<a href="/score/Board/delete?boardNumber=${vo.boardNumber }">게시글 삭제</a>
					</c:when>
				</c:choose>
				
				<div class="reply">
					<button class="reply_AllList">댓글 전체보기</button>
					<div class="reply_list"></div>
					<c:choose>
						<c:when test="${not empty sessionScope.vo.userNickName}">
							<input type="text" name="replyContent" placeholder="댓글내용을 작성해주세요." class="replyContent"/>
							<input type="button" value="댓글작성" id="reply_insert">
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	<script>
		var boardNumber = $(".boardNumber").val();
		
		$(document).ready(function(){
			//기본으로 5개 댓글리스트 출력
			getReplyBaseList(5);
			
			$(".reply_AllList").click(function(){
				getReplyBaseList(1);
			});
		});
	
		function cancle() {
			location.href = '/score/Board';
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
		
		
		
		//댓글달기
		$("#reply_insert").click(function(){
			var userNickName = $(".session_userNickName").val();
			var userNumber = $(".session_userNumber").val();
			var replyContent = $(".replyContent").val();
			
			$.ajax({
				type : 'post',
				url : '/score/Reply/insert',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					userNickName : userNickName,
					userNumber : userNumber,
					replyContent : replyContent,
					boardNumber : boardNumber
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
	</body>
	<jsp:include page="../base/footer.jsp"/>
</html>
