<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 예매</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: Arial, sans-serif; background: #f5f5f5; }

    .booking-container {
      display: flex;
      max-width: 1200px;
      margin: 50px auto;
      gap: 20px;
    }

    .booking-step {
      flex: 1;
      background: white;
      border: 1px solid #ccc;
      border-radius: 10px;
      padding: 20px;
    }

    .booking-step h3 {
      margin-bottom: 15px;
      font-size: 18px;
      border-bottom: 1px solid #ddd;
      padding-bottom: 5px;
    }

    .movie-list, .theater-list, .date-list, .time-list {
      max-height: 400px;
      overflow-y: auto;
    }

    .item {
      padding: 10px;
      margin-bottom: 5px;
      border: 1px solid #eee;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.2s;
    }

    .item:hover {
      background: #e0f7fa;
    }

    .item.selected {
      background: #0288d1;
      color: white;
    }
  </style>
</head>
<body>

<!-- ✅ Header -->
<%@ include file="../main/header.jsp" %>

<div class="booking-container">
  <!-- STEP 1: 영화 선택 -->
  <div class="booking-step">
    <h3>1. 영화 선택</h3>
    <div class="movie-list" id="movieList">
      <!-- 영화 목록 표시 영역 -->
    </div>
  </div>

  <!-- STEP 2: 극장 선택 -->
  <div class="booking-step">
    <h3>2. 극장 선택</h3>
    <div class="theater-list" id="theaterList">
      <!-- 극장 정보 표시 -->
    </div>
  </div>

  <!-- STEP 3: 날짜 선택 -->
  <div class="booking-step">
    <h3>3. 날짜 선택</h3>
    <div class="date-list" id="dateList">
      <!-- 날짜 표시 -->
    </div>
  </div>

  <!-- STEP 4: 시간 선택 -->
  <div class="booking-step">
    <h3>4. 시간 선택</h3>
    <div class="time-list" id="timeList">
      <!-- 시간표 표시 -->
    </div>
  </div>
</div>

<script>
  // 클릭 시 선택 효과
  document.addEventListener('click', function(e) {
    if (e.target.classList.contains('item')) {
      const group = e.target.parentElement;
      group.querySelectorAll('.item').forEach(el => el.classList.remove('selected'));
      e.target.classList.add('selected');
    }
  });
</script>

<!-- ✅ Footer -->
<%@ include file="../main/footer.jsp" %>

</body>
</html>