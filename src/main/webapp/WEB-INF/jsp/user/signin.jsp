<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스타그램 - 로그인</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
	
</head>
<body>
	<div class="container">
		
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents">
			<div class="content d-flex justify-content-center">
			<div class="ml-5 mr-3">	
				<img height="400" width="400" src="https://cdn.pixabay.com/photo/2020/07/15/22/07/instagram-5409107_960_720.jpg" alt="배너 사진">
			</div>
			<div class="d-flex justify-content-center box ml-3 mr-5">
				<div class="login-box">
					<h2 class="my-4 text-center">Instagram</h2>
					<input type="text" placeholder="아이디" class="form-control" id="loginIdInput">
					<input type="text" placeholder="비밀 번호" class="form-control mt-3" id="passwordInput">
					<button type="button" class="btn btn-block btn-info mt-3" id="loginBtn">로그인</button>
					<div class="d-flex mt-2">
						<a href="#" class="mr-2"><small>아이디</small></a>
						<a href="#"><small>비밀번호 찾기</small></a>
					</div>
					
					<div class="mt-5">
						<span>계정이 없으신가요?</span>
						<a href="#">가입하기</a>
					</div>
				</div>
			</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#loginBtn").on("click", function(){
				
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();

				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signin"
					, data:{"loginId":loginId, "password":password}
					, success:function(data){
						
						if(data.result=="success") {
							alert("로그인 성공");
						}else{
							alert("로그인 실패");
						}
					}
					, error:function(){						
						alert("로그인 에러.");
					}
					
						
					
				});
				
			});
			
			
		});
	</script>
</body>
</html>