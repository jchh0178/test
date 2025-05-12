<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<style type="text/css">
body {
  font-family: 'Segoe UI', sans-serif;
  background-color: #f9f9f9;
  margin: 0;
  padding: 0;
}

.container {
  width: 90%;
  max-width: 1200px;
  margin: 40px auto;
  background: #fff;
  padding: 30px;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  border-radius: 10px;
}

.top-section {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  gap: 20px;
  margin-bottom: 30px;
}

.movie-title h1 {
  margin: 0;
  font-size: 28px;
  color: #333;
}

.movie-title .sub-info {
  font-size: 14px;
  color: #666;
  margin-top: 10px;
}

.poster-section {
  text-align: center;
}

.poster-section img {
  width: 250px;
  height: auto;
  border-radius: 8px;
  border: 1px solid #ddd;
}

.book-button {
  display: inline-block;
  margin-top: 15px;
  padding: 10px 20px;
  font-size: 16px;
  background-color: #5c67f2;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.book-button:hover {
  background-color: #4b52d6;
}

.tabs {
  display: flex;
  border-bottom: 2px solid #ddd;
  margin-bottom: 20px;
}

.tab {
  padding: 12px 20px;
  font-size: 16px;
  background: none;
  border: none;
  cursor: pointer;
  color: #333;
  border-bottom: 3px solid transparent;
  transition: all 0.2s;
}

.tab.active {
  border-bottom: 3px solid #5c67f2;
  font-weight: bold;
  color: #5c67f2;
}

.tab-content {
  display: none;
}

.tab-content#info {
  display: block;
}

.stats {
  display: flex;
  gap: 30px;
  margin-top: 30px;
}

.stats > div {
  flex: 1;
  text-align: center;
}

.big-number {
  font-size: 28px;
  color: #5c67f2;
  margin-top: 5px;
}
</style>

  <meta charset="UTF-8">
  <title>${movie.movieNm} - 상세보기</title>
  <link rel="stylesheet" href="/resources/css/movieDetail.css">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <!-- Header -->
  <%@ include file="../main/header.jsp" %>

  <div class="container">
    <div class="top-section">
      <div class="movie-title">
        <h1>${movie.movieNm}</h1>
        <p class="sub-info">예매율: 34.6% | 누적관객수: 581,362명</p>
      </div>
      <div class="poster-section">
        <img src="${empty movie.posterUrl ? '/resources/images/no-image.png' : movie.posterUrl}"
             onerror="this.onerror=null; this.src='/resources/images/no-image.png';"
             alt="${movie.movieNm} 포스터" />
        <button class="book-button" onclick="location.href='/reserve?movieCd=${movie.movieCd}'">예매하기</button>
        <button class="book-button" onclick="fav()">좋아요</button>
      </div>
    </div>

    <div class="tabs">
      <button class="tab active" onclick="showTab('info')">주요정보</button>
      <button class="tab" onclick="showTab('review')">실관람평</button>
      <button class="tab" onclick="showTab('schedule')">상영일정</button>
    </div>

    <div class="tab-content" id="info">
      <h2>개봉년도</h2>
      <p>${movie.openDt}</p>
	
	  <h2>제작년도</h2>
      <p>${movie.prdtYear}</p>
	  
      <div class="stats">
        <div>
          <h3>장르명</h3>
          <p class="big-number">${movie.genreNm}</p>
        </div>
        <div>
          <h3>감독명</h3>
          <p class="big-number">${movie.directors}</p>
        </div>
        <div>
          <h3>출연배우</h3>
          <p class="big-number">${movie.actors}</p>
        </div>
        <div>
          <h3>심의정보</h3>
          <p class="big-number">${movie.watchGradeNm}</p>
        </div>
        <div>
          <h3>런타임</h3>
          <p class="big-number">${movie.showTm}분</p>
        </div>
        <div>
          <canvas id="statsChart" width="300" height="150"></canvas>
        </div>
      </div>
    </div>

    <div class="tab-content" id="review" style="display:none;">
      <h2>실관람평</h2>
      <p>리뷰 내용 또는 별점 리스트</p>
    </div>

    <div class="tab-content" id="schedule" style="display:none;">
      <h2>상영일정</h2>
      <p>극장, 시간표 등 예매 가능 정보</p>
    </div>
  </div>
	
	
  <!-- Footer -->
  <%@ include file="../main/footer.jsp" %>
 
  <script>
    function showTab(tab) {
      document.querySelectorAll(".tab-content").forEach(el => el.style.display = "none");
      document.querySelectorAll(".tab").forEach(el => el.classList.remove("active"));
      document.getElementById(tab).style.display = "block";
      event.target.classList.add("active");
    }

    // 예시 차트
    const ctx = document.getElementById('statsChart');
    new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['월', '화', '수', '목', '금'],
        datasets: [{
          label: '관객수 추이',
          data: [120000, 220000, 400000, 510000, 581362],
          borderColor: 'blue',
          fill: false
        }]
      }
    });
  </script>
</body>
</html>