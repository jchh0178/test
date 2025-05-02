<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>무비차트</title>
<!-- 	<link rel="stylesheet" href="/teamproject/resources/css/style.css"> -->
    
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
</head>
<body>
    <h1>무비차트</h1>
    <div class="movie-list">
        <c:forEach var="movie" items="${movies}">
            <div class="movie-item">
                <img src="${movie.posterUrl}" alt="${movie.movieNm}" width="150" height="220">
                <h3>${movie.rank}위 - ${movie.movieNm}</h3>
                <p>개봉일: ${movie.openDt}</p>
            </div>
        </c:forEach>
    </div>
</body>
</html>
 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>

</body>
</html>