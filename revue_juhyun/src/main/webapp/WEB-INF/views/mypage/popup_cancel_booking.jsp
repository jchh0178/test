<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예매 취소</title>
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .popup-container {
      width: 300px;
      margin: 100px auto;
      border: 1px solid #ccc;
      background-color: #f0f0f0;
      padding: 20px;
      box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    .popup-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: bold;
      font-size: 16px;
      margin-bottom: 20px;
      border-bottom: 1px solid #ccc;
      padding-bottom: 8px;
    }

    .popup-header button {
      background: none;
      border: none;
      font-size: 16px;
      cursor: pointer;
    }

    .message {
      font-size: 16px;
      margin: 20px 0;
    }

    .button-group {
      display: flex;
      justify-content: center;
      gap: 20px;
    }

    .button-group button {
      padding: 8px 20px;
      font-size: 14px;
      cursor: pointer;
      background-color: white;
      border: 1px solid #333;
    }
  </style>
</head>
<body>
  <div class="popup-container">
    <div class="popup-header">
      예매 취소
      <button onclick="window.close()">×</button>
    </div>
    <div class="message">
      예매를 취소 하시겠습니까?
    </div>
    <div class="button-group">
      <button>YES</button>
      <button>NO</button>
    </div>
  </div>
</body>
</html>