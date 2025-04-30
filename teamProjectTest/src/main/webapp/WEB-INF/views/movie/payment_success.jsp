<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공</title>
</head>
<body>
    <h2>결제 성공 🎉</h2>
<p>주문번호: ${orderId}</p>
<p>결제수단: ${method}</p>
<p>결제일시: ${approvedAt}</p>
<p>카드사: ${cardCompany}</p>
<p>카드번호: ${cardNumber}</p>
<p>승인번호: ${approveNo}</p>

    
</body>
</html>