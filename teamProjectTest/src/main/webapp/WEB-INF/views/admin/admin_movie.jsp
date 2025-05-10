<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>영화 목록</title>
  <style>
    * {
      box-sizing: border-box;
    }

    body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

    .container {
      display: flex;
      height: 100vh;
    }

 

    /* 메인 콘텐츠 */
    .main {
      flex: 1;
      padding: 40px;
    }

    h2 {
      margin-bottom: 20px;
    }

    .search-bar {
      margin-bottom: 20px;
    }

    .search-bar input {
      padding: 8px;
      width: 250px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 20px;
      table-layout: fixed;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 12px;
      text-align: center;
      word-wrap: break-word;
    }

    th {
      background-color: #e6e6e6;
    }

    .action-button {
      padding: 6px 12px;
      background-color: #ddd;
      border: none;
      cursor: pointer;
    }

    .action-button:hover {
      background-color: #ccc;
    }

    .add-button {
      padding: 10px 20px;
      background-color: #999;
      color: #fff;
      border: none;
      cursor: pointer;
      float: right;
    }

    .add-button:hover {
      background-color: #777;
    }

    .pagination {
      margin-top: 20px;
      text-align: center;
    }

    .pagination button {
      margin: 0 2px;
      padding: 5px 10px;
      border: 1px solid #ccc;
      background-color: #fff;
      cursor: pointer;
    }

    .pagination button.active {
      background-color: red;
      color: white;
      border: 1px solid red;
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- 사이드바 -->
      <%@ include file="admin_menu.jsp" %>

    <!-- 메인 콘텐츠 -->
    <div class="main">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <h2>영화 목록</h2>

      <!-- 검색창 -->
      <div class="search-bar">
        <label>검색: </label>
        <input type="text" placeholder="영화 제목 입력">
      </div>

      <!-- 영화 리스트 테이블 -->
      <table>
      	<thead>
	        <tr>
	          <th>영화번호</th>
	          <th>영화코드</th>
	          <th>영화제목</th>
	          <th>영문제목</th>
	          <th>개봉일</th>
	          <th>상영시간</th>
	          <th>장르</th>
	          <th>감독</th>
	          <th>배우</th>
	          <th>상세정보</th>
	        </tr>
        </thead>
        <tbody>
          <c:forEach var="movie" items="${movieList}">
			  <tr>
			    <td>${movie.movieId}</td>
			    <td>${movie.movieCd}</td>
			    <td>${movie.movieNm}</td>
			    <td>${movie.movieNmEn}</td>
			    <td>${movie.openDt}</td>
			    <td>${movie.showTm}분</td>
			    <td>${movie.genreNm}</td>
			    <td>${movie.directors}</td>
			    <td>${movie.actors}</td>
			    <td><button class="action-button" onclick="location.href='adminmovied'">상세정보 확인</button></td>
			  </tr>
		  </c:forEach>
        </tbody>
      </table>

      <!-- 페이지네이션 + 추가버튼 -->
      <div class="pagination">
		  <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
		    <a href="?pageNum=${pageDTO.startPage - pageDTO.pageBlock}">이전</a>
		  </c:if>
		
		  <c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
		    <a href="?pageNum=${i}" class="${i == pageDTO.currentPage ? 'active' : ''}">${i}</a>
		  </c:forEach>
		
		  <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
		    <a href="?pageNum=${pageDTO.startPage + pageDTO.pageBlock}">다음</a>
		  </c:if>
	  </div>
        <button class="add-button" onclick="location.href='register.html'">추가하기</button>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
</body>
</html>