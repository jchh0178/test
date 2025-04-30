<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 등록</title>
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

    .form-group input,
    .form-group select,
    .form-group textarea {
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

    .image-section input[type="file"] {
      display: block;
      margin-top: 10px;
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

    textarea {
      width: 100%;
      height: 60px;
    }

    .search-wrap {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 20px;
    }

    .search-wrap input {
      flex: 1;
      padding: 6px;
    }

    .search-wrap button {
      padding: 6px 12px;
      cursor: pointer;
    }

    input[readonly] {
      background-color: #eee;
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- 사이드바 -->
     <%@ include file="admin_menu.jsp" %>
 

    <!-- 메인 -->
    <div class="main">
       <!-- Header -->
    <%@ include file="../main/header.jsp" %>
      <h2>영화 등록하기</h2>

      <!-- 영화 검색 -->
      <div class="search-wrap">
        <input type="text" id="searchTitle" placeholder="영화 제목을 입력하세요">
        <button onclick="searchMovie()">검색</button>
      </div>

      <div class="form-container">
        <div class="form-section">
          <div class="form-group">
            <label>영화코드</label>
            <input type="text" value="자동 생성" readonly>
            <label>영화제목</label>
            <input type="text" id="title">
            <label>상영시간</label>
            <input type="text" id="runtime">
          </div>

          <div class="form-group">
            <label>장르</label>
            <input type="text" id="genre">
            <label>배우</label>
            <input type="text" id="actors">
            <label>감독</label>
            <input type="text" id="director">
          </div>

          <div class="form-group">
            <label>관람등급</label>
            <input type="text" id="grade">
            <label>개봉일자</label>
            <input type="date" id="releaseDate">
            <label>상영타입</label>
            <select id="type">
              <option>2D</option>
              <option>3D</option>
              <option>IMAX</option>
            </select>
          </div>

          <div class="form-group">
            <label>줄거리</label>
            <textarea id="summary"></textarea>
          </div>
        </div>

        <div class="image-section">
          <div>
            <div class="img-placeholder" id="poster">포스터</div>
            <input type="file" accept="image/*">
          </div>
        </div>
      </div>

      <div class="button-group">
        <button onclick="saveMovie()">저장하기</button>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>

 <!--  <script>
    // 오픈 API 검색 예시 (예: TMDB, KMDB 등 연동 가능)
    function searchMovie() {
      const title = document.getElementById('searchTitle').value;
      alert("검색 기능은 API 연동 후 구현됩니다. 제목: " + title);
      
      // 예: fetch("https://api.kmdb.or.kr/v1/search/movie?title=" + title)
      //       .then(res => res.json())
      //       .then(data => {
      //          document.getElementById('title').value = data.title;
      //          ...
      //       });
    }

    function saveMovie() {
      alert("저장 기능은 백엔드와 연동 후 구현됩니다.");
    }
  </script> -->
</body>
</html>