<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>결제 관리</title>
  
<style type="text/css">
body {
  margin: 0;
  font-family: 'Arial', sans-serif;
  background-color: #f5f5f5;
}

.container {
  display: flex;
}

main.content {
  flex: 1;
  padding: 30px;
  background-color: white;
}

h1 {
  margin-bottom: 20px;
}

.search-box {
  margin-bottom: 20px;
}

.search-box input {
  padding: 8px;
  margin-right: 10px;
}

.search-box button {
  padding: 8px 12px;
  background-color: #333;
  color: white;
  border: none;
  cursor: pointer;
}

.payment-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.payment-table th, .payment-table td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: center;
}

.payment-table th {
  background-color: #f0f0f0;
}

.detail-btn {
  padding: 6px 10px;
  background-color: #3498db;
  color: white;
  border: none;
  cursor: pointer;
}

.detail-btn:hover {
  background-color: #2980b9;
}

.pagination {
  text-align: center;
  margin-top: 10px;
}

.pagination a {
  margin: 0 4px;
  padding: 6px 10px;
  background-color: #eee;
  color: #333;
  text-decoration: none;
}

.pagination a.active {
  background-color: #333;
  color: white;
}
</style>

</head>
<body>
  <div class="container">
     <%@ include file="admin_menu.jsp" %>

    <main class="content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <h1>결제 관리</h1>

      <div class="search-box">
        <input type="text" placeholder="회원 ID 입력" />
        <input type="text" placeholder="예매번호 입력" />
        <button>검색</button>
      </div>

      <table class="payment-table">
        <thead>
          <tr>
            <th>No.</th>
            <th>회원 ID</th>
            <th>예매 번호</th>
            <th>영화명</th>
            <th>상영관</th>
            <th>좌석</th>
            <th>예매 날짜</th>
            <th>결제 상세 정보</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Kim12345</td>
            <td>103-011</td>
            <td>춘천</td>
            <td>본관</td>
            <td>F4</td>
            <td>2025-04-21</td>
            <td><button class="detail-btn">결제 상세 정보</button></td>
          </tr>
          <!-- 추가 결제 데이터 행 반복 -->
        </tbody>
      </table>

      <div class="pagination">
        <a href="#">«</a>
        <a class="active" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">»</a>
      </div>
      
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </main>
  </div>
</body>
</html>