<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>회원 상세 정보</title>
  <link rel="stylesheet" href="styles.css">
  <style>
    .container {
      display: flex;
      height: 100vh;
      font-family: Arial, sans-serif;
    }

    .main {
      flex: 1;
      padding: 40px;
    }

    h2 {
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      table-layout: fixed;
    }

    table td {
      border: 1px solid #ccc;
      padding: 15px;
      text-align: center;
      word-wrap: break-word;
    }

    table td:nth-child(odd) {
      background-color: #e6e6e6;
      font-weight: bold;
      width: 20%;
    }

    table td:nth-child(even) {
      background-color: #fff;
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
      <h2>회원 상세 정보</h2>
      <table>
        <tr>
          <td>회원 번호</td>
          <td>1</td>
          <td>회원 아이디</td>
          <td>min</td>
          <td>회원 이름</td>
          <td>김민수</td>
        </tr>
        <tr>
          <td>회원 이메일</td>
          <td>kim@naver.com</td>
          <td>주소</td>
          <td colspan="3">부산광역시 부산진구 동천로</td>
        </tr>
        <tr>
          <td>성별</td>
          <td>남</td>
          <td>회원 전화번호</td>
          <td>010-1111-2222</td>
          <td>영화 취향</td>
          <td>액션</td>
        </tr>
        <tr>
          <td>가입 날짜</td>
          <td colspan="5">2025-04-08 10:22</td>
        </tr>
      </table>
      <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
 
 
  </div>
</body>
</html>