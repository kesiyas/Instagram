<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<header class="d-flex align-items-center justify-content-between">
			<h2 class="ml-3 my-3">Instagram</h2>
			<div class="d-flex">
				<c:choose>
					<c:when test="${empty userId }">
						<a href="/user/signin/view" class="mr-2 text-primary">Login</a>
						<div class="text-info">계정을 잊으셨나요?</div>
					</c:when>
					<c:otherwise>
						<a href="/user/signout" class="mr-3 text-primary">Logout</a>
						<div>
							<a href="#">
								<img class="rounded-circle" height="30" width="30" src="https://cdn.pixabay.com/photo/2022/09/02/11/27/otter-7427340_960_720.jpg" alt="프로필사진">
								<span class="font-weight-bold text-warning">${loginId }</span> 님
							</a>
						</div>
					</c:otherwise>
				
				
				</c:choose>
			</div>
		</header>