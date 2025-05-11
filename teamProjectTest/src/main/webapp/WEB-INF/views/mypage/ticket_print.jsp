<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>영화 티켓 교환권</title>
  <style>
    body { font-family: 'Malgun Gothic'; padding: 30px; }
    .ticket {
      border: 1px dashed #333;
      padding: 20px;
      width: 400px;
    }
    .ticket h2 {
      text-align: center;
      margin-bottom: 20px;
    }
  </style>
</head>
<body onload="window.print()">
  <div class="ticket">
    <h2>🎟 영화 티켓 교환권</h2>
    <p><strong>예매자:</strong> ${sessionScope.loginDTO.member_name}</p>
    <p><strong>영화 제목:</strong> ${movieTitle}</p>
    <p><strong>상영 시간:</strong> ${screenTime}</p>
    <p><strong>좌석:</strong> ${seatInfo}</p>
    <p><strong>예매 번호:</strong> ${payId}</p>
  </div>
</body>
</html>