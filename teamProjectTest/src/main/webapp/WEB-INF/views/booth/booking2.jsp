<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 예매</title>
  <style>
    body { font-family: 'Noto Sans KR', sans-serif; margin: 0; background-color: #f9f9f9; }
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
    .region-theater-wrap {
  display: flex;
  gap: 40px;
  align-items: flex-start;
  margin-top: 10px;
}

.region-theater-wrap > div {
  flex: 1;
}

.region-theater-wrap h4 {
  margin-bottom: 10px;
  font-size: 15px;
  color: #333;
  border-bottom: 1px solid #eee;
  padding-bottom: 5px;
}

#regionList li, #theaterList li {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  padding: 8px 12px;
}

.theater-guide {
  margin-bottom: 10px;
  font-size: 14px;
  color: #555;
}
  </style>
</head>
<body>

  <%@ include file="../main/header.jsp" %>

  <div class="container">
    <div class="step" id="step1">
      <h3>1. 영화를 선택하세요</h3>
      <ul id="movieList">
        <c:forEach var="movie" items="${movies}">
          <li onclick="selectMovie('${movie.movie_nm}')">${movie.movie_nm}</li>
        </c:forEach>
      </ul>
    </div>

   <div class="step" id="step2">
  <h3>2. 지역을 선택하세요</h3>
  <div class="region-theater-wrap">
    
    <!-- 지역 목록 -->
    <div>
      <h4>지역</h4>
      <ul id="regionList">
        <c:forEach var="region" items="${regions}">
          <li onclick="selectRegion('${region}')">${region}</li>
        </c:forEach>
      </ul>
    </div>

    <!-- 극장 안내 및 목록 -->
    <div>
      <h4>극장</h4>
      <div class="theater-guide">극장을 선택하세요</div>  <!-- 여기가 포인트 -->
      <ul id="theaterList"></ul>
    </div>

  </div>
</div>

 <div class="step" id="step3">
      <h3>3. 상영 날짜를 선택하세요</h3>
      <ul id="dateList"></ul>

      <h3>4. 상영 시간을 선택하세요</h3>
      <ul id="timeList"></ul>

      <button class="next-button" id="seatBtn" disabled>좌석 선택하기</button>
    </div>
  </div>

  <%@ include file="../main/footer.jsp" %>

  <script>
    const movieList = document.getElementById('movieList');
    const regionList = document.getElementById('regionList');
    const theaterList = document.getElementById('theaterList');
    const dateList = document.getElementById('dateList');
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

    function selectMovie(movie) {
      selectedMovie = movie;
      highlightSelected(movieList, movie);
    }

    function selectRegion(region) {
      selectedRegion = region;
      highlightSelected(regionList, region);

      const filtered = theaters.filter(t => t.region === region);
      renderList(theaterList, filtered.map(t => t.name), idx => selectedTheater = filtered[idx].name);
    }

    function highlightSelected(container, value) {
      Array.from(container.children).forEach(el => {
        if (el.textContent === value) {
          el.classList.add('selected');
        } else {
          el.classList.remove('selected');
        }
      });
    }

    function renderList(container, items, callback) {
      container.innerHTML = "";
      items.forEach((item, idx) => {
        const li = document.createElement('li');
        li.textContent = item;
        li.addEventListener('click', function() {
          Array.from(container.children).forEach(el => el.classList.remove('selected'));
          this.classList.add('selected');
          callback(idx);
        });
        container.appendChild(li);
      });
    }

    const today = new Date();
    const contextPath = "<c:out value='${pageContext.request.contextPath}'/>";

    for (let i = 0; i < 10; i++) {
      const date = new Date(today);
      date.setDate(today.getDate() + i);
      const dateStr = date.toISOString().split('T')[0];
      const li = document.createElement('li');
      li.textContent = dateStr;
      li.addEventListener('click', () => loadSchedules(dateStr));
      dateList.appendChild(li);
    }

    function loadSchedules(date) {
    	  selectedDate = date;
    	  highlightSelected(dateList, date);
    	  
    	  fetch(contextPath + "/booth/schedules?screen_date=" + date)
    	    .then(response => response.json())
    	    .then(schedules => {
    	      timeList.innerHTML = "";
    	      schedules.forEach(s => {
    	        const timestamp = Number(s.screen_start_time);
    	        const dateObj = new Date(timestamp);
    	        const formatted = 
    	          String(dateObj.getHours()).padStart(2, '0') + ':' + 
    	          String(dateObj.getMinutes()).padStart(2, '0');

    	        const li = document.createElement('li');
    	        li.textContent = formatted;
    	        li.dataset.time = s.screen_start_time;
    	        li.dataset.screenId = s.screen_id;
    	        
    	        li.addEventListener('click', () => {
   	        	  selectedTime = s.screen_start_time;
   	        	  selectedScreenId = s.screen_id;
    	          highlightSelected(timeList, formatted);
    	          seatBtn.disabled = false;
    	        });
    	        timeList.appendChild(li);
    	      });
    	    });
    	}

    seatBtn.addEventListener('click', () => {
      if (selectedMovie && selectedTheater && selectedDate && selectedTime) {
        location.href = contextPath + "/booth/seat"
          + "?movie=" + encodeURIComponent(selectedMovie)
          + "&theater=" + encodeURIComponent(selectedTheater)
          + "&date=" + encodeURIComponent(selectedDate)
          + "&time=" + encodeURIComponent(selectedTime)
          + "&screen_id=" + encodeURIComponent(selectedScreenId);
      }
    });
  </script>

</body>
</html>