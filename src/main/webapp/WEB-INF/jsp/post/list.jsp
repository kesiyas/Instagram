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
		<c:import url="/WEB-INF/jsp/include/header_search.jsp"></c:import>
		
		<main class="main-size align-items-center">
			<section class="d-flex mt-5 contents">
				<article class="d-flex flex-column align-items-center mr-4">
					<!-- 게시글 작성 버튼-->
					<div class="bg-info create_post">
						<a href="/post/create/view" class="btn btn-primary text-white form-control">게시글 작성</a>
					</div>
					<!-- 게시글 작성 버튼-->
					
					<!-- timeline -->
					<c:forEach var="postDetail" items="${postList}">			
					<div class="feed-box-size mt-3">
						<div class="d-flex flex-column">
							<div class="d-flex align-items-center justify-content-between">
								<div class="d-flex align-items-center px-3 pt-2">
									<img class="rounded-circle mr-2" height="50" width="50" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">
									<div class="font-weight-bold">${postDetail.user.loginId}</div>								
									<c:choose>
										<c:when test="${postDetail.user.id != userId && postDetail.follow eq false}">
											<div class="ml-3">											
												<i class="bi bi-person-plus"></i>
												<span><a href="#" class="follow-Btn font-weight-bold comment-font-size pl-0" data-followee-id="${postDetail.post.userId}">팔로우</a></span>
											</div>
										</c:when>
										<c:otherwise>
										</c:otherwise>
									</c:choose>
								</div>						
								<i class="bi bi-three-dots btn more-btn mr-3" data-toggle="modal" data-target="#menuModalCenter" data-post-id="${postDetail.post.id}" data-user-id="${postDetail.user.id}"></i>													
							</div>
																										
							<img src="${postDetail.post.imgPath }" class="mt-3" height="400" alt="포스트 사진">
								
							<!-- 좋아요 -->		
							<div class="p-2 mt-1">
							
								<c:choose>
									<%--로그인한 사용자가 좋아요한 게시물 --%>
									<c:when test="${postDetail.like}">
										<a href="#" class="mr-1 unlike-Btn" data-post-id="${postDetail.post.id}"><i class="bi bi-heart-fill"></i></a> <span><small class="font-weight-bold">좋아요 ${postDetail.heartCount }개</small></span>
									</c:when>
									
									<%--로그인한 사용자가 좋아요를 하지 않은 게시물 --%>
									<c:otherwise>
										<a href="#" class="mr-1 like-Btn" data-post-id="${postDetail.post.id}"><i class="bi bi-heart"></i></a> <span><small class="font-weight-bold">좋아요 ${postDetail.heartCount }개</small></span>
									</c:otherwise>
								</c:choose>											
							</div>	
							<!-- 좋아요 -->
						
							<div class="content-font-size ml-2 mt-1">${postDetail.post.content }</div>
							
							<!-- 댓글들 -->
							<div class="p-2">
								<c:forEach var="commentDetail" items="${postDetail.commentDetail }">
									<div class="d-flex align-items-center justify-content-between mt-2">		
										<div class="font-weight-bold col-2 comment-font-size">${commentDetail.user.loginId }</div> 
										<div class="col-7 comment-font-size">${commentDetail.comment.content }</div>
										<div><i class="bi bi-heart col-2"></i></div>						
									</div>
								</c:forEach>							
							</div>
							<!-- 댓글들 -->
								
							<!-- 댓글 입력 -->
							<div class="d-flex justify-content-between align-items-center p-2"> 
								<input type="text" class="comment-input-style form-control col-9" placeholder="내용을 입력해주세요." id="commentInput${postDetail.post.id }">
								<button type="button" class="comment-Btn btn btn-info text-white" data-post-id="${postDetail.post.id }">게시</button>
							</div>
							<!-- 댓글 입력 -->
						</div>	
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
							<c:forEach var="followDetailList" items="${followDetailList }">
								<li class="d-flex justify-content-between mt-3 font-weight-bold">${followDetailList.user.loginId }
								<span class="ml-4"><a href="#" class="text-danger unfollow-btn" data-followee-id="${followDetailList.follow.followeeId }">팔로우 취소</a></span></li>									
							</c:forEach>
						</ul>
					</div>
					<!-- 팔로우 목록 -->
									
					<div class="text-center mt-3 ml-3">
						<small>© 2022 Instagram from Meta</small>
					</div>	
	
				</article>
			</section>
		</main>	
	</div>
	
	<div class="modal fade" id="menuModalCenter" tabindex="-1" role="dialog" data-user-id="${userId }">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-body text-center p-0">
					<a href="#" class="text-danger modal-style delete-Btn">삭제</a>
					<a href="#" class="modal-style" class="modal-unfollow-btn">팔로우 취소</a>
					<a href="#" class="modal-last-style">취소</a>
				</div>				
			</div>
		</div>
	</div>
		
	<script>
		$(document).ready(function(){
			
			// 포스트 삭제 기능
			$(".delete-Btn").on("click", function(e){
				
				e.preventDefault();
			
				let postId = $(this).data("post-id");

				$.ajax({
					type:"get"
					, url:"/post/delete"
					, data:{"postId":postId}
					, success:function(data){
						if(data.result=="success"){
							location.reload();
						}else {
							alert("게시물 삭제 실패");
						}
					}
					, error:function(){
						alert("게시물 삭제 에러");
					}
				});				
			});
					
			$(".more-btn").on("click", function(){
				// 모달의 삭제하기 a 태그에 data-post-id 속성에,
				// 현재 more-btn이 포함된 postId를 저장한다.
										
				let postId = $(this).data("post-id");	
				let userId = $(this).data("user-id");
				let loginUserId = $("#menuModalCenter").data("user-id");
				
				$(".delete-Btn").data("post-id", postId);
				
				if(userId != loginUserId) {
					$(".delete-Btn").addClass("d-none");		
				}			
				
				if(userId == loginUserId) {
					$(".modal-unfollow-btn").addClass("d-none");
					return;
				}
			});
			
			// 팔로우 취소 기능
			$(".unfollow-btn").on("click", function(e){
				
				e.preventDefault();
				let followeeId = $(this).data("followee-id");
				
				$.ajax({
					type:"get"
					, url:"/user/unfollow"
					, data:{"followeeId":followeeId}
					, success:function(data){
						if(data.result=="success"){
							location.reload();
						}else {
							alert("팔로우 취소 실패");
						}
					}
					, error:function(){
						alert("팔로우 취소 에러");
					}
				});
				
			});
			
			
			// 팔로우 추가 기능
			$(".follow-Btn").on("click", function(e){
			
				e.preventDefault();
				let followeeId = $(this).data("followee-id");
				
				$.ajax({
					type:"get"
					, url:"/user/follow"
					, data:{"followeeId":followeeId}
					, success:function(data){
						if(data.result=="success"){
							location.reload();
						}else {
							alert("팔로우 추가 실패");
						}
					}
					, error:function(){
						alert("팔로우 추가 에러");
					}
				});							
			});
			
			// 좋아요 클릭
			$(".like-Btn").on("click", function(e){
			
				e.preventDefault();
				let postId = $(this).data("post-id");		
								
				$.ajax({
					type:"get"
					, url:"/post/like"
					, data:{"postId":postId}
					, success:function(data){
						if(data.result == "success") {							
							location.reload();										
						} else {
							alert("좋아요 실패");
						}
					}
					, error:function(){
						alert("좋아요 에러");
					}					
				});																		
			});
			
			// 좋아요 취소
			$(".unlike-Btn").on("click", function(e){
				e.preventDefault();
				let postId = $(this).data("post-id");
				
				$.ajax({
					type:"get"
					, url:"/post/unlike"
					, data:{"postId":postId}
					, success:function(data){
						if(data.result == "success") {						
							location.reload();						
						} else {
							alert("좋아요 취소 실패");
						}
					}
					, error:function(){
						alert("좋아요 취소 에러");
					}					
				});	
			});
			
			// 댓글 작성 버튼
			$(".comment-Btn").on("click", function(){
				let postId = $(this).data("post-id");
				let content = $("#commentInput" + postId).val();
					
				if(content == "") {
					alert("내용을 입력해주세요.");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/comment/add"
					, data:{"postId":postId, "content":content}
					, success:function(data) {
						if(data.result == "success") {
							location.reload();
						} else {
							alert("댓글 작성 실패");
						}
					}	
					,error:function(){
						alert("댓글 작성 에러");
					}
										
				});
			});
			
			
			// 최근 검색 항목 팝업 열기
			$("#searchInput").on("click", function(){			
				$("#recent_search").removeClass("d-none");		
			});
			
			// 최근 검색 항목 팝업 닫기
			$(document).on("mouseup", function(e){				
				$("#recent_search").addClass("d-none");
			});
			
			$("#searchForm").on("submit", function(e){
				
				e.preventDefault();
				
				let loginId = $("#searchInput").val();
				
				$.ajax({
					type:"get"
					, url:"/post/search"
					, data:{"loginId":loginId}
					, success:function(data){
						if(data.result != null) {
							location.href="/post/detail/view?userId=" + data.result;
						} else {
							alert("사용자 검색 실패");
						}
					}
					, error:function(){
						
						alert("사용자 검색 에러");
					}				
				});				
			});
		});		
	</script>

</body>


</html>