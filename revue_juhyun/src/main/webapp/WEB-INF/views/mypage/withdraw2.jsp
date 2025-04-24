<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 탈퇴 유의사항</title>
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      margin: 0;
      padding: 0;
    }
    .container {
      display: flex;
    }
    .sidebar {
      width: 180px;
      background-color: #f8f8f8;
      border-right: 1px solid #ddd;
      padding: 0;
    }
    .mypage-title {
      background-color: #c62828;
      color: white;
      font-weight: bold;
      text-align: center;
      padding: 12px 0;
    }
    .menu {
      list-style: none;
      padding: 0;
      margin: 0;
    }
    .menu li a {
      display: block;
      padding: 10px 16px;
      color: #333;
      text-decoration: none;
    }
    .menu li a.active {
      background-color: #ffe9e9;
      color: #d50000;
      font-weight: bold;
      border-left: 5px solid #d50000;
    }
    .content {
      padding: 40px;
      flex: 1;
    }
    .withdraw-box {
      border: 1px solid #ccc;
      background: #f5f5f5;
      padding: 30px;
      width: 500px;
    }
    .withdraw-box h3 {
      font-size: 18px;
      margin-bottom: 20px;
    }
    .notice-list {
      height: 200px;
      background: white;
      border: 1px solid #ccc;
      margin-bottom: 20px;
      padding: 15px;
      overflow-y: auto;
    }
    .agree-check {
      margin-bottom: 20px;
    }
    .btn-group button {
      padding: 8px 20px;
      font-size: 14px;
      margin-right: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <%@ include file="mypage_menu.jsp" %>
    
    
    <div class="content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <div class="withdraw-box">
        <h3><탈퇴 시 유의사항 안내></h3>
        <div class="notice-list">
          <!-- 탈퇴 유의사항을 작성하세요 -->
        </div>
        <div class="agree-check">
          <input type="checkbox" id="agree">
          <label for="agree">안내된 유의사항을 읽었으며, 회원 탈퇴에 동의합니다.</label>
        </div>
        <div class="btn-group">
          <button type="button">탈퇴</button>
          <button type="button">취소</button>
        </div>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>