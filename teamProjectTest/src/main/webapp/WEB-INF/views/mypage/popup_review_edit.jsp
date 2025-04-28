<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>리뷰 수정하기</title>
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .popup-container {
      width: 600px;
      margin: 100px auto;
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
      border-bottom: 1px solid #999;
      padding-bottom: 8px;
    }

    .popup-header button {
      background: none;
      border: none;
      font-size: 16px;
      cursor: pointer;
    }

    .review-content {
      display: flex;
      gap: 20px;
    }

    .poster {
      width: 100px;
      height: 140px;
      background: #ddd;
      text-align: center;
      line-height: 140px;
      font-weight: bold;
    }

    .info-area {
      flex-grow: 1;
    }

    .info-area table {
      width: 100%;
      font-size: 14px;
      margin-bottom: 10px;
    }

    .info-area td {
      padding: 4px;
    }

    textarea {
      width: 100%;
      height: 80px;
      font-size: 14px;
      padding: 6px;
      resize: none;
    }

    .button-group {
      text-align: right;
      margin-top: 15px;
    }

    .button-group button {
      padding: 6px 14px;
      font-size: 13px;
      margin-left: 10px;
    }
  </style>
</head>
<body>
  <div class="popup-container">
    <div class="popup-header">
      리뷰 수정하기
      <button onclick="window.close()">×</button>
    </div>

    <div class="review-content">
      <div class="poster">영화<br>포스터</div>
      <div class="info-area">
        <table>
          <tr><td>영화명</td><td>영화 장르</td><td>영화 등급</td></tr>
          <tr><td>출연진</td><td>평점</td><td>긍정 / 부정</td></tr>
        </table>
        <textarea placeholder="실관람평을 남겨주세요."></textarea>
      </div>
    </div>

    <div class="button-group">
      <button type="submit">저장</button>
      <button type="button" onclick="window.close()">취소</button>
    </div>
  </div>
</body>
</html>
