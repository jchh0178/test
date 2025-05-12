<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>선호 영화관</title>
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
    .favorite-box {
      border: 1px solid #ccc;
      background: #f9f9f9;
      padding: 30px;
      border-radius: 8px;
      max-width: 600px;
    }
    .favorite-list {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }
    .theater-btn {
      padding: 12px;
      font-size: 16px;
      background: #fff;
      border: 1px solid #ccc;
      border-radius: 5px;
      cursor: default;
      text-align: center;
    }
  </style>
</head>
<body>
<div class="container">
  <%@ include file="mypage_menu.jsp" %>
  <div class="content">
      <!-- Header -->
    <%@ include file="../main/header.jsp" %>
  
    <div class="page-title">선호하는 영화관</div>
    <div class="favorite-box">
      <div class="favorite-list">
        <div class="theater-btn">부산 서면</div>
        <div class="theater-btn">부산 동래</div>
        <div class="theater-btn">창원 롯데백화점</div>
      </div>
    </div>
     <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
  </div>
</div>
</body>
</html>