<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인스타그램 - 게시글 작성</title>

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
				<div class="p-4">
					<div class="d-flex">
						<div class="radius-circle"></div>
						<div class="font-weight-bold">${loginId }</div>
					</div>
					
					<textarea id="contentInput" rows="7" class="form-control mt-3" placeholder="내용을 입력해주세요."></textarea>
					
					<div class="mt-4">
						<label for="fileInput" class="btn btn-success text-white">업로드</label>
						<input type="file" class="d-none" id="fileInput">
					</div>
					
					<div class="d-flex justify-content-between mt-4">
						<a href="/post/list/view" class="btn btn-secondary">취소</a>
						<button type="button" class="btn btn-primary" id="addBtn">게시</button>
					</div>
				</div>
			</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

	<script>
		$(document).ready(function(){
			
			${"#addBtn"}.on("click", function(){
				let content = ${"#contentInput"}.val();
				
				if(content == "") {
					alert("내용을 입력해주세요.");
					return;
				}
				
				
			});
			
		});
	</script>
</body>
</html>