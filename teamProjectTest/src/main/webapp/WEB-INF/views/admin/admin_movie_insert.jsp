<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 등록</title>
<style>
body {
  font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  padding: 0;
  background-color: #fff;
}

.admin-wrapper {
  display: flex;
  min-height: 100vh;
}

main.main-content {
  flex: 1;
  padding: 40px 60px;
  overflow-y: auto;
}

.container {
  max-width: 1000px;
  margin: 0 auto;
}

h2 {
  font-size: 22px;
  margin-bottom: 20px;
  font-weight: bold;
}

.search-bar {
  display: flex;
  margin-bottom: 20px;
}

.search-bar input[type="text"] {
  width: 400px;
  padding: 6px 10px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px 0 0 4px;
}

.search-bar button {
  padding: 6px 12px;
  border: 1px solid #ccc;
  background: #f0f0f0;
  border-left: none;
  cursor: pointer;
  border-radius: 0 4px 4px 0;
}

fieldset {
  border: 1px solid #ddd;
  padding: 30px 20px;
  display: flex;
  justify-content: space-between;
  background-color: #fff;
}

.left {
  width: 78%;
}

.left table {
  width: 100%;
  border-collapse: collapse;
}

.left table tr {
  height: 48px;
}

.left table th {
  text-align: left;
  padding-right: 10px;
  width: 90px;
}

.left table td input,
.left table td select,
.left table td textarea {
  width: 100%;
  padding: 8px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

.left table td textarea {
  resize: vertical;
  height: 70px;
}

.right {
  width: 20%;
  text-align: center;
}

.poster-box {
  width: 100px;
  height: 140px;
  background: #ddd;
  margin: 0 auto 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #666;
  font-size: 14px;
}

.submit-btn {
  margin-top: 30px;
  text-align: center;
}

.submit-btn button {
  background: #333;
  color: white;
  padding: 10px 30px;
  font-size: 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
</head>
<body>
  <%@ include file="../main/header.jsp" %>
	<div class="admin-wrapper">
	  <%@ include file="admin_menu.jsp" %>
	  <main class="main-content">
	    <div class="container">
	      <h2>영화 등록하기</h2>
	      <div class="search-bar">
	        <input type="text" id="movieTitle" placeholder="영화 제목을 입력하세요">
	        <button type="button" id="searchBtn">검색</button>
	      </div>
	      
	      <form action="${pageContext.request.contextPath}/admin/insertMovie" method="post">
	        <fieldset>
	          <div class="left">
	            <table>
	              <tr><th>영화코드</th><td><input type="text" name="movieCd" id="movieCd"></td></tr>
	              <tr><th>제목</th><td><input type="text" name="movieNm" id="movieNm"></td></tr>
	              <tr><th>감독</th><td><input type="text" name="directors" id="directors"></td></tr>
	              <tr><th>배우</th><td><input type="text" name="actors" id="actors"></td></tr>
	              <tr><th>장르</th><td><input type="text" name="genreNm" id="genreNm"></td></tr>
	              <tr><th>국가</th><td><input type="text" name="nationNm" id="nationNm"></td></tr>
	              <tr><th>상영시간</th><td><input type="text" name="showTm" id="showTm"></td></tr>
	              <tr><th>개봉일</th><td><input type="text" name="openDt" id="openDt"></td></tr>
	              <tr><th>관람등급</th><td><input type="text" name="watchGradeNm" id="watchGradeNm"></td></tr>
	              <tr><th>상영형태</th><td><input type="text" name="showType" id="showType"></td></tr>
	              <tr><th>줄거리</th><td><textarea name="summary" id="summary" readonly></textarea></td></tr>
	            </table>
	          </div>
	          <div class="right">
	            <div class="poster-box" id="poster-box">
	            	<img id="poster" alt="포스터" width="100px" height="140px">
	            </div>
	          </div>
	        </fieldset>
	        <div class="submit-btn">
	          <button type="submit">저장하기</button>
	        </div>
	      </form>
	    </div>
	  </main>
	</div>
	<%@ include file="../main/footer.jsp" %>
	
	<script>
    $('#searchBtn').on('click', function () {
      const title = $('#movieTitle').val();
      if (!title) return alert('제목을 입력하세요');

      fetch(`/movie/searchTMDB?title=${encodeURIComponent(title)}`)
        .then(res => res.json())
        .then(tmdb => {
          $('#movie_nm').val(tmdb.movieNm);
          $('#movie_nm_en').val(tmdb.movieNmEn);
          $('#open_dt').val(tmdb.openDt);
          $('#poster').attr('src', tmdb.posterUrl);
          $('#summary').val(tmdb.summary);
          $('#directors').val(tmdb.directors);
          $('#show_tm').val(tmdb.showTm);
          $('#genre_nm').val(tmdb.genreNm);
          $('#nation_nm').val(tmdb.nationNm);
          $('#actors').val(tmdb.actors);
        });
    });
  </script>
</body>
</html>