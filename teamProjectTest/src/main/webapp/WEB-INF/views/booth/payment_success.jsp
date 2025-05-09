<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>결제 완료</title>
  <style>
    .container { max-width: 800px; margin: 50px auto; text-align: center; }
    .order-number { font-size: 24px; font-weight: bold; margin-bottom: 20px; }
    .movie-info img { width: 200px; height: auto; margin-bottom: 10px; }
    .section { margin-bottom: 30px; }
  </style>
</head>
<body>

  <%@ include file="../main/header.jsp" %>

  <div class="container">
    <div class="order-number">
      주문번호: ${orderId}
    </div>

    <div class="section movie-info">
    <p>포스터 경로: ${poster}</p>
      <img src="${poster}" alt="영화 포스터">
      <h2>${movieTitle}</h2>
    </div>

    <div class="section theater-info">
      <p>극장: ${theaterName}</p>
    </div>

    <div class="section screen-info">
      <p>상영관: ${screenName}</p>
      <p>상영 시간: ${schedule}</p>
    </div>

    <div class="section seat-info">
      <p>좌석: ${seatNames}</p>
    </div>

    <div class="section payment-info">
      <p>결제 금액: ${pay_price}원</p>
      <p>결제수단: ${method}</p>
      <p>카드사: ${cardCompany}</p>
      <p>카드번호: ${cardNumber}</p>
      <p>승인번호: ${approveNo}</p>
      <p>결제일시: ${approvedAt}</p>
    </div>

    <a href="${pageContext.request.contextPath}/mypage/mymain">마이페이지로 이동</a>
  </div>

  <%@ include file="../main/footer.jsp" %>

</body>
</html>