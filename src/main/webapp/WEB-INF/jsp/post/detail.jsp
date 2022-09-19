<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스타그램 - 유저 개인 페이지</title>
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
		
		<section>
			<!-- 프로필 정보 -->
			<div class="d-flex mt-4 ml-5">
				<img class="rounded-circle mr-2" height="140" width="140" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">
				<div class="ml-4 mt-3">
					<div><h3>${user.loginId }</h3></div>
					<div class="detail_nickname_font">${user.nickname }</div>
					<div class="d-flex mt-3 justify-content-between detail_style_1">
						<div>게시물 40</div> 
						<div>팔로워 20</div> 
						<div>팔로우 30</div>
					</div>
					
				</div>
			</div>
			<!-- 프로필 정보 -->
			<!-- 게시물 목록 -->
			<div>
				<div class="d-flex flex-column align-items-center justify-coutent-center mt-5">
					<div class="h2 d-flex align-items-center">
						<i class="bi bi-file-ruled-fill mr-2"></i> <span>게시물</span>
					</div>
				
					<div class="d-flex flex-wrap justify-content-between mt-5 col-11">
						<c:forEach var="imgList" items="${list }">
							<div class="detail_imgBox">
								<img width="250" height="250" src="${imgList.imgPath }" alt="사용자 포스트 이미지">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
			<!-- 게시물 목록 -->
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
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
				if(data.id != null) {
					location.href="/post/detail/view?userId=" + data.id;
				} else {
					alert("사용자 검색 실패");
				}
			}
			, error:function(){
				
				alert("사용자 검색 에러");
			}		
		});	
	});
	</script>
</body>
</html>