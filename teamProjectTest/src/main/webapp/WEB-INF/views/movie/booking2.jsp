<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 예매</title>
  <style>
 body {
      font-family: 'Noto Sans KR', sans-serif;
      margin: 0;
      background-color: #f9f9f9;
    }

    .container {
      display: flex;
      max-width: 1000px;
      margin: 40px auto;
      background: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
      overflow: hidden;
    }

    .step {
      flex: 1;
      padding: 20px;
      border-right: 1px solid #eee;
    }

    .step:last-child {
      border-right: none;
    }

    h3 {
      font-size: 16px;
      margin-bottom: 15px;
      color: #333;
    }

    ul {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    li {
      padding: 10px;
      margin-bottom: 10px;
      border: 1px solid #ddd;
      border-radius: 4px;
      cursor: pointer;
      transition: 0.2s;
      font-size: 14px;
    }

    li:hover {
      background-color: #f3f3f3;
    }

    li.selected {
      background-color: #e50914;
      color: #fff;
      font-weight: bold;
    }

    .next-button {
      display: block;
      width: 100%;
      padding: 12px;
      margin-top: 20px;
      background-color: #e50914;
      color: white;
      border: none;
      border-radius: 4px;
      font-size: 15px;
      cursor: pointer;
    }

    .next-button:disabled {
      background-color: #ccc;
      cursor: not-allowed;
    }
  </style>
</head>
<body>

  <%@ include file="../main/header.jsp" %>

  <div class="container">
    <div class="step" id="step1">
      <h3>1. 영화를 선택하세요</h3>
      <ul id="movieList"></ul>
    </div>

    <div class="step" id="step2">
      <h3>2. 극장을 선택하세요</h3>
      <ul id="theaterList"></ul>
    </div>

    <div class="step" id="step3">
      <h3>3. 상영 시간을 선택하세요</h3>
      <ul id="timeList"></ul>
      <button class="next-button" id="seatBtn" disabled>좌석 선택하기</button>
    </div>
  </div>

  <%@ include file="../main/footer.jsp" %>

  <script>
    const movieList = document.getElementById('movieList');
    const theaterList = document.getElementById('theaterList');
    const timeList = document.getElementById('timeList');
    const seatBtn = document.getElementById('seatBtn');

    let selectedMovie = null;
    let selectedTheater = null;
    let selectedTime = null;

    const movies = ["범죄도시4", "쿵푸팬더4", "파묘"];
    const theaters = ["CGV 부산", "CGV 해운대", "CGV 서울"];
    const times = ["5월 10일 14:00", "5월 10일 17:00", "5월 10일 20:00"];

    function renderList(container, items, callback) {
      container.innerHTML = "";
      items.forEach((item, idx) => {
        const li = document.createElement('li');
        li.textContent = item;
        li.dataset.index = idx;
        li.addEventListener('click', function() {
          Array.from(container.children).forEach(el => el.classList.remove('selected'));
          this.classList.add('selected');
          callback(idx);
        });
        container.appendChild(li);
      });
    }

    renderList(movieList, movies, idx => selectedMovie = movies[idx]);
    renderList(theaterList, theaters, idx => selectedTheater = theaters[idx]);
    renderList(timeList, times, idx => {
      selectedTime = times[idx];
      seatBtn.disabled = false;
    });

    const contextPath = "<c:out value='${pageContext.request.contextPath}'/>";

    seatBtn.addEventListener('click', () => {
      if (selectedMovie && selectedTheater && selectedTime) {
        location.href = contextPath + "/movie/mseat"
          + "?movie=" + encodeURIComponent(selectedMovie)
          + "&theater=" + encodeURIComponent(selectedTheater)
          + "&time=" + encodeURIComponent(selectedTime);
      }
    });
  </script>

</body>
</html>
