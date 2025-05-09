<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 예매</title>
  <style>
    body { font-family: 'Noto Sans KR', sans-serif; margin: 0; background: #f9f9f9; }
    .container { display: flex; max-width: 1000px; margin: 40px auto; background: white; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.05); overflow: hidden; }
    .step { flex: 1; padding: 20px; border-right: 1px solid #eee; }
    .step:last-child { border-right: none; }
    h3 { font-size: 16px; margin-bottom: 15px; color: #333; }
    ul { list-style: none; padding: 0; margin: 0; }
    li { padding: 10px; margin-bottom: 10px; border: 1px solid #ddd; border-radius: 4px; cursor: pointer; transition: 0.2s; font-size: 14px; }
    li:hover { background-color: #f3f3f3; }
    li.selected { background-color: #e50914; color: #fff; font-weight: bold; }
    .next-button { display: block; width: 100%; padding: 12px; margin-top: 20px; background-color: #e50914; color: white; border: none; border-radius: 4px; font-size: 15px; cursor: pointer; }
    .next-button:disabled { background-color: #ccc; cursor: not-allowed; }
    .region-theater-wrap { display: flex; gap: 40px; align-items: flex-start; margin-top: 10px; }
    .region-theater-wrap > div { flex: 1; }
    .region-theater-wrap h4 { margin-bottom: 10px; font-size: 15px; color: #333; border-bottom: 1px solid #eee; padding-bottom: 5px; }
  </style>
</head>
<body>

  <%@ include file="../main/header.jsp" %>

  <div class="container">
    <div class="step">
      <h3>1. 영화를 선택하세요</h3>
      <ul id="movieList">
        <c:forEach var="movie" items="${movies}">
          <li data-value="${movie.movie_nm}">${movie.movie_nm}</li>
        </c:forEach>
      </ul>
    </div>

    <div class="step">
      <h3>2. 지역을 선택하세요</h3>
      <div class="region-theater-wrap">
        <div>
          <h4>지역</h4>
          <ul id="regionList">
            <c:forEach var="region" items="${regions}">
              <li data-value="${region}">${region}</li>
            </c:forEach>
          </ul>
        </div>
        <div>
          <h4>극장</h4>
          <ul id="theaterList"></ul>
        </div>
      </div>
    </div>

    <div class="step">
      <h3>3. 상영 날짜를 선택하세요</h3>
      <div class="region-theater-wrap">
        <div>
          <select id="yearSelect"></select>
          <select id="monthSelect"></select>
        </div>
        <div>
          <ul id="dayList"></ul>
        </div>
        <div>
          <h4>상영 시간을 선택하세요</h4>
          <ul id="timeList"></ul>
        </div>
      </div>
      <button class="next-button" id="seatBtn" disabled>좌석 선택하기</button>
    </div>
  </div>

  <%@ include file="../main/footer.jsp" %>

  <script>
    const contextPath = "<c:out value='${pageContext.request.contextPath}'/>";
    const movieList = document.getElementById('movieList');
    const regionList = document.getElementById('regionList');
    const theaterList = document.getElementById('theaterList');
    const yearSelect = document.getElementById('yearSelect');
    const monthSelect = document.getElementById('monthSelect');
    const dayList = document.getElementById('dayList');
    const timeList = document.getElementById('timeList');
    const seatBtn = document.getElementById('seatBtn');

    let selectedMovie = null;
    let selectedRegion = null;
    let selectedTheater = null;
    let selectedDate = null;
    let selectedTime = null;

    const theaters = [
      <c:forEach var="theater" items="${theaters}">
        { name: "${theater.theater_name}", region: "${theater.theater_region}" },
      </c:forEach>
    ];

    // 공통 하이라이트 함수
    function highlightSelection(list, value) {
      Array.from(list.children).forEach(li => {
        li.classList.toggle('selected', li.dataset.value === value);
      });
    }

    // 영화 선택
    movieList.addEventListener('click', e => {
      if (e.target.tagName === 'LI') {
        selectedMovie = e.target.dataset.value;
        highlightSelection(movieList, selectedMovie);
      }
    });

    // 지역 선택 및 극장 리스트 출력
    regionList.addEventListener('click', e => {
      if (e.target.tagName === 'LI') {
        selectedRegion = e.target.dataset.value;
        highlightSelection(regionList, selectedRegion);
        const filtered = theaters.filter(t => t.region === selectedRegion);
        theaterList.innerHTML = "";
        filtered.forEach(t => {
          const li = document.createElement('li');
          li.textContent = t.name;
          li.dataset.value = t.name;
          li.addEventListener('click', () => {
            selectedTheater = t.name;
            highlightSelection(theaterList, selectedTheater);
          });
          theaterList.appendChild(li);
        });
      }
    });

    // 년도/월 선택
    const now = new Date();
    for (let y = now.getFullYear(); y <= now.getFullYear() + 1; y++) {
      const opt = new Option(y + '년', y);
      yearSelect.add(opt);
    }
    for (let m = 1; m <= 12; m++) {
      const opt = new Option(m + '월', m);
      monthSelect.add(opt);
    }
    yearSelect.value = now.getFullYear();
    monthSelect.value = now.getMonth() + 1;

    yearSelect.addEventListener('change', loadDays);
    monthSelect.addEventListener('change', loadDays);

    function loadDays() {
      const year = yearSelect.value;
      const month = monthSelect.value - 1;
      const lastDay = new Date(year, month + 1, 0).getDate();
      dayList.innerHTML = "";
      for (let d = 1; d <= lastDay; d++) {
        const dateStr = `${year}-${String(month + 1).padStart(2, '0')}-${String(d).padStart(2, '0')}`;
        const li = document.createElement('li');
        li.textContent = dateStr;
        li.dataset.value = dateStr;
        li.addEventListener('click', () => loadSchedules(dateStr));
        dayList.appendChild(li);
      }
    }

    loadDays();

    function loadSchedules(date) {
      selectedDate = date;
      fetch(contextPath + "/booth/schedules?screen_date=" + date)
        .then(res => res.json())
        .then(schedules => {
          timeList.innerHTML = "";
          schedules.forEach(s => {
            const li = document.createElement('li');
            li.textContent = s.screen_start_time;
            li.dataset.value = s.screen_start_time;
            li.addEventListener('click', () => {
              selectedTime = s.screen_start_time;
              highlightSelection(timeList, selectedTime);
              seatBtn.disabled = false;
            });
            timeList.appendChild(li);
          });
        });
    }

    seatBtn.addEventListener('click', () => {
      if (selectedMovie && selectedTheater && selectedDate && selectedTime) {
        location.href = `${contextPath}/booth/seat?movie=${encodeURIComponent(selectedMovie)}&theater=${encodeURIComponent(selectedTheater)}&date=${encodeURIComponent(selectedDate)}&time=${encodeURIComponent(selectedTime)}`;
      }
    });
  </script>

</body>
</html>