<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>좌석 선택</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f0f0f0;
      padding: 30px;
      text-align: center;
    }

    h2 {
      margin-bottom: 20px;
    }

    .screen {
      background: #ddd;
      width: 60%;
      margin: 0 auto 20px;
      padding: 10px;
      font-weight: bold;
    }

    .seat-grid {
      display: grid;
      grid-template-columns: repeat(12, 35px);
      justify-content: center;
      gap: 10px;
      margin-bottom: 20px;
    }

    .seat {
      width: 35px;
      height: 35px;
      background-color: #ccc;
      border-radius: 5px;
      cursor: pointer;
      transition: 0.2s;
    }

    .seat:hover {
      background-color: #999;
    }

    .seat.selected {
      background-color: #4caf50;
    }

    .seat.reserved {
      background-color: #e74c3c;
      cursor: not-allowed;
    }

    .legend {
      margin-top: 10px;
      display: flex;
      justify-content: center;
      gap: 20px;
    }

    .legend div {
      display: flex;
      align-items: center;
      gap: 5px;
    }

    button {
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #e50914;
      color: white;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    #selected-seats {
      margin-top: 10px;
      font-weight: bold;
    }
  </style>
</head>
<body>

    <!-- Header -->
    <%@ include file="../main/header.jsp" %>

  <h2>좌석 선택</h2>
  <div class="screen">스크린</div>

  <div class="seat-grid" id="seatGrid"></div>

  <div class="legend">
    <div><div class="seat"></div> 선택 가능</div>
    <div><div class="seat selected"></div> 선택됨</div>
    <div><div class="seat reserved"></div> 예약됨</div>
  </div>

  <div id="selected-seats">선택된 좌석: 없음</div>
  <button onclick="bookSeats()">예매하기</button>
  
   <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>

  <script>
    const seatGrid = document.getElementById('seatGrid');
    const selectedSeatsDisplay = document.getElementById('selected-seats');
    const rows = 10;
    const cols = 12;
    const reservedSeats = [5, 6, 23, 36, 74]; // 예약된 좌석 인덱스

    let selectedSeats = [];

    for (let i = 0; i < rows * cols; i++) {
      const seat = document.createElement('div');
      seat.classList.add('seat');
      seat.dataset.index = i;

      if (reservedSeats.includes(i)) {
        seat.classList.add('reserved');
      }

      seat.addEventListener('click', () => {
        if (seat.classList.contains('reserved')) return;

        seat.classList.toggle('selected');
        const seatIndex = parseInt(seat.dataset.index);

        if (seat.classList.contains('selected')) {
          selectedSeats.push(seatIndex);
        } else {
          selectedSeats = selectedSeats.filter(index => index !== seatIndex);
        }

        updateSelectedSeatsDisplay();
      });

      seatGrid.appendChild(seat);
    }

    function updateSelectedSeatsDisplay() {
      if (selectedSeats.length === 0) {
        selectedSeatsDisplay.textContent = '선택된 좌석: 없음';
      } else {
        selectedSeatsDisplay.textContent = '선택된 좌석: ' + selectedSeats.map(s => formatSeatNumber(s)).join(', ');
      }
    }

    function formatSeatNumber(index) {
      const row = Math.floor(index / cols) + 1;
      const col = (index % cols) + 1;
      return `${row}열 ${col}번`;
    }

    function bookSeats() {
      if (selectedSeats.length === 0) {
        alert("좌석을 선택해주세요!");
        return;
      }

      alert("예매 완료!\n" + selectedSeats.map(formatSeatNumber).join('\n'));
    }
  </script>

</body>
</html>

</html>