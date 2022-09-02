<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스타그램 - 계정 찾기</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents d-flex justify-content-center align-items-center">
			<div class="box content-margin">
				<div class="border-bottom-color">
					<div class="d-flex flex-column align-items-center my-4">
				 		<img height=80 width=80 src="/static/img/lock.PNG">
				 		<h3 class="mt-5">내 계정 찾기</h3>
				 	</div>
				</div>
				<div class="border-bottom-color d-flex flex-column align-items-center">
					
						<div class="my-4 font-size">계정을 검색하려면 이메일 주소 또는 휴대폰 번호를 입력하세요.</div>
						<div class="col-7">
							<div class="d-flex flex-column align-items-center">
								<input type="text" placeholder="아이디" class="form-control mt-3 col-12" id="loginIdInput">
								<input type="text" placeholder="닉네임" class="form-control mt-3 col-12" id="nicknameInput">
							</div>
							
							<button class="btn btn-primary text-white my-4 float-right" id="checkBtn">확인</button>
						</div>
					
					
					
				</div>
				<div class="my-4 text-center">
					<div class="my-3 font-weight-bold">새 계정 만들기</div>
					<span class="font-weight-bold">또는</span>
					<div class="text-info mt-3"><a href="/user/signin/view">로그인으로 돌아가기</a></div>
				</div>
				
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
		$(document).reayd(function(){
			$("#checkBtn").on("click", function(){
				let loginBtn = $("#loginBtnInput").val();
				let nickname = $("#nickname").val();
				
				if(loginBtn == "") {
					alert("아이디를 입력하세요.");
					return;
				}
				
				if(nickname == "") {
					alert("닉네임을 입력하세요.");
					return;
				}
			});
			
			
		});
	</script>

</body>
</html>