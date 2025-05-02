<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>영화 리스트</title>
</head>
<body>

    <!-- Header -->
    <%@ include file="../main/header.jsp" %>

    <header>
<!--         <h1>🎬 현재 상영 중인 영화</h1> -->
        <h2>오늘의 박스오피스 순위</h2>
    </header>
	
<%-- 	<c:forEach var="movie" items="${movies}"> --%>
<!--         <div style="border:1px solid #ccc; padding:10px; margin:10px; display:inline-block; width:200px;"> -->
<%--             <c:if test="${not empty movie.posterUrl}"> --%>
<%--                 <img src="${movie.posterUrl}" alt="${movie.movieNm} 포스터" style="width:100%;"> --%>
<%--             </c:if> --%>
<%--             <c:if test="${empty movie.posterUrl}"> --%>
<!--                 <img src="/images/no-image.png" alt="포스터 없음" style="width:100%;"> 기본 이미지 -->
<%--             </c:if> --%>
<%--             <h3>${movie.movieNm}</h3> --%>
<%--             <p>순위: ${movie.rank}</p> --%>
<%--             <p>제목: ${movie.movieNm}</p> --%>
<%--             <p>개봉일: ${movie.openDt}</p> --%>
<%--             <p>누적 관객수: ${movie.audiAcc}</p> --%>
<!--         </div> -->
<%--     </c:forEach> --%>
    
    <c:forEach var="movie" items="${movies}">
    	<div>
	        <img src="${movie.movie_poster != null ? movie.movie_poster : '/resources/images/no-image.png'}" width="150">
	        <h3>${movie.movie_name_kr}</h3>
	        <p>개봉일: ${movie.movie_open_date}</p>
	        <p>감독: ${movie.movie_director}</p>
	        <p>장르: ${movie.movie_genre}</p>
	        <p>상영시간: ${movie.movie_runtime}분</p>
	        <p>등급: ${movie.movie_grade}</p>
	    </div>
	    <hr/>
	</c:forEach>
	
<!--     <div class="movie-container"> -->
<%-- 		<c:if test="${not empty movies}"> --%>
<!-- 	        <ul> -->
<%-- 	            <c:forEach var="movie" items="${movies}"> --%>
<!-- 	                <li> -->
<%-- 	                    순위: ${movie.rank} -  --%>
<%-- 	                    제목: ${movie.movieNm} -  --%>
<%-- 	                    개봉일: ${movie.openDt} -  --%>
<%-- 	                    누적관객수: ${movie.audiAcc} --%>
<!-- 	                </li> -->
<%-- 	            </c:forEach> --%>
<!-- 	        </ul> -->
<%-- 	    </c:if> --%>
	
<%-- 	    <c:if test="${empty movies}"> --%>
<!-- 	        <p>박스오피스 데이터를 불러올 수 없습니다.</p> -->
<%-- 	    </c:if> --%>
<!--         영화 카드 샘플 1 -->
<!--         <div class="movie-card" style="border: 1px solid black;"> -->
<!--             <img class="movie-poster" src="https://via.placeholder.com/200x300.png?text=Movie+1" alt="Movie 1"> -->
<!--             <div class="movie-info" > -->
<!--                 <div class="movie-title">영화 제목 1</div> -->
<!--                 <div class="movie-genre">액션, 드라마</div> -->
<!--                 <a class="details-button" href="#">자세히 보기</a> -->
<!--             </div> -->
<!--       영화 카드 샘플 1 -리뷰작성란 -->
<!--             <img class="movie-review" src="https://via.placeholder.com/200x300.png?text=Movie+2" alt="Review 1 chart"> -->
<!--             <div class="movie-info"> -->
<!--                 <div class="movie-title">영화 1 리뷰</div> -->
<!--                 <a class="details-button" href="#">리뷰 내역  보기</a> -->
<!--             </div> -->
<!--         </div> -->

        <!-- 추가 영화 카드들 필요 시 복붙하면 됨 -->

<!--     </div> -->
 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>

</body>
</html>