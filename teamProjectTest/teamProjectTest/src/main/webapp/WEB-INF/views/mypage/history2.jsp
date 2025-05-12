<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>나의 리뷰 내역</title>
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
    .review-box {
      border: 1px solid #ddd;
      background: #f9f9f9;
      padding: 20px;
      display: flex;
      margin-bottom: 20px;
    }
    .poster {
      width: 100px;
      height: 140px;
      background: #ccc;
      margin-right: 20px;
    }
    .review-info {
      flex: 1;
      font-size: 14px;
      line-height: 1.6;
    }
    .review-buttons {
      display: flex;
      flex-direction: column;
      justify-content: space-between;
    }
    .review-buttons button {
      padding: 6px 12px;
      margin-bottom: 6px;
      font-size: 13px;
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
        <div>무비 타임라인</div>
        <div class="active">나의 리뷰 내역</div>
      </div>

      <!-- 리뷰 박스 예시 -->
      <div class="review-box">
        <div class="poster">영화 포스터</div>
        <div class="review-info">
          영화명<br>
          영화 장르<br>
          출연진<br>
          평점<br>
          영화 등급<br>
          긍정 / 부정<br>
          리뷰 내용<br>
          리뷰 작성 일자
        </div>
        <div class="review-buttons">
          <button type="button">수정</button>
          <button type="button">삭제</button>
        </div>
      </div>
 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>
