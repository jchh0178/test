<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/review/write" method="post">
    <input type="hidden" name="movieId" value="${movieId}" />
    <label for="reviewRating">평점</label>
    <input type="number" name="reviewRating" min="1" max="5" required />
    
    <label for="reviewContent">리뷰 내용</label>
    <textarea name="reviewContent" required></textarea>
    
    <label for="reviewSelect">선택</label>
    <input type="text" name="reviewSelect" />

    <button type="submit">리뷰 등록</button>
</form>
</body>
</html>