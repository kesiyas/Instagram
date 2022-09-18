<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스타그램 - 스토리 페이지</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<header class="d-flex align-items-center justify-content-between">
			<h2 class="ml-3 my-3">Instagram</h2>
			
			<!-- 검색 창 -->
			<div class="search_form">	
				<input type="text" class="form-control search_input" placeholder="검색" id="searchInput">															
			
				<div class="d-flex flex-column search-box">
					<div class="d-none bg-white" id="recent_search">
						<div class="search-box1 p-3">최근 검색 항목</div>
						<div class="search-box2 d-flex justify-content-center align-items-center">
							<div>최근 검색 내역 없음.</div>
						</div>
					</div>
				</div>	
			</div>
			<!-- 검색 창 -->
			<div class="d-flex">
				<c:choose>
					<c:when test="${empty userId }">
						<a href="/user/signin/view" class="mr-2 text-primary">Login</a>
						<div class="text-info">계정을 잊으셨나요?</div>
					</c:when>
					<c:otherwise>
						<a href="/user/signout" class="mr-3 text-primary">Logout</a>
						<div>
							<a href="/post/detail/view">
								<img class="rounded-circle" height="30" width="30" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">
								<span class="font-weight-bold text-warning">${loginId }</span> 님
							</a>
						</div>
					</c:otherwise>				
				</c:choose>
			</div>
		</header>
		
		<main class="box1 align-items-center">
			<section class="d-flex mt-5 contents">
				<article class="d-flex flex-column align-items-center mr-4">
					<a href="/post/create/view" class="btn btn-primary text-white form-control w-50">게시글 작성</a>
					<!-- timeline -->
					<c:forEach var="timeLine" items="${timeLine}">
					<div class="storyBox mt-3">
						<div class="d-flex justify-content-between align-items-center m-3">
							<div class="d-flex align-items-center">
								<img class="rounded-circle mr-2" height="50" width="50" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">
								<div class="font-weight-bold">${loginId}</div>
							</div>
							<a type="button" href="/post/delete?id=${timeLine.id }" class="btn btn-danger text-white">삭제</a>
						</div>
						
						<img src="${timeLine.imgPath }" width="100%" height="400" alt="포스트 사진">
							
						<!-- 좋아요 -->
						<div class="ml-3 my-2">
							<i class="bi bi-heart mr-1"></i> <span><small class="font-weight-bold">좋아요 5개</small></span>
						</div>
						<!-- 좋아요 -->
						<div class="ml-3">${timeLine.content }</div>
						
						<!-- 댓글들 -->
						<div class="ml-3 my-2">
							<div class="d-flex justify-content-between">
								<div class="mt-2">
									<span class="font-weight-bold">user 2</span> 
									<span class="comment-margin">댓글1</span>
								</div>
								<i class="bi bi-heart mr-4"></i>					
							</div>
							<div class="d-flex justify-content-between">
								<div class="mt-2">
									<span class="font-weight-bold">user 3</span> 
									<span class="comment-margin">댓글2</span>
								</div>
								<i class="bi bi-heart mr-4"></i>					
							</div>
						</div>
						<!-- 댓글들 -->
							
						<!-- 댓글 입력 -->
						<div class="d-flex justify-content-between align-items-center m-3"> 
							<input type="text" class="form-control col-8" placeholder="내용을 입력해주세요.">
							<button type="button" class="btn btn-info text-white">게시</button>
						</div>
						<!-- 댓글 입력 -->
					</div>
					</c:forEach>
					<!-- timeline -->
					
				</article>
				<article class="ml-5">
					<div class="d-flex align-items-center">
						<img class="rounded-circle mr-3" height="50" width="50" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">
	
						<div>
							<div class="font-weight-bold">${loginId }</div>
							<small class="font-weight-bold text-secondary">${nickname }</small>
						</div>
					</div>
					<!-- 팔로우 목록 -->
					<div class="my-5">
						<div class="text-center text-info font-weight-bold ml-4">팔로우 목록</div>
						<ul>
							<li class="d-flex justify-content-between mt-3">user2 <span><a href="#">팔로우</a></span></li>
							<li class="d-flex justify-content-between mt-3">user3 <span><a href="#">팔로우</a></span></li>
							<li class="d-flex justify-content-between mt-3">user4 <span><a href="#">팔로우</a></span></li>
						</ul>
					</div>
					<!-- 팔로우 목록 -->
					
					
					<div class="text-center mt-3">
						<small>© 2022 Instagram from Meta</small>
					</div>	
	
				</article>
			</section>
		</main>
		
	</div>

	<script>
		$(document).ready(function(){
			
			// 최근 검색 항목 팝업 열기
			$("#searchInput").on("click", function(){			
				$("#recent_search").removeClass("d-none");		
			});
			
			// 최근 검색 항목 팝업 닫기
			$(document).on("mouseup", function(e){				
				$("#recent_search").addClass("d-none");
			});


		});
		
	</script>

</body>


</html>