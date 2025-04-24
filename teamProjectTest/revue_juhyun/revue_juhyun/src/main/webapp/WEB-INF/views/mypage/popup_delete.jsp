<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>삭제</title>
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

    .confirm-message {
      text-align: center;
      font-size: 15px;
      margin: 30px 0;
    }

    .button-group {
      text-align: center;
      margin-top: 20px;
    }

    .button-group button {
      padding: 8px 20px;
      font-size: 14px;
      margin: 0 10px;
    }
  </style>
</head>
<body>
  <div class="popup-container">
    <div class="popup-header">
      삭제 확인
      <button onclick="window.close()">×</button>
    </div>

    <div class="confirm-message">
      삭제 하시겠습니까?
    </div>

    <div class="button-group">
      <button type="button" onclick="confirmDelete()">확인</button>
      <button type="button" onclick="window.close()">취소</button>
    </div>
  </div>

  <script>
    function confirmDelete() {
      // 삭제 요청을 서버로 전송하거나, 상위 창에 전달하는 로직 삽입
      alert("삭제되었습니다.");
      window.close();
    }
  </script>
</body>
</html>