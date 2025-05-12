<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 취향 수정</title>
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .popup-container {
      width: 350px;
      margin: 50px auto;
      border: 1px solid #ccc;
      background-color: #f0f0f0;
      padding: 20px;
      box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
    }

    .popup-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: bold;
      font-size: 16px;
      margin-bottom: 15px;
    }

    .popup-header button {
      background: none;
      border: none;
      font-size: 16px;
      cursor: pointer;
    }

    .section-title {
      margin: 10px 0 5px;
      font-weight: bold;
    }

    .genre-box {
      display: flex;
      flex-wrap: wrap;
      gap: 8px;
      margin-bottom: 15px;
    }

    .genre-box input[type="checkbox"] {
      margin-right: 5px;
    }

    .popup-footer {
      text-align: center;
    }

    .popup-footer button {
      padding: 6px 20px;
      font-size: 14px;
      background-color: #d32f2f;
      color: white;
      border: none;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="popup-container">
    <div class="popup-header">
      영화 취향 수정
      <button onclick="window.close()">×</button>
    </div>

    <div class="section-title">나의 영화 취향</div>
    <div class="genre-box">
      <span>${sessionScope.loginDTO.member_like_genre }</span> 
    </div>

    <form id="genreForm" action="${pageContext.request.contextPath}/mypage/updateGenre" method="post">
	  <div class="section-title">선호 장르 선택</div>
	  <div class="genre-box">
	    <c:forEach var="genre" items="${genreList}">
		  <label><input type="checkbox" name="genres" value="${genre}"> ${genre}</label>
		</c:forEach>
<!-- 	    <label><input type="checkbox" name="genres" value="액션"> 액션</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="로맨스"> 로맨스</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="어드벤처"> 어드벤처</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="애니메이션"> 애니메이션</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="범죄"> 범죄</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="드라마"> 드라마</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="공포호러"> 공포호러</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="스릴러"> 스릴러</label> -->
<!-- 	    <label><input type="checkbox" name="genres" value="코미디"> 코미디</label> -->
	  </div>

	  <div class="popup-footer">
		<button type="submit">수정</button>
	  </div>
    </form>
  </div>
  
  <script>
document.getElementById("genreForm").addEventListener("submit", function(event) {
  event.preventDefault(); // 기본 submit 막기

  // 폼 데이터를 수동으로 보냄
  const form = event.target;
  const formData = new FormData(form);

  fetch(form.action, {
    method: "POST",
    body: formData
  })
  .then(response => {
    if (response.ok) {
      // 부모 창 새로고침
      window.opener.location.reload();
      // 팝업 닫기
      window.close();
    } else {
      alert("서버 오류 발생! 다시 시도해주세요.");
    }
  })
  .catch(err => {
    alert("네트워크 오류 발생!");
    console.error(err);
  });
});
</script>
  
</body>
</html>