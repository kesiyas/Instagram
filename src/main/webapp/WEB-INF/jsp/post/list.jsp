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
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents d-flex">
			<article class="d-flex flex-column ml-4 my-5 col-7 align-items-center ">
				<a href="/post/create/view" class="btn btn-primary text-white form-control w-50">게시글 작성</a>
				<!-- timeline -->
				<c:forEach var="timeLine" items="${timeLine}">
				<div class="storyBox mt-5">
					<div class="d-flex justify-content-between align-items-center m-3">
						<div class="d-flex align-items-center">
							<img class="rounded-circle mr-2" height="50" width="50" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">
							<div class="font-weight-bold">${loginId}</div>
						</div>
						<button type="button" class="btn btn-danger text-white">삭제</button>
					</div>
					<img src="${timeLine.imgPath }" width="100%" height="400" alt="포스트 사진">
					
					<!-- 좋아요 -->
					<div class="ml-4 my-3">
						<i class="bi bi-heart mr-4"></i> <span class="font-weight-bold">좋아요 5개</span>
					</div>
					<!-- 좋아요 -->
					
					<!-- 댓글들 -->
					<div class="ml-3 my-3">
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
			<article class="d-flex flex-column mr-5 my-3 col-5">
				<div class="d-flex align-items-center mt-4">
					<img class="rounded-circle mr-3" height="50" width="50" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">

					<div>
						<div class="font-weight-bold">${loginId }</div>
						<small class="font-weight-bold text-secondary">${nickname }</small>
					</div>
				</div>
				<!-- 팔로우 목록 -->
				<div class="d-flex flex-column align-items-center my-5">
					<div class="text-center">팔로우 목록</div>
					<ul class="col-7">
						<li class="d-flex justify-content-between mt-3">user2 <span><a href="#">팔로우</a></span></li>
						<li class="d-flex justify-content-between mt-3">user3 <span><a href="#">팔로우</a></span></li>
						<li class="d-flex justify-content-between mt-3">user4 <span><a href="#">팔로우</a></span></li>
					</ul>
				</div>
				<!-- 팔로우 목록 -->
				<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
			</article>
		</section>
	
		
	</div>

</body>
</html>