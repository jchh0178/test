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
	              <tr><th>영화코드</th><td><input type="text" name="movieCd" id="movieCd" readonly></td></tr>
	              <tr><th>제목</th><td><input type="text" name="movieNm" id="movieNm" readonly></td></tr>
	              <tr><th>영어제목</th><td><input type="text" name="movieNmEn" id="movieNmEn" readonly></td></tr>
	              <tr><th>감독</th><td><input type="text" name="directors" id="directors" readonly></td></tr>
	              <tr><th>배우</th><td><input type="text" name="actors" id="actors" readonly></td></tr>
	              <tr><th>장르</th><td><input type="text" name="genreNm" id="genreNm" readonly></td></tr>
	              <tr><th>국가</th><td><input type="text" name="nationNm" id="nationNm" readonly></td></tr>
	              <tr><th>상영시간</th><td><input type="text" name="showTm" id="showTm" readonly></td></tr>
	              <tr><th>개봉일</th><td><input type="text" name="openDt" id="openDt" readonly></td></tr>
	              <tr><th>관람등급</th><td><input type="text" name="watchGradeNm" id="watchGradeNm"></td></tr>
	              <tr><th>상영형태</th><td><input type="text" name="showType" id="showType"></td></tr>
	              <tr><th>줄거리</th><td><textarea name="summary" id="summary" readonly></textarea></td></tr>
	              <tr style="display:none;"><td colspan="2"><input type="hidden" name="posterUrl" id="posterUrl"></td></tr>
	            </table>
	          </div>
	          <div class="right">
	            <div class="poster-box" id="poster-box">
	            	<img id="poster" name="poster" alt="포스터" width="100px" height="140px">
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
  document.addEventListener("DOMContentLoaded", function () {
    const btn = document.getElementById("searchBtn");

    if (!btn) {
      console.error("❌ 버튼을 찾을 수 없습니다");
      return;
    }

    btn.addEventListener("click", function () {
      console.log("✅ 검색 버튼 클릭됨");

      const title = document.getElementById("movieTitle").value;
      if (!title) {
        alert("제목을 입력하세요");
        return;
      }

      fetch("${pageContext.request.contextPath}/movie/searchTMDB?title=" + encodeURIComponent(title))
        .then(res => res.json())
        .then(data => {
          console.log("📦 받은 데이터:", data);
		  
          document.getElementById("movieCd").value = data.movieCd || "";
          document.getElementById("movieNm").value = data.movieNm || "";
          document.getElementById("movieNmEn").value = data.movieNmEn || "";
          document.getElementById("openDt").value = data.openDt || "";
          document.getElementById("summary").value = data.summary || "";
          document.getElementById("directors").value = data.directors || "";
          document.getElementById("actors").value = data.actors || "";
          document.getElementById("showTm").value = data.showTm || "";
          document.getElementById("genreNm").value = data.genreNm || "";
          document.getElementById("nationNm").value = data.nationNm || "";
        
          document.getElementById("poster").src = data.posterUrl || "";
          document.getElementById("posterUrl").value = data.posterUrl || "";
        })
        .catch(err => {
          console.error("❌ API 호출 실패:", err);
          alert("영화 정보를 가져오는 중 오류가 발생했습니다.");
        });
    });
  });
</script>
</body>
</html>