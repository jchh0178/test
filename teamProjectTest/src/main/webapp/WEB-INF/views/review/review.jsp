<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>영화 리뷰</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/review.css" />
</head>
<body class="container">
  <!-- Header -->
  <%@ include file="../main/header.jsp" %>
	<h1>영화 리뷰</h1>

	<!-- ✅ 영화 정보 출력 -->
	<div class="movie-title">
		<h2>영화 제목: ${movieDTO.rank} - ${movieDTO.movieNm}</h2>
		<input type="hidden" id="movieId" value="${movieDTO.movieId}" /> <input
			type="hidden" id="loginUserId" value="${sessionScope.id}" />
	</div>

	  <!-- ✅ 로그인한 경우에만 리뷰 작성 폼 출력 -->
  <c:if test="${not empty sessionScope.id}">
    <div class="review-form">
      <h3>리뷰 작성</h3>
      <form id="reviewForm">
        <input type="hidden" name="movieId" value="${movieDTO.movieId}" />
        <input type="text" name="memberId" value="${sessionScope.id}" />
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
  </c:if>
  <c:if test="${empty sessionScope.id}">
    <p style="color:gray;">로그인 후 리뷰를 작성하실 수 있습니다.</p>
  </c:if>

	<!-- ✅ 리뷰 목록 출력 영역 -->
	<div class="review-list">
		<h3>📢 리뷰 목록</h3>
		<div id="reviewList"></div>
	</div>

  <!-- Footer -->
  <%@ include file="../main/footer.jsp" %>
  
	<!-- ✅ 스크립트 -->
	<script>
    const contextPath = "${pageContext.request.contextPath}";
    const loginUserId = document.getElementById("loginUserId").value;
    
    // ✅ 페이지 로드시 자동 리뷰 불러오기
    window.addEventListener("DOMContentLoaded", () => {
      const movieId = document.getElementById("movieId").value;
     // alert(movieId);
      loadReviews(movieId);
    });

    // ✅ 리뷰 목록 불러오기
    function loadReviews(movieId) {
      movieId = Number(movieId);

//       if (!movieId || isNaN(movieId)) {
//         console.error("🚫 잘못된 movieId:", movieId);
//         return;
//       }
	const list = contextPath + "/review/list/" + movieId;
	//alert(list);
      fetch(list)
        .then(res => {
          if (!res.ok) throw new Error("리뷰 불러오기 실패");
          return res.json();
        })
        .then(reviews => {
          const reviewList = document.getElementById("reviewList");
          reviewList.innerHTML = "";

          if (!reviews || reviews.length === 0) {
            reviewList.innerHTML = "<p>작성된 리뷰가 없습니다.</p>";
            return;
          }

          console.log(`✅ ${reviews.length}개의 리뷰를 불러왔습니다.`);
          reviews.forEach((review, idx) => {
 	      	console.log(`[${idx}] 리뷰 내용:`, review.reviewContent); // <- 이거로 먼저 확인
            const stars = "⭐".repeat(Number(review.reviewRating));
            const div = document.createElement("div");
//             const content = `${review.reviewContent}`;
            div.className = "review-item";
            div.id = `review-${review.reviewId}`;
            console.log("리뷰 작성 ID =", review.memberId);
            console.log("세션 로그인 ID =", loginUserId);
           let html = 
//             '<p>디버그용 출력: ' + review.reviewContent + '</p>;' + 
               	  '<strong>' + review.memberId + '</strong> -' +
            	  '<span class="star">'+ stars + '</span>' + '<br>' +
            	  '<p class="comment">' + review.reviewContent + '-</p>' ;
            	  if(review.memberId == loginUserId){
            		 html += '<div class="review-buttons">' + 
              	  	  			  '<button type="button" onclick="editReview(' + review.reviewId + ')">수정</button>'+
              	      			  '<button type="button" onclick="deleteReview(' + review.reviewId + ')">삭제</button>' +
              	      			  '</div>'  ;
            	  }else{
            		  html;
            	  }
            div.innerHTML = html;
            reviewList.appendChild(div);
          });
        })
        .catch(err => {
          console.error("리뷰 목록 오류:", err);
          alert("리뷰 목록을 불러오지 못했습니다.");
        });
    }

    // ✅ 리뷰 등록
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

      const data = { movieId, memberId, reviewRating, reviewContent };
	  
      const add = contextPath + "/review/add/";
      fetch(add, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
      })
      .then(res => {
        if (!res.ok) throw new Error("리뷰 등록 실패");
        return res.json();
      })
      .then(() => {
        form.reset();
        loadReviews(movieId); // ✅ 등록 후 갱신
      })
      .catch(err => {
        console.error("등록 중 오류:", err);
        alert("리뷰 등록에 실패했습니다.");
      });
    });

    // ✅ 리뷰 수정
    window.editReview = function(reviewId) {
      const reviewDiv = document.getElementById('review-' + reviewId);
      const commentP = reviewDiv.querySelector('.comment');
      const oldContent = commentP.innerText.trim();
      const newContent = prompt("수정할 내용을 입력하세요:", oldContent);

      if (newContent === null || newContent.trim() === "") return;
      const edit = contextPath + "/review/edit/" + reviewId;
      fetch(edit, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ reviewContent: newContent.trim() })
      })
      .then(res => {
        if (!res.ok) throw new Error("수정 실패");
        loadReviews(document.getElementById("movieId").value);
      })
      .catch(err => {
        console.error("수정 중 오류:", err);
        alert("리뷰 수정에 실패했습니다.");
      });
    };

    // ✅ 리뷰 삭제
    window.deleteReview = function(reviewId) {
      if (!confirm("정말 삭제하시겠습니까?")) return;
      const del = contextPath + "/review/delete/" + reviewId;
      fetch(del, {
        method: 'DELETE'
      })
      .then(res => {
        if (!res.ok) throw new Error("삭제 실패");
        loadReviews(document.getElementById("movieId").value); // ✅ 삭제 후 갱신
      })
      .catch(err => {
        console.error("삭제 중 오류:", err);
        alert("리뷰 삭제에 실패했습니다.");
      });
    };
  </script>
</body>
</html>
