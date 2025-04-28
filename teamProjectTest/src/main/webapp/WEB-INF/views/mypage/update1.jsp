<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정 - 비밀번호 입력</title>
    <style>
        body {
            font-family: '맑은 고딕', sans-serif;
            margin: 0;
            padding: 0;
        }

        .mypage-wrapper {
            display: flex;
/*             min-height: 100vh; */
        }

        <%-- 사이드바 스타일은 mypage_menu.jsp 안에서 정의됨 --%>


        .mypage-content {
    flex: 1;
    padding: 40px 20px;
    background-color: #fdfdfd;
    display: block;               /* 추가 */
    align-items: flex-start;     /* 위에서 시작 (필요 시 center로 바꿔도 돼) */
}
        


.update-section {
  width: 600px;
  margin-left: 0; /* 필요 시 추가 */
}

.update-title {
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 20px;
}

 

        .form-box {
            background-color: #f7f7f7;
            padding: 30px;
            border: 1px solid #ddd;
             width: 600px; 
             text-align: center;
        }

        .form-box h2 {
            margin-bottom: 20px;
        }

       .input-group {
  text-align: left; /* ✅ 왼쪽 정렬로 돌리기 */
  margin-bottom: 20px;
  width: 400px;
  margin: 0 auto 20px auto; /* 가운데 정렬 + 여백 */
}

.input-group label {
  display: block;   /* ✅ label을 위로 배치 */
  font-size: 16px;
  margin-bottom: 6px;
}

.input-group input {
  width: 100%;
  height: 35px;
  padding: 5px 10px;
  font-size: 16px;
  box-sizing: border-box;
}

        .btn-group button {
            margin-right: 10px;
            padding: 8px 20px;
            font-size: 16px;
        }

        .captcha-box {
            margin-top: 30px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        .captcha-box input {
            width: 100%;
            margin-top: 10px;
            height: 32px;
        }

        .error-msg {
            color: red;
            font-size: 14px;
            margin-top: 5px;
        }
    </style>
</head>
<body>

<div class="mypage-wrapper">
    <%@ include file="mypage_menu.jsp" %>



    
     <div class="mypage-content">
         <!-- Header -->
    <%@ include file="../main/header.jsp" %>
     
    <div class="update-section">
      <h2 class="update-title">회원정보 수정</h2>

    
        <div class="form-box">
           <h3>회원님의 개인 정보 보호를 위해 비밀번호를 입력해 주세요.</h3>
            <form action="updateCheck" method="post">
                <div class="input-group">
                    <label for="password">비밀번호</label>  <input type="password" name="password" id="password" required>
                </div>

                <div class="btn-group">
                    <button type="submit">확인</button>
                    <button type="button" onclick="location.href='/mypage'">취소</button>
                </div>

                <%-- 비밀번호 오류 5회 이상일 때만 보이게 --%>
                <div class="captcha-box">
                    <label>보안문자 입력</label>
                    <img src="/captcha" alt="보안문자 이미지"><br>
                    <input type="text" name="captcha" placeholder="보안문자를 입력해주세요">
                    <div class="error-msg">보안문자를 정확히 입력해주세요.</div>
                </div>
            </form>
        </div>
    </div>
     <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
</div>
</div>

</body>
</html>