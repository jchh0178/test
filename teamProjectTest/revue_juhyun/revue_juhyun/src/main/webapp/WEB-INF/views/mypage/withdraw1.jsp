<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원 탈퇴</title>
  <style>
    body {
      font-family: '맑은 고딕', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #fff;
    }

    .mypage-wrapper {
      display: flex;
    }

    .mypage-content {
      flex: 1;
      padding: 40px;
    }

    .withdraw-box {
      width: 500px;
      background-color: #f7f7f7;
      border: 1px solid #ddd;
      padding: 30px;
    }

    .withdraw-box h2 {
      font-size: 20px;
      margin-bottom: 10px;
    }

    .withdraw-box p {
      font-size: 14px;
      color: #555;
      margin-bottom: 20px;
    }

    .input-group {
      margin-bottom: 20px;
    }

    .input-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }

    .input-group input {
      width: 100%;
      height: 35px;
      font-size: 16px;
      padding: 5px;
    }

    .btn-group {
      margin-top: 10px;
    }

    .btn-group button {
      padding: 8px 20px;
      font-size: 15px;
      margin-right: 10px;
    }

    .find-password {
      margin-top: 15px;
      text-align: right;
    }

    .find-password a {
      color: #333;
      text-decoration: none;
      font-size: 14px;
    }

    .find-password a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="mypage-wrapper">
  <%@ include file="mypage_menu.jsp" %>

  <div class="mypage-content">
      <!-- Header -->
    <%@ include file="../main/header.jsp" %>
  
    <div class="withdraw-box">
      <h2>회원 탈퇴</h2>
      <p>&lt;탈퇴를 위해 비밀번호를 입력해주세요.&gt;</p>

      <form action="withdrawConfirm.do" method="post">
        <div class="input-group">
          <label for="password">현재 비밀번호</label>
          <input type="password" id="password" name="password" required>
        </div>

        <div class="btn-group">
          <button type="submit">확인</button>
          <button type="button" onclick="location.href='/mypage'">취소</button>
        </div>

        <div class="find-password">
          <a href="/findPw.jsp">비밀번호 찾기</a>
        </div>
      </form>
    </div>
     <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
  </div>
</div>
</body>
</html>