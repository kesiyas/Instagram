<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<header class=" d-flex align-items-center justify-content-between">
			<h2 class="ml-3 my-3">Instagram</h2>
			<div class="d-flex">
				<c:choose>
					<c:when test="${empty userId }">
						<a href="/user/signin/view" class="mr-2 text-primary">Login</a>
						<div class="text-info">계정을 잊으셨나요?</div>
					</c:when>
					<c:otherwise>
						<a href="/user/signout" class="mr-2 text-primary">Logout</a>
						<div>${loginId } 님</div>
					</c:otherwise>
				
				
				</c:choose>
			</div>
		</header>