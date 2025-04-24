<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <div class="search-bar">
      <input type="text" placeholder="회원 검색">
      <button>검색</button>
    </div>

    <table>
      <thead>
        <tr>
          <th>회원 번호</th>
          <th>회원 ID</th>
          <th>회원 이름</th>
          <th>이메일</th>
          <th>영화 취향</th>
          <th>상세 정보</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>1</td>
          <td>admin</td>
          <td>관리자</td>
          <td><a href="mailto:abc123@gmail.com">abc123@gmail.com</a></td>
          <td>액션</td>
          <td><button class="btn-detail" onclick="location.href='adminmemd'">상세 정보 확인</button></td>
        </tr>
        <tr>
          <td>2</td>
          <td>id1</td>
          <td>이순신</td>
          <td>a123@naver.com</td>
          <td>SF</td>
          <td><button class="btn-detail" onclick="location.href='adminmemd'">상세 정보 확인</button></td>
        </tr>
        <tr>
          <td>3</td>
          <td>id2</td>
          <td>김유신</td>
          <td>kim2@gmail.com</td>
          <td>로맨스</td>
          <td><button class="btn-detail" onclick="location.href='adminmemd'">상세 정보 확인</button></td>
        </tr>
        <tr>
          <td>4</td>
          <td>id3</td>
          <td>이성계</td>
          <td>b123@itwills.co.kr</td>
          <td>가족</td>
          <td><button class="btn-detail" onclick="location.href='adminmemd'">상세 정보 확인</button></td>
        </tr>
        <tr>
          <td>5</td>
          <td>id4</td>
          <td>김민수</td>
          <td>c12@naver.com</td>
          <td>만화</td>
          <td><button class="btn-detail" onclick="location.href='adminmemd'">상세 정보 확인</button></td>
        </tr>
      </tbody>
    </table>

    <div class="pagination">
      <button>이전</button>
      <button>1</button>
      <button>2</button>
      <button>다음</button>
    </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    
  </div>

</div>
</body>
</html>