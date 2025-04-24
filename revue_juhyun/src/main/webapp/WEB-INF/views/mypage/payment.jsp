<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>결제 수단 등록</title>
  <style>
    body {
      font-family: '맑은 고딕', sans-serif;
      margin: 0;
      padding: 0;
    }

    .mypage-wrapper {
      display: flex;
    }

    .mypage-content {
      flex: 1;
      padding: 40px;
    }

    .payment-box {
      width: 500px;
      margin: 0 auto;
      background-color: #f7f7f7;
      padding: 30px;
      border: 1px solid #ddd;
    }

    .payment-title {
      font-size: 20px;
      font-weight: bold;
      text-align: center;
      margin-bottom: 25px;
    }

    .payment-group {
      margin-bottom: 15px;
    }

    .payment-group label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
      font-size: 14px;
    }

    .payment-group input,
    .payment-group select {
      width: 100%;
      height: 35px;
      padding: 5px 10px;
      font-size: 14px;
      box-sizing: border-box;
    }

    .payment-group select {
      background-color: #fff;
    }

    .payment-expire {
      display: flex;
      gap: 10px;
    }

    .payment-expire select {
      flex: 1;
    }

    .payment-buttons {
      text-align: center;
      margin-top: 25px;
    }

    .payment-buttons button {
      padding: 8px 20px;
      font-size: 14px;
      margin: 0 10px;
    }

    .cvv-help {
      font-size: 12px;
      color: #007bff;
      margin-top: 2px;
    }
  </style>
</head>
<body>
  <div class="mypage-wrapper">
    <%@ include file="mypage_menu.jsp" %>

    <div class="mypage-content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <div class="payment-box">
        <div class="payment-title">결제 수단 등록</div>

        <form action="registerCard" method="post">
          <div class="payment-group">
            <label for="cardType">*카드 종류</label>
            <select id="cardType" name="cardType" required>
              <option value="">--선택하세요--</option>
              <option value="visa">비자카드</option>
              <option value="master">마스터카드</option>
              <option value="amex">아멕스</option>
              <option value="korean">국내카드</option>
            </select>
          </div>

          <div class="payment-group">
            <label for="cardNumber">*카드 번호</label>
            <input type="text" id="cardNumber" name="cardNumber" placeholder="카드 번호를 입력하세요" required>
          </div>

          <div class="payment-group">
            <label>*만료 날짜</label>
            <div class="payment-expire">
              <select name="expMonth" required>
                <option value="">월</option>
                <% for (int i = 1; i <= 12; i++) { %>
                  <option value="<%= i %>"><%= i %>월</option>
                <% } %>
              </select>
              <select name="expYear" required>
                <option value="">년도</option>
                <% for (int y = 2024; y <= 2034; y++) { %>
                  <option value="<%= y %>"><%= y %>년</option>
                <% } %>
              </select>
            </div>
          </div>

          <div class="payment-group">
            <label for="cvv">*카드 보안 번호 (CV2)</label>
            <input type="text" id="cvv" name="cvv" required>
            <div class="cvv-help">도움말 보기</div>
          </div>

          <div class="payment-group">
            <label for="cardName">*카드에 표기된 이름</label>
            <input type="text" id="cardName" name="cardName" required>
          </div>

          <div class="payment-group">
            <label for="phone">*카드 소유자 전화 번호</label>
            <input type="text" id="phone" name="phone" required>
          </div>

          <div class="payment-buttons">
            <button type="submit">등록</button>
            <button type="button" onclick="location.href='home.jsp'">취소</button>
          </div>
        </form>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>