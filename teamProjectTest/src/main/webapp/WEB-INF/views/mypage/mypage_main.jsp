<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이페이지 메인</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .container {
      display: flex;
      padding: 0;
    }

    .sidebar {
      width: 180px;
      background-color: #f8f8f8;
      border-right: 1px solid #ddd;
    }

    .main {
      flex: 1;
      padding: 40px;
    }

    .profile-box {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .profile-left {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .profile-img {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background: #ccc;
    }

    .greeting {
      font-size: 18px;
      font-weight: bold;
    }

    .preference-box {
      border: 1px solid #999;
      padding: 10px;
      min-width: 200px;
    }

    .edit-btn {
      padding: 5px 10px;
      border: 1px solid #999;
      background-color: #fff;
      cursor: pointer;
    }

    .booking-section {
      border-top: 1px solid #ccc;
      padding-top: 20px;
    }

    .booking-box {
      display: flex;
      gap: 20px;
      margin-bottom: 20px;
    }

    .poster {
      width: 100px;
      height: 150px;
      background: #ddd;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
    }

    .movie-info {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-around;
    }

    .cancel-btn {
      background-color: #d32f2f;
      color: white;
      padding: 5px 10px;
      border: none;
      cursor: pointer;
      width: 150px;
    }

    .more-link {
      display: inline-block;
      text-decoration: none;
      color: #333;
      margin-top: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <%@ include file="mypage_menu.jsp" %>

    <div class="main">
      <!-- Header -->
    <%@ include file="../main/header.jsp" %>
      <div class="profile-box">
        <div class="profile-left">
          <div class="profile-img"></div>
          <div class="greeting">
            안녕하세요! <br>
            <strong>김땡땡 님</strong>
          </div>
        </div>
        <div>
          <div class="preference-box">나의 영화취향</div>
          <button class="edit-btn">수정</button>
        </div>
      </div>

      <div class="booking-section">
        <h3>나의 예매 내역</h3>
        <div class="booking-box">
          <div class="poster">영화<br>포스터</div>
          <div class="movie-info">
            <div>결제일시: 2025-04-01</div>
            <div>예매 번호: 12345678</div>
            <div>예매 극장: 강남CGV</div>
            <div>상영 날짜: 2025-04-10</div>
            <button class="cancel-btn">예매 취소</button>
          </div>
        </div>
        <a href="#" class="more-link">더보기</a>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>
