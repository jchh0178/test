<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>나의 무비 히스토리</title>
  <link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/mypage_menu.css">
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      margin: 0;
      padding: 0;
    }
    .container {
      display: flex;
    }
    .content {
      flex: 1;
      padding: 40px;
    }
    .page-title {
      font-size: 22px;
      font-weight: bold;
      margin-bottom: 20px;
    }
    .tab-menu {
      display: flex;
      margin-bottom: 20px;
    }
    .tab-menu div {
      padding: 10px 20px;
      border: 1px solid #ddd;
      cursor: pointer;
    }
    .tab-menu .active {
      background-color: #c62828;
      color: #fff;
      font-weight: bold;
    }
    .year-nav {
      margin-bottom: 20px;
    }
    .year-nav span {
      margin: 0 10px;
      font-size: 15px;
      cursor: pointer;
    }
    .movie-box {
      background: #f9f9f9;
      padding: 20px;
      display: flex;
      align-items: center;
      border: 1px solid #ddd;
    }
    .poster {
      width: 100px;
      height: 140px;
      background: #ccc;
      margin-right: 20px;
    }
    .info {
      flex: 1;
    }
    .btn-review {
      margin-left: 20px;
    }
  </style>
</head>
<body>
  <div class="container">
    <%@ include file="mypage_menu.jsp" %>
    <div class="content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <div class="page-title">나의 무비 히스토리</div>

      <div class="tab-menu">
        <div class="active">무비 타임라인</div>
        <div>나의 리뷰 내역</div>
      </div>

      <div class="year-nav">
        <span>&lt;</span>
        <span>2022</span>
        <span>2023</span>
        <span>2024</span>
        <span><strong>2025</strong></span>
        <span>&gt;</span>
      </div>

      <div class="movie-box">
        <div class="poster">영화 포스터</div>
        <div class="info">
          영화명<br>
          상영관<br>
          관람일시
        </div>
        <div class="btn-review">
          <button type="button">리뷰작성</button>
        </div>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>
