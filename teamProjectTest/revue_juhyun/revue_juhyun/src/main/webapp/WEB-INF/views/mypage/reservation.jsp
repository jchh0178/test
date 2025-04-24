<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>예매 내역</title>
  <style>
    @charset "UTF-8";
    * { box-sizing: border-box; margin: 0; padding: 0; }
    body { font-family: sans-serif; background: #f5f5f5; }

    .container {
      display: flex;
      width: 100%;
      min-height: 100vh;
    }

    .sidebar {
      width: 200px;
      background: #e0e0e0;
      padding-top: 20px;
    }

    .sidebar a {
      display: block;
      padding: 12px 16px;
      text-decoration: none;
      color: #000;
    }

    .sidebar a.active {
      background-color: #fff;
      color: red;
      font-weight: bold;
      border-left: 4px solid red;
    }

    .main {
      flex: 1;
      padding: 30px;
    }

    .section {
      background: white;
      padding: 20px;
      margin-bottom: 30px;
      border-radius: 8px;
      box-shadow: 0 0 8px rgba(0,0,0,0.1);
    }

    .section h2 {
      margin-bottom: 16px;
      font-size: 20px;
    }

    .filter-box {
      margin-bottom: 20px;
    }

    .filter-box label {
      margin-right: 8px;
    }

    .filter-box input[type="month"], .filter-box button {
      padding: 6px;
      margin-right: 8px;
    }

    .ticket-info {
      display: flex;
      gap: 20px;
      margin-bottom: 20px;
    }

    .poster-box {
      width: 120px;
      height: 160px;
      background: #ccc;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 14px;
    }

    .details {
      flex: 1;
    }

    .details p {
      margin-bottom: 8px;
    }

    .btn-group button {
      margin-right: 10px;
      padding: 6px 12px;
      border: none;
      background: #c62828;
      color: white;
      border-radius: 4px;
      cursor: pointer;
    }

    .btn-group button:hover {
      background: #a31818;
    }

    .cancel-table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    .cancel-table th, .cancel-table td {
      border: 1px solid #ccc;
      padding: 8px;
      text-align: center;
    }

    .default-text {
      text-align: center;
      padding: 20px;
      color: #999;
    }
  </style>
</head>
<body>
  <div class="container">
  <%@ include file="mypage_menu.jsp" %>
  
    

    <div class="main">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <div class="section">
        <h2> 예매 내역</h2>
        <div class="filter-box">
          <label for="month-select">날짜 조회</label>
          <input type="month" id="month-select" value="2025-04">
          <button>조회</button>
        </div>

        <div class="ticket-info">
          <div class="poster-box">영화<br>포스터</div>
          <div class="details">
            <p>예매 번호: 12345678</p>
            <p>영화명: 영화 이름</p>
            <p>상영관: 강남 CGV</p>
            <p>관람일시: 2025-04-25 19:00</p>
            <p>결제일시: 2025-04-01</p>
            <p>관람 인원: 2명</p>
            <p>관람 좌석: F5, F6</p>

            <div class="btn-group">
              <button>결제내역</button>
              <button>교환권 출력</button>
              <button>예매 취소</button>
            </div>
          </div>
        </div>
      </div>

      <div class="section">
        <h2> 예매 취소 내역</h2>
        <table class="cancel-table">
          <thead>
            <tr>
              <th>취소일시</th>
              <th>영화명</th>
              <th>상영관</th>
              <th>상영일시</th>
              <th>취소금액</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td colspan="5" class="default-text">Default : 취소 내역이 없습니다.</td>
            </tr>
          </tbody>
        </table>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>