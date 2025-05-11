<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>결제 전 정보 확인</title>
   <script src="https://js.tosspayments.com/v1"></script>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background-color: #f9f9f9;
      text-align: center;
      padding: 40px;
    }

    .info-box {
      display: inline-block;
      background: white;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
      text-align: left;
    }

    .info-box h2 {
      margin-bottom: 20px;
    }

    .info-box p {
      margin: 10px 0;
      font-size: 16px;
    }

    .confirm-button {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #e50914;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }
  </style>
</head>
<body>

  <%@ include file="../main/header.jsp" %>

  <div class="info-box">
    <h2>예매 정보 확인</h2>
    <p>영화: ${param.movie}</p>
    <p>극장: ${param.theater}</p>
    <p id="screenTime">상영 시간: </p>
    <p>선택한 좌석: ${param.seats}</p>
    <p>총 금액: ${param.price}</p>

<%--     <form action="${pageContext.request.contextPath }/booth/payment" method="get"> --%>
<%--       <input type="hidden" name="movie" value="${param.movie}"> --%>
<%--       <input type="hidden" name="theater" value="${param.theater}"> --%>
<%--       <input type="hidden" name="time" value="${param.time}"> --%>
<%--       <input type="hidden" name="seats" value="${param.seats}"> --%>
<%--       <input type="hidden" name="price" value="${param.price}"> --%>
<!--       <button type="submit" class="confirm-button">결제하기</button> -->
<!--     </form> -->
  
  <button class="confirm-button" onclick="requestPay()">결제하기</button>
  
  </div>

  <%@ include file="../main/footer.jsp" %>
  <script>
        function requestPay() {
            const clientKey = "test_ck_6bJXmgo28e7jqkoev09YVLAnGKWx";
            const tossPayments = TossPayments(clientKey);

            const movie = "${param.movie}";
            const seats = "${param.seats}";
            const orderName = movie + " (" + seats + ")";

            tossPayments.requestPayment("카드", {
                amount: "${param.price}",  
                orderId: "ORDER_" + new Date().getTime(),
                orderName: orderName,
                customerName: "${customerName}",  
                successUrl: "http://localhost:8080/teamProjectTest/booth/pay/success",
                failUrl: "http://localhost:8080/teamProjectTest/booth/pay/fail"
            });
        }
        
        (function() {
        	  const rawTime = "${param.time}";
        	  if (!isNaN(rawTime)) {
        	    const date = new Date(Number(rawTime));
        	    const hours = String(date.getHours()).padStart(2, '0');
        	    const minutes = String(date.getMinutes()).padStart(2, '0');
        	    document.getElementById("screenTime").textContent = "상영 시간: " + hours + ":" + minutes;
        	  } else {
        	    document.getElementById("screenTime").textContent = "상영 시간: 알 수 없음";
        	  }
        	})();
    </script>

</body>
</html>