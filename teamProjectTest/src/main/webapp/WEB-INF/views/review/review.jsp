<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>영화 리뷰</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css" />
</head>
<body>
  <h1>영화 리뷰</h1>

  <div class="movie-title">
    <h2>영화 제목: ${movieDTO.rank} - ${movieDTO.movieNm}</h2>
    <input type="hidden" id="movieId" value="${movieDTO.movieId}" />
  </div>

  <div class="review-form">
    <h3>리뷰 작성</h3>
    <form id="reviewForm">
      <input type="hidden" name="movieId" value="${movieDTO.movieId}" />
      <input type="text" name="memberId" placeholder="회원 ID를 입력하세요" required />
      <select name="reviewRating">
        <option value="5">⭐⭐⭐⭐⭐ (5점)</option>
        <option value="4">⭐⭐⭐⭐ (4점)</option>
        <option value="3">⭐⭐⭐ (3점)</option>
        <option value="2">⭐⭐ (2점)</option>
        <option value="1">⭐ (1점)</option>
      </select>
      <textarea name="reviewContent" rows="4" placeholder="리뷰를 입력하세요" required></textarea>
      <button type="submit">리뷰 등록</button>
    </form>
  </div>

  <div class="review-list">
    <h3>📢 리뷰 목록</h3>
    <div id="reviewList">
      <c:if test="${not empty reviews}">
        <c:forEach var="review" items="${reviews}">
          <div class="review-item" id="review-${review.reviewId}">
            <strong>${review.memberId}</strong> -
            <span class="star">
              <c:forEach begin="1" end="${review.reviewRating}" var="i">⭐</c:forEach>
            </span><br />
            <p class="comment">${review.reviewContent}</p>
            <div class="review-buttons">
              <button type="button" onclick="editReview(${review.reviewId})">수정</button>
              <button type="button" onclick="deleteReview(${review.reviewId})">삭제</button>
            </div>
          </div>
        </c:forEach>
      </c:if>
      <c:if test="${empty reviews}">
        <p>작성된 리뷰가 없습니다.</p>
      </c:if>
    </div>
  </div>

  <script>
    // 리뷰 등록
    document.getElementById("reviewForm").addEventListener("submit", function(e) {
      e.preventDefault();
      const form = e.target;
      const movieId = form.movieId.value;
      const memberId = form.memberId.value;
      const reviewRating = form.reviewRating.value;
      const reviewContent = form.reviewContent.value;

      if (!memberId.trim() || !reviewContent.trim()) {
        alert("모든 항목을 입력해주세요.");
        return;
      }

      const data = {
        movieId,
        memberId,
        reviewRating,
        reviewContent
      };

      fetch("/teamProjectTest/review/add", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
      })
      .then(res => {
        if (!res.ok) throw new Error("리뷰 등록 실패");
        return res.json();
      })
      .then(review => {
        const reviewList = document.getElementById("reviewList");
        const stars = "⭐".repeat(review.reviewRating);
        const newReview = document.createElement("div");
        newReview.className = "review-item";
        newReview.id = `review-${review.reviewId}`;
        newReview.innerHTML = `
          <strong>${review.memberId}</strong> -
          <span class="star">${stars}</span><br />
          <p class="comment">${review.reviewContent}</p>
          <div class="review-buttons">
            <button type="button" onclick="editReview(${review.reviewId})">수정</button>
            <button type="button" onclick="deleteReview(${review.reviewId})">삭제</button>
          </div>
        `;
        reviewList.prepend(newReview);
        form.reset();
      })
      .catch(err => {
        console.error(err);
        alert("등록 중 오류가 발생했습니다.");
      });
    });

    // 삭제 기능
    function deleteReview(id) {
    	console.log("🧨 deleteReview 호출됨. ID:", id);
      if (!id) {
        alert("리뷰 ID가 유효하지 않습니다.");
        return;
      }

      if (!confirm("정말 삭제하시겠습니까?")) return;

      fetch(`/teamProjectTest/review/delete/${id}`, {
        method: 'DELETE'
      })
      .then(res => {
        if (res.ok) {
          document.getElementById(`review-${id}`).remove();
        } else {
          alert("삭제 실패");
        }
      })
      .catch(err => console.error(err));
    }

    // 수정 기능
    function editReview(id) {
    	  console.log("✏️ editReview 호출됨. ID:", id);
      const reviewDiv = document.getElementById(`review-${id}`);
      const commentP = reviewDiv.querySelector('.comment');
      const oldComment = commentP.innerText;
      const newComment = prompt("수정할 내용을 입력하세요:", oldComment);

      if (newComment === null || newComment.trim() === "") return;

      fetch(`/teamProjectTest/review/edit/${id}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ reviewContent: newComment })
      })
      .then(res => {
        if (res.ok) {
          commentP.innerText = newComment;
        } else {
          alert("수정 실패");
        }
      })
      .catch(err => console.error(err));
    }
    
//  <!-- 차트 라이브러리 -->
    <%--     <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->

    <!--     차트 표시용 캔버스 -->
    <%--     <canvas id="sentimentChart" width="400" height="200"></canvas> --%>

    <!--     차트 스크립트 -->
    <!--     <script> -->
    <!-- //       const ctx = document.getElementById('sentimentChart').getContext('2d');  -->
    <!-- //       const sentimentChart = new Chart(ctx, { -->
    <!-- //         type: 'pie', -->
    <!-- //         data: { -->
    <!-- //           labels: ['긍정', '부정'], -->
    <!-- //           datasets: [{ -->
    <%-- //             data: [${positive}, ${negative}], --%>
    <!-- //             backgroundColor: ['#36A2EB', '#FF6384'] -->
    <!-- //           }] -->
    <!-- //         }, -->
    <!-- //         options: { -->
    <!-- //           responsive: true, -->
    <!-- //           plugins: { -->
    <!-- //             title: { -->
    <!-- //               display: true, -->
    <!-- //               text: '리뷰 감정 분석 결과' -->
    <!-- //             } -->
    <!-- //           } -->
    <!-- //         } -->
    <!-- //       }); -->
    
  </script>
</body>
</html>
