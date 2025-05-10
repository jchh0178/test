<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/review/edit" method="post">
    <input type="hidden" name="reviewId" value="${review.reviewId}" />
    <input type="hidden" name="movieId" value="${review.movieId}" />
    
    <label for="reviewRating">평점</label>
    <input type="number" name="reviewRating" value="${review.reviewRating}" min="1" max="5" required />
    
    <label for="reviewContent">리뷰 내용</label>
    <textarea name="reviewContent" required>${review.reviewContent}</textarea>
    
    <label for="reviewSelect">선택</label>
    <input type="text" name="reviewSelect" value="${review.reviewSelect}" />

    <button type="submit">리뷰 수정</button>
</form>

</body>
</html>