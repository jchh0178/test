<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>무비차트</title>
<!-- 	<link rel="stylesheet" href="/teamproject/resources/css/style.css"> -->
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <style>
        .movie-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
        }

        .movie-card {
            width: 300px;
            background: #f5f5f5;
            border-radius: 10px;
            padding: 10px;
            text-align: center;
            position: relative;
        }

        .movie-card img {
            width: 100%;
            border-radius: 10px;
        }

        .review-chart {
            width: 120px;
            margin: 10px auto;
        }

        .movie-title {
            font-weight: bold;
            margin: 8px 0;
        }

        .reserve-button {
            margin-top: 10px;
            background-color: #ff5252;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .reserve-button:hover {
            background-color: #ff0000;
        }
    </style>
    
</head>
<body>
	<!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
    <h1 style="text-align:center;">🎬 무비 차트</h1>
    <div class="movie-grid">
        <c:forEach var="movieDTO" items="${movieList}">
            <div class="movie-card">
                <a href="${pageContext.request.contextPath}/movie/detail?movieCd=${movieDTO.movieCd}">
                    <c:choose>
					  <c:when test="${empty movieDTO.posterUrl}">
					    <img src="<c:url value='/resources/images/no-image.png'/>" alt="기본 포스터" />
					  </c:when>
					  <c:otherwise>
					    <img src="${movieDTO.posterUrl}"
					         onerror="this.onerror=null; this.src='/resources/images/no-image.png';"
					         alt="${movieDTO.movieNm} 포스터" />
					  </c:otherwise>
					</c:choose>
                </a>
                <div class="movie-title">
                	<h3>${movieDTO.rank} - ${movieDTO.movieNm}</h3>
                	<p>개봉일: ${movieDTO.openDt}</p>
                	<p>관람등급: ${movieDTO.watchGradeNm }</p>
                </div>

<!--                 차트 영역 -->
<%--                 <canvas id="chart-${i.index}" class="review-chart"></canvas> --%>

				<!-- 영화 카드 샘플 1 -리뷰작성란 -->
	            <img class="movie-review" src="https://via.placeholder.com/200x300.png?text=Movie+2" alt="Review 1 chart">
	            <div class="movie-info">
	                <div class="movie-title">영화 1 리뷰</div>
	                <a class="details-button" href="#">리뷰 내역  보기</a>
	            </div>

                <!-- 예매 버튼 -->
<%--                 <button class="reserve-button" onclick="location.href='/reserve?movieCd=${movie.movieCd}'">예매</button> --%>
            </div>
        </c:forEach>
    </div>
    
    <!-- pagination -->
			<div class="pagination">
				<a href="${pageContext.request.contextPath}/movie/main?pageNum=1&search=${pageDTO.search}" class="firstpage  pbtn"><img src="${pageContext.request.contextPath}/resources/images/btn_firstpage.png" alt="첫 페이지로 이동"></a>
				
				<c:if test="${pageDTO.currentPage > 1}">
					<a href="${pageContext.request.contextPath}/movie/main?pageNum=${pageDTO.currentPage - 1}" class="prevpage  pbtn"><img src="${pageContext.request.contextPath}/resources/images/btn_prevpage.png" alt="이전 페이지로 이동"></a>
				</c:if>
				
				
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
					<c:if test="${ i eq pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/movie/main?pageNum=${i }"><span class="pagenum currentpage">${i }</span></a>
					</c:if>
					<c:if test="${ i ne pageDTO.currentPage }">
						<a href="${pageContext.request.contextPath}/movie/main?pageNum=${i }"><span class="pagenum">${i }</span></a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
					<a href="${pageContext.request.contextPath}/movie/main?pageNum=${pageDTO.currentPage + 1}" class="nextpage  pbtn"><img src="${pageContext.request.contextPath}/resources/images/btn_nextpage.png" alt="다음 페이지로 이동"></a>
				</c:if>
				
				
				<a href="${pageContext.request.contextPath}/movie/main?pageNum=${pageDTO.pageCount}" class="lastpage  pbtn"><img src="${pageContext.request.contextPath}/resources/images/btn_lastpage.png" alt="마지막 페이지로 이동"></a>
			</div>
			<!-- //pagination -->

<!--     <script> -->
<!-- //         리뷰 차트 데이터 (임시 데이터: 긍정 70%, 부정 30%) -->
<%-- //         <c:forEach var="movie" items="${movies}" varStatus="i"> --%>
<%-- //             const ctx${i.index} = document.getElementById('chart-${i.index}').getContext('2d'); --%>
<%-- //             new Chart(ctx${i.index}, { --%>
<!-- //                 type: 'doughnut', -->
<!-- //                 data: { -->
<!-- //                     labels: ['긍정', '부정'], -->
<!-- //                     datasets: [{ -->
<!-- //                         data: [70, 30], // 나중에 실제 리뷰 분석값으로 대체 가능 -->
<!-- //                         backgroundColor: ['#42A5F5', '#EF5350'] -->
<!-- //                     }] -->
<!-- //                 }, -->
<!-- //                 options: { -->
<!-- //                     cutout: '70%', -->
<!-- //                     plugins: { -->
<!-- //                         legend: { display: false } -->
<!-- //                     } -->
<!-- //                 } -->
<!-- //             }); -->
<%-- //         </c:forEach> --%>
<!--     </script> -->

 <!-- Footer -->
 <%@ include file="../main/footer.jsp" %>

</body>
</html>