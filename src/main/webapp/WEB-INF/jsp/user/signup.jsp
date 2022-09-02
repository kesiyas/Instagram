<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스타그램 - 회원가입</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents d-flex justify-content-center">
			<div class="join-box content d-flex justify-content-center">
				<div class="m-4 col-9 d-flex flex-column align-items-center">
					<h2 class="my-3 text-center">Instagram</h2>
					<div class="d-flex w-75">
						<input type="text" placeholder="아이디" class="form-control mt-3" id="loginIdInput">
							
						<button type="button" class="btn btn-success mt-3 btn-sm" id="checkBtn">중복확인</button>
					</div>
					<input type="text" placeholder="이름" class="form-control mt-3 w-75" id="nameInput">
					<input type="text" placeholder="닉네임" class="form-control mt-3 w-75" id="nicknameInput">
					<input type="password" placeholder="비밀번호" class="form-control mt-3 w-75" id="passwordInput">
					<input type="password" placeholder="비밀번호 확인" class="form-control mt-3 w-75" id="checkPasswordInput">
					<input type="text" placeholder="휴대폰 번호" class="form-control mt-3 w-75" id="phoneNumberInput">
					<button type="button" class="btn btn-block btn-info mt-3 w-75" id="joinBtn">가입하기</button>
				</div>
			</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
		
	</div>


	<script>
		$(document).ready(function(){
			
			// 중복 체크 확인 상태 저장 변수
			var isCheck = false;
			// 중복 상태 저장 변수
			var isDuplicateLoginId = true;
			
			$("#loginIdInput").on("input", function(){
				
				isCheck = false;
				isDuplicateLoginId = true;
			});
			
			$("#checkBtn").on("click", function(){
				
				let loginId = $("#loginIdInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/is_duplicate"
					, data:{"loginId":loginId}
					, success:function(data){
						if(data.result) {
							isDuplicateLoginId = true;
							alert("사용중인 아이디 입니다.")
						} else {
							isDuplicateLoginId = false;
							alert("사용가능한 아이디 입니다.")
						}
					}
					, error:function(){
						alert("아이디 중복확인 에러.")
					}
				});
			});
			
			$("#joinBtn").on("click", function(){
				
				let loginId = $("#loginIdInput").val();
				let name = $("#nameInput").val();
				let nickname = $("#nicknameInput").val();
				let password = $("#passwordInput").val();
				let checkPassword = $("#checkPasswordInput").val();
				let phoneNumber = $("#phoneNumberInput").val();
				let regPhone = /^01([0|1|6|7|8|9]?)([0-9]{3,4})([0-9]{4})$/;
				
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return ;
				}
				
				if(name == "") {
					alert("이름을 입력하세요.");
					return ;
				}
				
				if(nickname == "") {
					alert("닉네임을 입력하세요.");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.");
					return ;
				}
				
				if(password != checkPassword) {
					alert("비밀번호를 확인해주세요.");
					return ;
				}
				
				if(phoneNumber == "") {
					alert("전화번호를 입력하세요.");
					return ;
				}
				
				if(!isCheck) {
					alert("아이디 중복 확인을 해주세요.");
					return ; 
				}
				
				if(isDuplicateLoginId) {
					alert("사용중인 아이디 입니다.");
					return ; 
				}
				
				/*if(!regPhone.test("phoneNumber")) {
					alert("올바른 형식이 아닙니다.");
					return ;
				}*/
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					, data:{"loginId":loginId, "name":name, "nickname":nickname, "password":password, "phoneNumber":phoneNumber}
					, success:function(data){
						if(data.result == "success") {
							location.href="/user/signin/view";
						}else {
							alert("로그인 실패");
						}
					}
					, error:function(){
						alert("로그인 에러");
					}
					
					
					
				});
			});
			
			
			
		});
	</script>
</body>
</html>