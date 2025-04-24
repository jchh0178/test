<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 상세 내역</title>
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .popup-container {
      width: 320px;
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
      margin-bottom: 20px;
      border-bottom: 1px solid #999;
      padding-bottom: 8px;
    }

    .popup-header button {
      background: none;
      border: none;
      font-size: 16px;
      cursor: pointer;
    }

    .details-title {
      font-weight: bold;
      font-size: 15px;
      margin-bottom: 10px;
    }

    .details {
      font-size: 14px;
      line-height: 1.8;
      border-top: 1px solid #333;
      border-bottom: 1px solid #333;
      padding: 10px 0;
    }

    .close-btn {
      display: block;
      margin: 20px auto 0;
      padding: 8px 20px;
      font-size: 14px;
      cursor: pointer;
      border: 1px solid #999;
      background: white;
    }
  </style>
</head>
<body>
  <div class="popup-container">
    <div class="popup-header">
      결제상세내역
      <button onclick="window.close()">×</button>
    </div>
    <div class="details-title">결제정보</div>
    <div class="details">
      상품금액 &nbsp;&nbsp;32000원<br>
      최종 결제 금액 &nbsp;&nbsp;32000원<br>
      결제 수단 &nbsp;&nbsp;(네이버페이)<br>
      결제 일시 &nbsp;&nbsp;2025.04.30&nbsp;&nbsp;10:42:30
    </div>
    <button class="close-btn" onclick="window.close()">닫기</button>
  </div>
</body>
</html>
