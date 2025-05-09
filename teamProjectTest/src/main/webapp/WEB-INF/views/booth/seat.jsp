<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>좌석 선택</title>
  <style>
    body {
      font-family: 'Noto Sans KR', sans-serif;
      background: #f9f9f9;
      text-align: center;
      padding: 40px;
    }

    .seat-wrapper {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
      margin-bottom: 30px;
    }

    .seat-row {
      display: flex;
      gap: 10px;
    }

    .seat {
      width: 40px;
      height: 40px;
      background-color: #ddd;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: 0.2s;
      color: transparent;
      text-shadow: none;
    }

    .seat.clicked {
      background-color: #e50914;
      color: white;
    }

    .selected-info {
      margin-top: 20px;
      font-size: 16px;
    }

    .selected-info span {
      font-weight: bold;
      color: #e50914;
    }
    .legend { 
    display: flex; 
    justify-content: center; 
    gap: 20px; 
    margin-top: 20px; 
    }
    
    .legend div {
     display: flex; 
     align-items: center; 
     gap: 5px; 
     }
     
    .legend .color-box {
     width: 20px; 
     height: 20px; 
     display: inline-block; 
     border-radius: 3px; 
     }
     
    .legend .available {
     background: #ddd; 
     }
     
    .legend .selected {
     background: #e50914; 
     }
     
    .legend .reserved {
     background: #999; 
     }
  </style>
</head>
<body>

  <%@ include file="../main/header.jsp" %>

  <h2>좌석을 선택하세요</h2>
	<!-- 인원수 선택 -->
  <div style="margin-top: 20px;">
    <label>성인: <input type="number" id="adultCount" value="0" min="0" style="width: 50px;"></label>
    <label>학생: <input type="number" id="studentCount" value="0" min="0" style="width: 50px;"></label>
  </div>
 <br>

  <div class="seat-wrapper"></div>
 <!-- 색상 안내 -->
  <div class="legend">
    <div><span class="color-box available"></span> 선택 가능</div>
    <div><span class="color-box selected"></span> 선택됨</div>
    <div><span class="color-box reserved"></span> 예약됨</div>
  </div>
  <div class="selected-info">선택된 좌석: <span id="selectedSeats">없음</span></div>

  <div style="margin-top: 10px;">
    총 금액: <span id="totalPrice">0</span> 원
  </div>

  <!-- 예매하기 폼 -->
  <form action="${pageContext.request.contextPath }/booth/confirm" method="post" id="reserveForm">
	  <input type="hidden" name="member_id" value="${sessionScope.member_id}">
	  
	  <input type="hidden" name="screen_id" value="${param.screen_id}"> 
	
	  <input type="hidden" name="movie" id="movieInput">
	  <input type="hidden" name="theater" id="theaterInput">
	  <input type="hidden" name="time" id="timeInput">
	  <input type="hidden" name="seats" id="seatsInput">
	  <input type="hidden" name="price" id="priceInput">
	  <button type="submit" style="margin-top: 20px;">예매하기</button>
  </form>

  <%@ include file="../main/footer.jsp" %>

  <script>
  	//변수 선언 
    const seatWrapper = document.querySelector(".seat-wrapper");
    const selectedDisplay = document.getElementById("selectedSeats");

    //자리 이름 저장
    let selectedSeats = [];

    //행, 열 
    const rows = ['A','B','C','D','E','F','G','H','I','J'];
    const cols = 12;

    //한줄씩 seatWrapper에 가져다붙임
    for (let i = 0; i < rows.length; i++) {
      const rowDiv = document.createElement("div");
      rowDiv.classList.add("seat-row");
      seatWrapper.appendChild(rowDiv);

      //각 자리버튼 만들기
      for (let j = 0; j < cols; j++) {
        const input = document.createElement("input");
        input.type = "button";
        input.name = "seats";
        input.classList = "seat";
        input.value = mapping(i, j);  // ex. A0, B3 등
        input.textContent = input.value;

        //클릭하면 클릭 이벤트
       input.addEventListener('click', function() {
		  const seatName = input.value;
		  const totalAllowed =
		    parseInt(document.getElementById("adultCount").value || 0) +
		    parseInt(document.getElementById("studentCount").value || 0);
		
		  if (input.classList.contains("clicked")) {
		    // 이미 선택된 좌석을 다시 클릭한 경우 (선택 해제)
		    input.classList.remove("clicked");
		    selectedSeats = selectedSeats.filter(s => s !== seatName);
		  } else {
		    // 새로운 좌석 선택 시 제한 확인
		    if (selectedSeats.length >= totalAllowed) {
		    	console.log(totalAllowed);
		      alert('선택 가능한 좌석 수는 총 ' + totalAllowed + '개입니다.');
		      return;
		    }
		    input.classList.add("clicked");
		    if (!selectedSeats.includes(seatName)) {
		      selectedSeats.push(seatName);
		    }
		  }
		
		  updateSelectedDisplay();
		});


        rowDiv.appendChild(input);
      }
    }

    //맵핑 (A1, B2 형식으로 바꿈)
    function mapping(i, j) {
      const alphabet = ['A','B','C','D','E','F','G','H','I','J'];
      return alphabet[i] + (j + 1);
    }

    function updateSelectedDisplay() {
      selectedDisplay.textContent = selectedSeats.length > 0 ? selectedSeats.join(', ') : "없음";
    }
    
    // 가격 계산
    document.getElementById("adultCount").addEventListener("input", updatePrice);
    document.getElementById("studentCount").addEventListener("input", updatePrice);

    function updatePrice() {
      const adultPrice = 12000;
      const studentPrice = 8000;
      const adultCount = parseInt(document.getElementById("adultCount").value);
      const studentCount = parseInt(document.getElementById("studentCount").value);
      const total = (adultPrice * adultCount) + (studentPrice * studentCount);
      document.getElementById("totalPrice").textContent = total;
    }
    
    // 예매하기 버튼
    document.getElementById("reserveForm").addEventListener("submit", function(e) {
    	  if (selectedSeats.length === 0) {
    	    e.preventDefault();
    	    alert("좌석을 선택해주세요!");
    	    return;
    	  }

    	  // 이 값들은 예매 페이지에서 쿼리스트링으로 넘어옴
    	  const urlParams = new URLSearchParams(window.location.search);
    	  const movie = urlParams.get("movie");
    	  const theater = urlParams.get("theater");
    	  const time = urlParams.get("time");

    	  document.getElementById("movieInput").value = movie;
    	  document.getElementById("theaterInput").value = theater;
    	  document.getElementById("timeInput").value = time;
    	  document.getElementById("seatsInput").value = selectedSeats.join(",");
    	  document.getElementById("priceInput").value = document.getElementById("totalPrice").textContent;
    	});
    
  </script>

</body>
</html>