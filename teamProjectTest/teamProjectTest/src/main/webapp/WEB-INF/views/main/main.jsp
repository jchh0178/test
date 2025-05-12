<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <style>
    body {
      margin: 0;
      font-family: 'Arial', sans-serif;
      background-color: #f4f4f4;
    }

    .container {
      max-width: 1200px;
      margin: auto;
      padding: 20px;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      background-color: #fff;
      padding: 20px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    }

    .nav-left, .nav-right {
      display: flex;
      align-items: center;
      gap: 10px;
    }

    .nav-button, .main-logo, .login-btn {
      padding: 8px 16px;
      border: 1px solid #ccc;
      background-color: #fff;
      border-radius: 4px;
      cursor: pointer;
    }

    .nav-button:hover, .main-logo:hover, .login-btn:hover {
      background-color: #eee;
    }

    .poster-section {
      background: white;
      padding: 30px;
      margin-top: 20px;
      border-radius: 8px;
      text-align: center;
    }

    .poster-list {
      display: flex;
      justify-content: center;
      gap: 20px;
      margin-top: 20px;
    }

    .poster {
      width: 180px;
      background-color: #ccc;
      height: 270px;
      display: flex;
      justify-content: center;
      align-items: center;
      font-weight: bold;
      border-radius: 8px;
    }

    .reserve-btn {
      margin-top: 10px;
      padding: 8px 12px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .reserve-btn:hover {
      background-color: #0056b3;
    }

  
  </style>
</head>
<body>
  <div class="container">
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
<!--     <header> -->
<!--       <div class="nav-left"> -->
<!--         <button class="nav-button">☰</button> -->
<!--         <button class="nav-button" onclick="goPage('movie')">영화</button> -->
<!--         <button class="nav-button" onclick="goPage('theater')">극장</button> -->
<!--         <button class="nav-button" onclick="goPage('booking')">예매</button> -->
<!--       </div> -->
<!--       <div> -->
<!--         <button class="main-logo" onclick="goPage('home')">메인 로고</button> -->
<!--       </div> -->
<!--       <div class="nav-right"> -->
<!--         <button class="nav-button" onclick="goPage('mypage')">마이 페이지</button> -->
<!--         <button class="login-btn" onclick="goPage('login')">로그인</button> -->
<!--         <button class="login-btn" onclick="goPage('signup')">회원가입</button> -->
<!--         <button class="nav-button" onclick="goPage('cs')">고객센터</button> -->
<!--       </div> -->
<!--     </header> -->

    <!-- Box Office -->
    <section class="poster-section">
    <h2>박스 오피스</h2>
    <div class="poster-list">
      <c:forEach var="movieDTO" items="${movieList}">
      	<div>
      		<div class="poster" onmouseover="showDetail(1)" onclick="goDetail(1)">
			<c:choose>
			  <c:when test="${empty movieDTO.posterUrl}">
			    <img src="<c:url value='/resources/images/no-image.png'/>" alt="기본 포스터" width="150"/>
			  </c:when>
			  <c:otherwise>
			    <img src="${movieDTO.posterUrl}"
			         onerror="this.onerror=null; this.src='/resources/images/no-image.png';"
			         alt="${movieDTO.movieNm} 포스터" width="150"/>
			  </c:otherwise>
			</c:choose>
			</div>
          <button class="reserve-btn" onclick="goBooking(1)">빠른 예매 버튼</button>
      	</div>
      </c:forEach>
	</div>
    </section>

    <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
  </div>

  <script>
    function goPage(page) {
      alert(page + " 페이지로 이동합니다."); // 실제 경로 설정 시 location.href 사용
    }

    function showDetail(movieId) {
      console.log('영화 상세 내용 보기 - 영화 ID:', movieId);
    }

    function goDetail(movieId) {
      alert('영화 상세 페이지로 이동: ' + movieId);
    }

    function goBooking(movieId) {
      alert('예매 페이지로 이동 (영화 ID: ' + movieId + ')');
    }
  </script>
</body>
</html>