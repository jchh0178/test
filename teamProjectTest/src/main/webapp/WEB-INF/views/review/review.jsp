<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>영화 리뷰</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review.css">
</head>
<body>

	<h1>영화 리뷰</h1>

	<div class="movie-info">
		<h2>영화 제목: ${movie.title}</h2>
		<p>${movie.description}</p>
	</div>

	<div class="review-form">
		<h3>리뷰 작성</h3>
		<form id="reviewForm">
			<input type="hidden" name="movieId" value="${movie.movieId}" /> <input
				type="text" name="memberId" placeholder="회원 ID를 입력하세요" required />
			<select name="reviewRating">
				<option value="5">⭐⭐⭐⭐⭐ (5점)</option>
				<option value="4">⭐⭐⭐⭐ (4점)</option>
				<option value="3">⭐⭐⭐ (3점)</option>
				<option value="2">⭐⭐ (2점)</option>
				<option value="1">⭐ (1점)</option>
			</select>
			<textarea name="reviewContent" rows="4" placeholder="리뷰를 입력하세요"
				required></textarea>
			<button type="submit">리뷰 등록</button>
		</form>
	</div>

	<div class="review-list">
		<h3>📢 리뷰 목록</h3>
		<div id="reviewList">
			<c:if test="${not empty reviews}">
				<c:forEach var="review" items="${reviews}">
					<div class="review-item" id="review-${review.reviewId}">
						<strong>${review.memberId}</strong> - <span class="star"> <c:forEach
								begin="1" end="${review.reviewRating}" var="i">⭐</c:forEach>
						</span><br />
						<p class="comment">${review.reviewContent}</p>

						<!-- ✅ 수정 및 삭제 버튼 -->
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
	
	//리뷰 등록용 script
	document.getElementById("reviewForm").addEventListener("submit", function(e) {
	    e.preventDefault(); // 기본 제출 막기

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

	    fetch(`${pageContext.request.contextPath}/review/api/add`, {
	      method: "POST",
	      headers: {
	        "Content-Type": "application/json"
	      },
	      body: JSON.stringify(data)
	    })
	    .then(res => {
	      if (!res.ok) throw new Error("리뷰 등록 실패");
	      return res.json(); // 서버에서 새 리뷰 객체 반환
	    })
	    .then(review => {
	      // 리뷰 HTML 추가
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
	      reviewList.prepend(newReview); // 맨 위에 추가

	      form.reset(); // 폼 초기화
	    })
	    .catch(err => {
	      console.error(err);
	      alert("등록 중 오류가 발생했습니다.");
	    });
	  });
	
    // 삭제 기능
    function deleteReview(id) {
      if (!confirm("정말 삭제하시겠습니까?")) return;

      fetch(`${pageContext.request.contextPath}/review/api/delete/${id}`, {
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
      const reviewDiv = document.getElementById(`review-${id}`);
      const commentP = reviewDiv.querySelector('.comment');
      const oldComment = commentP.innerText;
      const newComment = prompt("수정할 내용을 입력하세요:", oldComment);

      if (newComment === null || newComment.trim() === "") return;

      fetch(`${pageContext.request.contextPath}/review/api/edit/${id}`, {
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
  </script>

</body>
</html>
