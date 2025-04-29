<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8" />
  <title>영화 리뷰</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">
</head>
<body>

  <h1> 영화 리뷰</h1>

  <div class="movie-info">
    <h2>영화 제목: 영화1</h2>
    <p>영화 1 상세 설명</p>
  </div>

  <div class="review-form">
    <h3>리뷰 작성</h3>
    <input type="text" id="username" placeholder="닉네임을 입력하세요" />
    <select id="rating">
      <option value="5">⭐⭐⭐⭐⭐ (5점)</option>
      <option value="4">⭐⭐⭐⭐ (4점)</option>
      <option value="3">⭐⭐⭐ (3점)</option>
      <option value="2">⭐⭐ (2점)</option>
      <option value="1">⭐ (1점)</option>
    </select>
    <textarea id="comment" rows="4" placeholder="리뷰를 입력하세요"></textarea>
    <button onclick="submitReview()">리뷰 등록</button>
  </div>

  <div class="review-list" id="reviewList">
    <h3>📢 리뷰 목록</h3>
    <!-- JS로 추가됨 -->
  </div>

  <script>
  function createReviewItem(review) {
	  const reviewList = document.getElementById('reviewList');
	  const reviewDiv = document.createElement('div');
	  reviewDiv.classList.add('review-item');
	  reviewDiv.id = `review-${review.id}`;
	  reviewDiv.innerHTML = `
	    <strong>${review.username}</strong> - 
	    <span class="star">${'⭐'.repeat(review.rating)}</span><br />
	    <p class="comment">${review.comment}</p>
	    <button onclick="editReview(${review.id})">수정</button>
	    <button onclick="deleteReview(${review.id})">삭제</button>
	  `;
	  reviewList.appendChild(reviewDiv);
	}

	function submitReview() {
	  const name = document.getElementById('username').value.trim();
	  const rating = document.getElementById('rating').value;
	  const comment = document.getElementById('comment').value.trim();

	  if (!name || !comment) {
	    alert("닉네임과 리뷰를 모두 입력해주세요.");
	    return;
	  }

	  fetch('/movie/api/submitReview', {
	    method: 'POST',
	    headers: { 'Content-Type': 'application/json' },
	    body: JSON.stringify({ username: name, rating, comment })
	  })
	    .then(res => res.json())
	    .then(data => {
	      createReviewItem(data);
	      document.getElementById('username').value = '';
	      document.getElementById('comment').value = '';
	      document.getElementById('rating').value = '5';
	    })
	    .catch(err => console.error(err));
	}

	function deleteReview(id) {
	  if (!confirm("정말 삭제하시겠습니까?")) return;

	  fetch(`/movie/api/deleteReview/${id}`, { method: 'DELETE' })
	    .then(res => {
	      if (res.ok) {
	        document.getElementById(`review-${id}`).remove();
	      } else {
	        alert("삭제 실패");
	      }
	    })
	    .catch(err => console.error(err));
	}

	function editReview(id) {
	  const reviewDiv = document.getElementById(`review-${id}`);
	  const commentP = reviewDiv.querySelector('.comment');
	  const oldComment = commentP.innerText;
	  const newComment = prompt("수정할 내용을 입력하세요:", oldComment);

	  if (newComment === null || newComment.trim() === "") return;

	  fetch(`/movie/api/editReview/${id}`, {
	    method: 'PUT',
	    headers: { 'Content-Type': 'application/json' },
	    body: JSON.stringify({ comment: newComment })
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
    }
  </script>

</body>
</html>