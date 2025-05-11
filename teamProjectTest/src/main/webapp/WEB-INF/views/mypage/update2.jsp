<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원정보 수정</title>
  <style>
    body {
      font-family: '맑은 고딕', sans-serif;
      margin: 0;
      padding: 0;
    }

    .mypage-wrapper {
      display: flex;
    }

    .mypage-content {
      flex: 1;
      padding: 40px;
    }

    .form-container {
      width: 700px;
      background-color: #f7f7f7;
      padding: 30px;
      border: 1px solid #ddd;
    }

    .form-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 20px;
    }

    .form-group {
      display: flex;
      align-items: center;
      margin-bottom: 15px;
    }

    .form-group label {
      width: 120px;
      font-weight: bold;
    }

    .form-group input[type="text"],
    .form-group input[type="password"],
    .form-group input[type="email"] {
      width: 300px;
      padding: 6px 8px;
      font-size: 14px;
    }

    .form-group input[type="file"] {
      font-size: 14px;
    }

    .form-group .btn-small {
      margin-left: 10px;
      padding: 6px 10px;
      font-size: 13px;
    }

    .form-group.gender label {
      width: auto;
      margin-right: 15px;
    }

    .form-group.gender input {
      margin-right: 5px;
    }

    .form-group.address input[type="text"] {
      width: 400px;
    }

    .form-buttons {
      text-align: center;
      margin-top: 30px;
    }

    .form-buttons button {
      padding: 8px 20px;
      font-size: 14px;
      margin: 0 10px;
    }
  </style>
</head>
<body>
  <div class="mypage-wrapper">
    <%@ include file="mypage_menu.jsp" %>

    <div class="mypage-content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <div class="form-container">
        <div class="form-title">회원정보 수정</div>

        <form action="${pageContext.request.contextPath}/mypage/updateProfile" method="post" enctype="multipart/form-data">
          <div class="form-group">
            <label>프로필 사진</label>
              <input type="file" name="file">
              <c:if test="${not empty uploadedImage}">
				  <div style="margin-top: 20px;">
				    <label>미리보기:</label><br>
				    <img src="${pageContext.request.contextPath}/resources/upload/${uploadedImage}" 
				         style="width: 100px; height: 100px; border-radius: 50%;">
				  </div>
			  </c:if>
            <button type="submit" class="btn-small">이미지 등록</button>
          </div>

          <div class="form-group">
            <label>아이디</label>
            <input type="text" name="id" value="${sessionScope.loginDTO.member_id }" readonly>
          </div>

          <div class="form-group">
            <label>이름</label>
            <input type="text" name="name" value="${sessionScope.loginDTO.member_name }">
<!--             <button type="button" class="btn-small">이름 변경</button> -->
          </div>

          <div class="form-group">
            <label>비밀번호</label>
            <input type="password" value="********" readonly>
            <button type="button" class="btn-small"  onclick="location.href='${pageContext.request.contextPath}/mypage/updatepw'">비밀번호 변경</button>
          </div>

          <div class="form-group">
            <label>전화번호</label>
            <input type="text" name="phone" value="${sessionScope.loginDTO.member_phone }">
<!--             <button type="button" class="btn-small">전화번호 변경</button> -->
          </div>

          <div class="form-group">
            <label>이메일</label>
            <input type="email" name="email" value="${sessionScope.loginDTO.member_email }" readonly>
          </div>

          <div class="form-group gender">
            <label>성별</label>
            <c:if test="${sessionScope.loginDTO.member_gender == 'M'}">
            	<label><input type="radio" name="gender" value="M" checked> 남자</label>
            	<label><input type="radio" name="gender" value="F"> 여자</label>
            </c:if>
            <c:if test="${sessionScope.loginDTO.member_gender == 'F'}">
            	<label><input type="radio" name="gender" value="M" > 남자</label>
            	<label><input type="radio" name="gender" value="F" checked> 여자</label>
            </c:if>
          </div>

          <div class="form-group address">
            <label>주소</label>
            <input type="text" name="address" id="address" value="${sessionScope.loginDTO.member_address }">
            <button type="button" class="btn-small" onclick="execDaumPostcode()">주소 검색</button>
          </div>
          
          <div class="form-group birth">
            <label>생년월일</label>
            <input type="text" name="birth" value="${sessionScope.loginDTO.member_birth }" readonly>
          </div>

          <div class="form-buttons">
            <button type="submit">저장</button>
            <button type="button" onclick="location.href='/mypage'">취소</button>
          </div>
        </form>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>

//주소 검색 api 적용임
function execDaumPostcode() {
  new daum.Postcode({
    oncomplete: function(data) {
      document.getElementById("address").value = data.address;
    }
  }).open();
}



</script>
</body>
</html>