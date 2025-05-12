<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>마이페이지 메인</title>
  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .container {
      display: flex;
      padding: 0;
    }

    .sidebar {
      width: 180px;
      background-color: #f8f8f8;
      border-right: 1px solid #ddd;
    }

    .main {
      flex: 1;
      padding: 40px;
    }

    .profile-box {
      display: flex;
      align-items: center;
      justify-content: space-between;
      margin-bottom: 20px;
    }

    .profile-left {
      display: flex;
      align-items: center;
      gap: 20px;
    }

    .profile-img {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      background: #ccc;
    }

    .greeting {
      font-size: 18px;
      font-weight: bold;
    }

    .preference-box {
      border: 1px solid #999;
      padding: 10px;
      min-width: 200px;
    }

    .edit-btn {
      padding: 5px 10px;
      border: 1px solid #999;
      background-color: #fff;
      cursor: pointer;
    }

    .booking-section {
      border-top: 1px solid #ccc;
      padding-top: 20px;
    }

    .booking-box {
      display: flex;
      gap: 20px;
      margin-bottom: 20px;
    }

    .poster {
      width: 100px;
      height: 150px;
      background: #ddd;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
    }

    .movie-info {
      flex-grow: 1;
      display: flex;
      flex-direction: column;
      justify-content: space-around;
    }

    .cancel-btn {
      background-color: #d32f2f;
      color: white;
      padding: 5px 10px;
      border: none;
      cursor: pointer;
      width: 150px;
    }

    .more-link {
      display: inline-block;
      text-decoration: none;
      color: #333;
      margin-top: 10px;
    }
  </style>
  <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common.css" />
</head>
<body>
  <div class="container">
    <%@ include file="mypage_menu.jsp" %>

    <div class="main">
      <!-- Header -->
    <%@ include file="../main/header.jsp" %>
     <div class="profile-box" style="flex-direction: column; align-items: flex-start;">
	  <div class="profile-left">
		<!-- 프로필 사진 출력 -->
	    <div class="profile-img">
		  <c:choose>
		    <c:when test="${not empty sessionScope.loginDTO.member_profile}">
		      <img src="${pageContext.request.contextPath}/resources/upload/${sessionScope.loginDTO.member_profile}" 
		           alt="프로필" width="60" height="60" style="border-radius: 50%;">
		    </c:when>
		    <c:otherwise>
		      <img src="${pageContext.request.contextPath}/resources/images/default_profile.png" 
		           alt="기본프로필" width="60" height="60" style="border-radius: 50%;">
		    </c:otherwise>
		  </c:choose>
		</div>
	    <!-- 인사말 + 회원 이름 출력 -->
	    <div class="greeting">
	      안녕하세요! <br>
	      <strong>${sessionScope.loginDTO.member_name } 님</strong>
	    </div>
	  </div>
	  <div style="margin-top: 10px;">
	  
	    <!-- 영화취향 출력 -->
	    <div class="preference-box">
	      나의 영화취향: ${sessionScope.loginDTO.member_like_genre }
	    </div>
	    <button class="edit-btn" onclick="window.open('${pageContext.request.contextPath}/mypage/popup1', 'popup', 'width=400,height=500')">수정</button>
	  </div>
	</div>

      <div class="booking-section">
        <h3>나의 예매 내역</h3>
         <c:choose>
		    <c:when test="${empty listBooking}">
		      <p>예매한 내역이 없습니다.</p>
		    </c:when>
		    <c:otherwise>
		      <c:forEach var="booking" items="${listBooking}">
		        <div class="booking-box">
		          <div class="poster">영화<br>포스터</div>
		          <div class="movie-info">
		            <div>결제일시: ${booking.pay_date}</div>
		            <div>예매 번호: ${booking.pay_id}</div>
		            <div>예매 극장: ${booking.theater_name}</div>
		            <div>상영 날짜: ${booking.screen_date}</div>
            <button class="cancel-btn">예매 취소</button>
          </div>
        </div>
      </c:forEach>
    </c:otherwise>
  </c:choose>

        <a href="${pageContext.request.contextPath }/mypage/reservation" class="more-link">더보기</a>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>
