<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리스트</title>
</head>
<body>

	<!-- Header -->
	<%@ include file="../main/header.jsp"%>

	<header>
		<h1>🎬 현재 상영 중인 영화</h1>
	</header>

	<div class="movie-container">

		<!-- 영화 카드 샘플 1 -->
		<div class="movie-card" style="border: 1px solid black;">
			<img class="movie-poster"
				src="https://via.placeholder.com/200x300.png?text=Movie+1"
				alt="Movie 1">
			<div class="movie-info">
				<div class="movie-title">영화 제목 1</div>
				<div class="movie-genre">액션, 드라마</div>
				<a class="details-button" href="#">자세히 보기</a>
			</div>
			<!-- 영화 카드 샘플 1 -리뷰작성란 -->
			<img class="movie-review"
				src="https://via.placeholder.com/200x300.png?text=Movie+2"
				alt="Review 1 chart">
			<div class="movie-info">
				<div class="movie-title">영화 1 리뷰</div>
				<c:forEach var="movie" items="${movieList}">
					<c:url var="reviewUrl" value="/review/review">
						<c:param name="movieId" value="${movie.movieId}" />
					</c:url>

					<a class="details-button" href="${reviewUrl}">리뷰 내역 보기</a>
				</c:forEach>
			</div>
		</div>

	</div>
	<!-- Footer -->
	<%@ include file="../main/footer.jsp"%>

</body>
</html>