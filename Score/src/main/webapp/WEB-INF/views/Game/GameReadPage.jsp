<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html lang="en">
	<jsp:include page="../base/header.jsp"/>
<head>
	<meta charset="UTF-8">
	<title>GameReadPage</title>
	
	<link rel="stylesheet" href="/score/resources/css/game/GameReadPage.css">
</head>
	<body>
		<div class="container container-main">
			<div class="main">
				<input type="hidden" value="${sessionScope.vo.userNickName }" class="session_userNickName"/>
				<input type="hidden" value="${sessionScope.vo.userNumber }" class="session_userNumber"/>
				<input type="hidden" value="${vo.gameNumber}" name="gameNumber" class="gameNumber"/>
				번호 : ${vo.gameNumber }
				<br> 제목 : ${vo.gameTitle }
				<img src="/score/resources${vo.gameImg }" style="width:500px;">
				<br>
				<input type="button" value="돌아가기" onclick="cancle();" />
			
				<a href="/score/Game/modify?gameNumber=${vo.gameNumber }">게시글 수정</a>
				
				<div class="reply">
					<button class="reply_AllList">댓글 전체보기</button>
					<div class="reply_list"></div>
					<c:choose>
						<c:when test="${not empty sessionScope.vo.userNickName}">
							<input type="text" name="gameReplyContent" placeholder="댓글내용을 작성해주세요." class="gameReplyContent"/>
							<input type="button" value="댓글작성" id="reply_insert">
							<br>
							<input type="text" name="gameReviewText" placeholder="리뷰내용을 작성해주세요." class="gameReviewText"/>
							<input type="button" value="리뷰작성" id="review_insert">
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
	<script>
		var gameNumber = $(".gameNumber").val();
		var globalVarUserNumber = $(".globalVarUserNumber").val();
		var gameReplyNumberEmpty = null;
	
		$(document).ready(function(){
			//기본으로 5개 댓글리스트 출력
			getReplyBaseList(5);
			
			$(".reply_AllList").click(function(){
				getReplyBaseList(1);
			});
		});
			
		/**
	     * 문자열이 빈 문자열인지 체크하여 결과값을 리턴한다.
	     * @param str       : 체크할 문자열 
	     */
	    function isEmpty(str){
	        
	        if(typeof str == "undefined" || str == null || str == "")
	            return true;
	        else
	            return false ;
	    }
	
		function cancle() {
			location.href = '/score/Game';
		}
		//댓글리스트 GameReplyPoint 는 리스트 불러올 갯수 기본 5개 5이외의 숫자로보내면 전체
		function getReplyBaseList(gameReplyPoint) {
			$.getJSON("/score/GameReply/list/" + gameNumber + "/" + gameReplyPoint, function(data) {
				$(data).each(function(){
					var str = "";
					//댓글리스트 생성
					$(data).each(function(){
						str += "<li data-gameReplyNumber=" + this.gameReplyNumber + ">" + this.gameReplyContent 
						if(isEmpty(globalVarUserNumber) == false){
								if(globalVarUserNumber == this.userNumber){
									//삭제,수정버튼
									str += "<input type='button' value='댓글수정' id='reply_updatebtn' onclick='replyUpdate(" + this.gameReplyNumber + ");'>" +
										   "<input type='button' value='댓글삭제' id='reply_deletebtn' onclick='replyDelete(" + this.gameReplyNumber + ");'>"
								}else{
									//댓글 신고버튼
								}
							}
						+ "</li>" ;
					});
					$(".reply_list").html(str);
				});
			});
		};
		
		//댓글달기
		$("#reply_insert").click(function(){
			var userNickName = $(".session_userNickName").val();
			var userNumber = $(".session_userNumber").val();
			var gameReplyContent = $(".gameReplyContent").val();
			
			$.ajax({
				type : 'post',
				url : '/score/GameReply/insert',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
					userNickName : userNickName,
					userNumber : userNumber,
					gameReplyContent : gameReplyContent,
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
		
		//댓글삭제
	    function replyDelete(gameReplyNumber){
	    	$.ajax({
				type : 'post',
				url : '/score/GameReply/delete/' + gameReplyNumber +'',
				headers : {
					"Content-Type" : "application/json",
					"X-HTTP-Method-Override" : "POST"
				},
				dataType : 'text',
				data : JSON.stringify({
				}),
				success : function(result) {
					if(result == "SUCCESS") {
						alert('삭제되었습니다.');
						history.go(0);
					}
				}
			});
	    }
		
		//댓글수정
	    function replyUpdate(gameReplyNumber){
	    	gameReplyNumberEmpty = gameReplyNumber;
			
			var replyContent = $('[data-gameReplyNumber='+ gameReplyNumber +']').text();
			var content = "<input type='text' name='' placeholder='댓글내용을 수정해주세요.' id='reply_updateContent' value='" + replyContent + "'>";
			content += "<input type='button' value='댓글수정' id='reply_update'>";
			
	    	$('[data-gameReplyNumber='+ gameReplyNumber +']').html("");
	    	$('[data-gameReplyNumber='+ gameReplyNumber +']').append(content);
		}
		
		//댓글수정 버튼 입력시 수정트리거
		//동적생선된 댓글수정버튼 접근위해 dom사용
		//https://rongscodinghistory.tistory.com/41
		$(document).ready(function(){
	        $(document).on("click","#reply_update",function(event){
	        	var gameReplyContent = $("#reply_updateContent").val();
	        	var gameReplyNumber = gameReplyNumberEmpty;
	        	console.log(gameReplyNumber);
	        	console.log(gameReplyContent);
	         	$.ajax({
	    			type : 'post',
	    			url : '/score/GameReply/update/'+ gameReplyNumber +'/'+ gameReplyContent,
	    			headers : {
	    				"Content-Type" : "application/json",
	    				"X-HTTP-Method-Override" : "POST"
	    			},
	    			dataType : 'text',
	    			data : JSON.stringify({
	    			}),
	    			success : function(result) {
	    				if(result == "SUCCESS") {
	    					alert('등록되었습니다');
	    					history.go(0);
	    				}
	    			}
	    		});
	        });
	    });
		
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
	</body>
	<jsp:include page="/WEB-INF/views/base/footer.jsp"/>
</html>
