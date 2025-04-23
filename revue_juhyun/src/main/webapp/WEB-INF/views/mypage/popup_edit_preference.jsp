<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 취향 수정</title>
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .popup-container {
      width: 350px;
      margin: 50px auto;
      border: 1px solid #ccc;
      background-color: #f0f0f0;
      padding: 20px;
      box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
    }

    .popup-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: bold;
      font-size: 16px;
      margin-bottom: 15px;
    }

    .popup-header button {
      background: none;
      border: none;
      font-size: 16px;
      cursor: pointer;
    }

    .section-title {
      margin: 10px 0 5px;
      font-weight: bold;
    }

    .genre-box {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-bottom: 15px;
    }

    .genre-box input[type="checkbox"] {
      margin-right: 5px;
    }

    .popup-footer {
      text-align: center;
    }

    .popup-footer button {
      padding: 6px 20px;
      font-size: 14px;
      background-color: #d32f2f;
      color: white;
      border: none;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="popup-container">
    <div class="popup-header">
      영화 취향 수정
      <button onclick="window.close()">×</button>
    </div>

    <div class="section-title">나의 영화 취향</div>
    <div class="genre-box">
      <span>공포</span> <span>로맨스</span> <span>스릴러</span> <span>액션</span> <span>코메디</span>
    </div>

    <div class="section-title">선호 장르 선택</div>
    <div class="genre-box">
      <label><input type="checkbox"> 장르</label>
      <label><input type="checkbox"> 장르</label>
      <label><input type="checkbox"> 장르</label>
      <label><input type="checkbox"> 장르</label>
    </div>

    <div class="popup-footer">
      <button>수정</button>
    </div>
  </div>
</body>
</html>