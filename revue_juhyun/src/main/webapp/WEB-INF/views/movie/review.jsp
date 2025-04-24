<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8" />
  <title>영화 리뷰</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background: #f5f5f5;
      padding: 30px;
      max-width: 700px;
      margin: auto;
    }

    h1 {
      color: #333;
      text-align: center;
    }

    .movie-info {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 30px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .review-form {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      margin-bottom: 30px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    input, textarea, select, button {
      width: 100%;
      padding: 10px;
      margin-top: 10px;
      border-radius: 5px;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    button {
      background-color: #e50914;
      color: white;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      background-color: #c40812;
    }

    .review-list {
      background: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .review-item {
      border-bottom: 1px solid #eee;
      padding: 10px 0;
    }

    .review-item:last-child {
      border-bottom: none;
    }

    .star {
      color: gold;
    }
  </style>
</head>
<body>
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>


  <h1> 영화 리뷰</h1>

  <div class="movie-info">
    <h2>영화 제목: 영화1</h2>
    <p>영화 1 상세 설명</p>
  </div>

  <div class="review-form">
    <h3>리뷰 작성</h3>
    <input type="text" id="username" placeholder="닉네임을 입력하세요" />
    <select id="rating">
      <option value="5">⭐⭐⭐⭐⭐ (5점)</option>
      <option value="4">⭐⭐⭐⭐ (4점)</option>
      <option value="3">⭐⭐⭐ (3점)</option>
      <option value="2">⭐⭐ (2점)</option>
      <option value="1">⭐ (1점)</option>
    </select>
    <textarea id="comment" rows="4" placeholder="리뷰를 입력하세요"></textarea>
    <button onclick="submitReview()">리뷰 등록</button>
  </div>

  <div class="review-list" id="reviewList">
    <h3>📢 리뷰 목록</h3>
    <!-- JS로 추가됨 -->
  </div>
  
   <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
  

  <script>
    const reviewList = document.getElementById('reviewList');

    function submitReview() {
      const name = document.getElementById('username').value.trim();
      const rating = document.getElementById('rating').value;
      const comment = document.getElementById('comment').value.trim();

      if (!name || !comment) {
        alert("닉네임과 리뷰를 모두 입력해주세요.");
        return;
      }

      const review = document.createElement('div');
      review.classList.add('review-item');
      review.innerHTML = `
        <strong>${name}</strong> - 
        <span class="star">${'⭐'.repeat(rating)}</span><br />
        <p>${comment}</p>
      `;

      reviewList.appendChild(review);

      // 입력 초기화
      document.getElementById('username').value = '';
      document.getElementById('comment').value = '';
      document.getElementById('rating').value = '5';
    }
  </script>

</body>
</html>