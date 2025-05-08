<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>관리자 - 회원 관리</title>
<style>
  body {
      margin: 0;
      font-family: Arial, sans-serif;
    }

    .container {
      display: flex;
    }



    /* 메인 */
    .main {
      flex-grow: 1;
      padding: 30px;
    }

    h2 {
      margin-top: 0;
    }

    /* 검색 영역 */
    .search-bar {
      margin-bottom: 20px;
    }

    .search-bar input[type="text"] {
      padding: 6px 10px;
      font-size: 14px;
    }

    .search-bar button {
      padding: 6px 14px;
      font-size: 14px;
      margin-left: 8px;
      cursor: pointer;
    }

    /* 테이블 */
    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
      margin-bottom: 20px;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 10px;
      text-align: center;
    }

    th {
      background-color: #eee;
    }

    td a {
      color: blue;
      text-decoration: underline;
    }

    .btn-detail {
      padding: 6px 10px;
      font-size: 13px;
      background: #f0f0f0;
      border: 1px solid #999;
      cursor: pointer;
    }

    /* 페이징 */
    .pagination {
      text-align: center;
    }

    .pagination button {
      margin: 0 5px;
      padding: 6px 10px;
      font-size: 14px;
      cursor: pointer;
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
  
    <h2>회원 목록</h2>

<!--     <div class="search-bar"> -->
<!--       <input type="text" placeholder="회원 검색"> -->
<!--       <button>검색</button> -->
<!--     </div> -->
    
    <div class="search-bar">
	  	<form action="${pageContext.request.contextPath}/admin/adminmem" method="get" class="search-bar">
		  <input type="text" name="search" value="${search}" placeholder="회원 ID 또는 이름 검색">
		  <button type="submit">검색</button>
		</form>
	</div>

    <table>
      <thead>
        <tr>
          <th>회원 ID</th>
          <th>회원 이름</th>
          <th>이메일</th>
          <th>영화 취향</th>
          <th>상세 정보</th>
        </tr>
      </thead>
		 	<tbody>
			<c:forEach var="member" items="${listMember}">
			  <tr>
			    <td>${member.member_id}</td>
			    <td>${member.member_name}</td>
			    <td><a href="mailto:${member.member_email}">${member.member_email}</a></td>
			    <td>${member.member_like_genre}</td>
			    <td>
			      <button class="btn-detail" 
			        onclick="location.href='${pageContext.request.contextPath}/admin/adminmemd?member_id=${member.member_id}'">
			        상세 정보 확인
			      </button>
			    </td>
			  </tr>
			</c:forEach>
			</tbody>
    </table>

    <div class="pagination">
	  <c:if test="${pageDTO.currentPage > 1}">
		<a href="?pageNum=${pageDTO.currentPage - 1}&search=${pageDTO.search}">이전</a>
	  </c:if>
	
	  <c:forEach begin="${pageDTO.startPage}" end="${pageDTO.endPage}" var="i">
	    <a href="?pageNum=${i}&search=${pageDTO.search}" 
	       style="${i == pageDTO.currentPage ? 'font-weight:bold;' : ''}">${i}</a>
	  </c:forEach>
	
	  <c:if test="${pageDTO.currentPage < pageDTO.pageCount}">
		<a href="?pageNum=${pageDTO.currentPage + 1}&search=${pageDTO.search}">다음</a>
	  </c:if>
	</div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    
  </div>

</div>
</body>
</html>