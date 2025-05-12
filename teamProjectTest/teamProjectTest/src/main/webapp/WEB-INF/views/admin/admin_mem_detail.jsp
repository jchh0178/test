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
		  <td>회원 아이디</td>
		  <td>${infoMember.member_id}</td>
		  <td>회원 이름</td>
		  <td>${infoMember.member_name}</td>
		  <td>비밀번호</td>
		  <td>${infoMember.member_pass}</td>
		</tr>
		<tr>
		  <td>이메일</td>
		  <td>${infoMember.member_email}</td>
		  <td>전화번호</td>
		  <td>${infoMember.member_phone}</td>
		  <td>영화 취향</td>
		  <td>${infoMember.member_like_genre}</td>
		</tr>
		<tr>
 		  <td>성별</td>
		  <td>${infoMember.member_gender}</td>
		  <td>생년월일</td>
		  <td>${infoMember.member_birth}</td>
		  <td>회원상태</td>
		  <td>${infoMember.member_status}</td>
		</tr>
		<tr>
		  <td>주소</td>
		  <td colspan="5">${infoMember.member_address}</td>
		</tr>
		<tr>
		  <td>가입일</td>
		  <td colspan="5">${infoMember.member_date}</td>
		</tr>
      </table>
      <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
 
 
  </div>
</body>
</html>