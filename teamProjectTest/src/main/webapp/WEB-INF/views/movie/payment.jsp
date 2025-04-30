<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>결제 테스트</title>
    <script src="https://js.tosspayments.com/v1"></script>
</head>
<body>
    <h2>더미 결제 테스트</h2>

    <button onclick="requestPay()">카드로 결제하기</button>

    <script>
        function requestPay() {
            const clientKey = "test_ck_6bJXmgo28e7jqkoev09YVLAnGKWx";  // 복사해둔 키 넣기!
            const tossPayments = TossPayments(clientKey);

            tossPayments.requestPayment("카드", {
                amount: 24000,
                orderId: "ORDER_" + new Date().getTime(), // 고유 주문번호
                orderName: "파묘 (G5,G6)",
                customerName: "박주현",
                successUrl: "http://localhost:8080/teamProjectTest/movie/pay/success",
                failUrl: "http://localhost:8080/teamProjectTest/movie/pay/fail"
            });
        }
    </script>
</body>
</html>