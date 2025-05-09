<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>결제 테스트</title>
    <script src="https://js.tosspayments.com/v1"></script>
</head>
<body>
    <h2>결제 테스트</h2>

    <p>영화: ${param.movie}</p>
    <p>극장: ${param.theater}</p>
    <p>시간: ${param.time}</p>
    <p>좌석: ${param.seats}</p>
    <p>금액: ${param.price}</p>

    <button onclick="requestPay()">카드로 결제하기</button>

    <script>
        function requestPay() {
            const clientKey = "test_ck_6bJXmgo28e7jqkoev09YVLAnGKWx";
            const tossPayments = TossPayments(clientKey);

            const movie = "${param.movie}";
            const seats = "${param.seats}";
            const orderName = movie + " (" + seats + ")";

            tossPayments.requestPayment("카드", {
                amount: "${param.price}",  // 필요 시 계산 로직 추가
                orderId: "ORDER_" + new Date().getTime(),
                orderName: orderName,
                customerName: "박주현",  // 로그인 세션에서 꺼내는 것도 가능
                successUrl: "http://localhost:8080/teamProjectTest/booth/pay/success",
                failUrl: "http://localhost:8080/teamProjectTest/booth/pay/fail"
            });
        }
    </script>
</body>
</html>