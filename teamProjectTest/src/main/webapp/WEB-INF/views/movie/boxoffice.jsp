<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>박스오피스 순위</title>
</head>
<body>
    <h1>박스오피스 랭킹</h1>
    <c:forEach var="movie" items="${movies}">
        <p>순위: ${movie.rank} - 제목: ${movie.movieNm} - 개봉일: ${movie.openDt} - 누적관객: ${movie.audiAcc}</p>
    </c:forEach>

    <c:if test="${empty movies}">
        <p>불러온 영화 데이터가 없습니다.</p>
    </c:if>
</body>
</html>