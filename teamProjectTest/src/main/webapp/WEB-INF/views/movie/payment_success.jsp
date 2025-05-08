<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>결제 완료</title>
</head>
<body>
  <h2>${message}</h2>
  <p>결제수단: ${method}</p>
  <p>카드사: ${cardCompany}</p>
  <p>카드번호: ${cardNumber}</p>
  <p>승인번호: ${approveNo}</p>
  <p>결제일시: ${approvedAt}</p>
  <p>주문번호: ${orderId}</p>
  <a href="${pageContext.request.contextPath}/mypage/mymain">마이페이지로 이동</a>
</body>
</html>