<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 상세 보기</title>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

    .container {
      display: flex;
      height: 100vh;
    }

   

    /* 메인 */
    .main {
      flex: 1;
      padding: 40px;
    }

    h2 {
      margin-bottom: 30px;
    }

    .form-container {
      display: flex;
      justify-content: space-between;
      border: 1px solid #aaa;
      padding: 20px;
      background-color: #fdfdfd;
    }

    .form-section {
      flex: 2;
    }

    .form-group {
      display: flex;
      flex-wrap: wrap;
      margin-bottom: 10px;
    }

    .form-group label {
      width: 120px;
      margin-bottom: 10px;
      font-weight: bold;
    }

    .form-group input, .form-group select, .form-group textarea {
      flex: 1;
      margin-bottom: 10px;
      padding: 6px;
    }

    .image-section {
      flex: 1;
      margin-left: 40px;
      display: flex;
      align-items: center;
      justify-content: center;
      border-left: 1px solid #ddd;
    }

    .image-section .img-placeholder {
      width: 100px;
      height: 140px;
      background-color: #ccc;
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      font-weight: bold;
    }

    .button-group {
      margin-top: 30px;
      text-align: center;
    }

    .button-group button {
      padding: 10px 20px;
      margin: 0 10px;
      border: none;
      cursor: pointer;
      background-color: #444;
      color: white;
    }

    .button-group button:hover {
      background-color: #222;
    }

    input[readonly] {
      background-color: #eee;
    }

    textarea {
      width: 100%;
      height: 60px;
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- 사이드바 -->
     <%@ include file="admin_menu.jsp" %>

    <!-- 메인 영역 -->
    <div class="main">
      <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <h2>영화 상세보기</h2>

      <div class="form-container">
        <!-- 영화 정보 폼 -->
        <div class="form-section">
          <div class="form-group">
            <label>영화코드</label>
            <input type="text" value="1" readonly>
            <label>영화제목</label>
            <input type="text" value="영화 제목">
            <label>상영시간</label>
            <input type="text" value="120분">
          </div>
          <div class="form-group">
            <label>장르</label>
            <input type="text" value="액션">
            <label>배우</label>
            <input type="text" value="홍길동, 김영희">
            <label>감독</label>
            <input type="text" value="감독 이름">
          </div>
          <div class="form-group">
            <label>관람등급</label>
            <input type="text" value="15세 이상">
            <label>개봉일자</label>
            <input type="date" value="2025-04-01">
            <label>상영타입</label>
            <select>
              <option>2D</option>
              <option selected>3D</option>
              <option>IMAX</option>
            </select>
          </div>
          <div class="form-group">
            <label>줄거리</label>
            <textarea>줄거리 내용을 입력하세요</textarea>
          </div>
        </div>

        <!-- 이미지 영역 -->
        <div class="image-section">
          <div class="img-placeholder">이미지</div>
        </div>
      </div>

      <!-- 수정/삭제 버튼 -->
      <div class="button-group">
        <button>수정하기</button>
        <button>삭제하기</button>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
</body>
</html>