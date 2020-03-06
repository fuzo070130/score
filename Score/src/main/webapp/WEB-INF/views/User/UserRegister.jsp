<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html lang="en">
	<jsp:include page="../base/header.jsp"/>
<head>
	<meta charset="UTF-8">
	<title>UserRegister</title>
	
	<link rel="stylesheet" href="/score/resources/css/User/UserRegister.css">
</head>
	<body>
		<div class="container container-main">
			<div class="main">
				<form action="/score/User/register" method="post">
					아이디 : <input type="text" name="userID" class="userID">
					<button type="button" class="btn btn-info" id="userIDCheckBtn">아이디 중복확인</button><br/>
					비밀번호 : <input type="text" name="userPassWord" class="userPassWord"><br/>
					이름 : <input type="text" name="userName" class="userName"><br/>
					닉네임 : <input type="text" name="userNickName" class="userNickName">
					<button type="button" class="btn btn-info" id="userNickNameCheckBtn">닉네임 중복확인</button><br/>
					이메일 : <input type="text" name="userEmail" class="userEmail">
					<button type="button" class="btn btn-info" id="emailCheckBtn">이메일 인증번호 발송</button><br/>
					인증번호 : <input type="text" name="emailCode" class="emailCode">
					<button type="button" class="btn btn-info" id="emailAuthBtn">이메일 인증번호 확인</button><br/>
					<input type="submit" value="가입">
					<input type="button" value="취소" onclick="cancle();">
				</form>
			</div>
		</div>
		<script>
			function cancle() {
				location.href = '/score';
			}
			
			//이메일 인증 번호 발송
			$("#emailCheckBtn").click(function(event){
				var userEmail = $(".userEmail").val();
				$.ajax({
					type : 'post',
					url : '/score/User/mailCheck',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "POST"
					},
					dataType : 'text',
					data : JSON.stringify({
						userEmail : userEmail
					}),
					success : function(result){
						if(result == 'succ'){
							alert("발송 완료했습니다.");
						}else if(result == 'fail'){
							alert("이메일 주소를 확인해주세요.");
						}
					}
				});
			});
			
			//이메일 인증 번호 확인
			$("#emailAuthBtn").click(function(event){
				var code = $(".emailCode").val();
				$.ajax({
					type : 'get',
					url : '/score/User/codeCheck',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					dataType : 'text',
					data : {
						code : code
					},
					success : function(result){
						if(result == 'succ'){
							alert("확인되었습니다.");
						}else if(result == 'fail'){
							alert("인증번호가 틀립니다.");
						}
					}
				});
			});
				
			//userID 중복확인
			$("#userIDCheckBtn").click(function(event){
				var userID = $(".userID").val();
				console.log(userID);
				$.ajax({
					type : 'get',
					url : '/score/User/idCheck',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					dataType : 'text',
					data : {
						userID : userID
					},
					success : function(result){
						if(result == 'succ'){
							alert("확인되었습니다.");
							$(".userID").attr("readonly", true);
						}else if(result == 'fail'){
							alert("이미 사용중입니다.");
						}
					}
				});
			});
			//userNickName 중복확인
			$("#userNickNameCheckBtn").click(function(event){
				var userNickName = $(".userNickName").val();
				$.ajax({
					type : 'get',
					url : '/score/User/nickNameCheck',
					headers : {
						"Content-Type" : "application/json",
						"X-HTTP-Method-Override" : "GET"
					},
					dataType : 'text',
					data : {
						userNickName : userNickName
					},
					success : function(result){
						if(result == 'succ'){
							alert("확인되었습니다.");
							$(".userNickName").attr("readonly", true);
						}else if(result == 'fail'){
							alert("이미 사용중입니다.");
						}
					}
				});
			});
		</script>
	</body>
	<jsp:include page="../base/footer.jsp"/>
</html>
