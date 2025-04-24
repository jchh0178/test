<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제 내역 상세 보기</title>
  
<style type="text/css">
body {
  margin: 0;
  font-family: 'Arial', sans-serif;
}

.container {
  display: flex;
}

main.content {
  flex: 1;
  padding: 30px;
  background-color: #f9f9f9;
}

h1 {
  margin-bottom: 20px;
}

.detail-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 30px;
  background-color: white;
}

.detail-table th, .detail-table td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: left;
}

.detail-table th {
  background-color: #f0f0f0;
  width: 20%;
}

.detail-table td {
  width: 30%;
}

.btn-group {
  display: flex;
  gap: 10px;
}

.btn-group button {
  padding: 10px 16px;
  font-size: 16px;
  background-color: #444;
  color: white;
  border: none;
  cursor: pointer;
}

.btn-group button:hover {
  background-color: #666;
}

/* 모달 */
.modal {
  display: none;
  position: fixed;
  z-index: 100;
  left: 0;
  top: 0;
  width: 100vw;
  height: 100vh;
  background-color: rgba(0,0,0,0.4);
  align-items: center;
  justify-content: center;
}

.modal-content {
  background: white;
  padding: 20px 30px;
  border-radius: 5px;
  text-align: center;
}

.modal-buttons {
  margin-top: 20px;
  display: flex;
  justify-content: center;
  gap: 20px;
}

.modal-buttons button {
  padding: 8px 14px;
  font-size: 14px;
  cursor: pointer;
  border: none;
  background-color: #444;
  color: white;
}

.modal-buttons button:hover {
  background-color: #777;
}
</style>

</head>
<body>
  <div class="container">
     <%@ include file="admin_menu.jsp" %>

    <main class="content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <h1>결제 내역 상세 보기</h1>

      <table class="detail-table">
        <tr>
          <th>예매 번호</th><td>103-011</td>
          <th>회원 ID</th><td>Kim12345</td>
        </tr>
        <tr>
          <th>영화명</th><td>춘천</td>
          <th>극장명</th><td>본관</td>
        </tr>
        <tr>
          <th>결제 방법</th><td>카드</td>
          <th>결제일</th><td>2025-04-21</td>
        </tr>
        <tr>
          <th>총 결제 금액</th><td colspan="3">₩13,000</td>
        </tr>
        <tr>
          <th>인원수</th><td>1명</td>
          <th>좌석번호</th><td>F4</td>
        </tr>
      </table>

      <div class="btn-group">
        <button id="cancelBtn">결제 취소</button>
        <button onclick="window.location.href='payment.html'">이전</button>
      </div>

      <!-- 모달 -->
      <div class="modal" id="modal">
        <div class="modal-content">
          <p>예매 취소 및 환불 처리 하시겠습니까?</p>
          <div class="modal-buttons">
            <button>예</button>
            <button id="closeModal">아니오</button>
          </div>
        </div>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </main>
  </div>

  <!-- <script>
    const cancelBtn = document.getElementById("cancelBtn");
    const modal = document.getElementById("modal");
    const closeModal = document.getElementById("closeModal");

    cancelBtn.onclick = () => {
      modal.style.display = "flex";
    };

    closeModal.onclick = () => {
      modal.style.display = "none";
    };
  </script> -->
</body>
</html>