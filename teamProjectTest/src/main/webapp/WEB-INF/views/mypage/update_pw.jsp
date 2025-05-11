<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>비밀번호 변경</title>
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

    .pw-form-box {
      width: 600px;
      background-color: #f7f7f7;
      padding: 30px;
      border: 1px solid #ddd;
    }

    .pw-title {
      font-size: 20px;
      font-weight: bold;
      margin-bottom: 10px;
    }

    .pw-guide {
      font-size: 14px;
      color: #444;
      margin-bottom: 30px;
    }

.pw-group {
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 20px;
      gap: 15px;
    }

    .pw-group label {
      width: 150px;
      font-weight: bold;
      text-align: right;
      font-size: 13px;  /* ✅ 글씨 크기 줄이기 (기존보다 작게) */
    }

    .pw-group input {
      width: 300px;
      height: 35px;
      padding: 5px 10px;
      font-size: 14px;
      box-sizing: border-box;
    }

    .pw-buttons {
      text-align: center;
      margin-top: 30px;
    }

    .pw-buttons button {
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
    
      <div class="pw-form-box">
        <div class="pw-title">비밀번호 변경</div>
        <div class="pw-guide">
          &lt;현재 비밀번호를 입력한 후 새로 사용할 비밀번호를 입력하세요.&gt;
        </div>
        
        <c:if test="${not empty msg}">
		  <div class="error-msg" style="color:red; margin-bottom: 10px;">${msg}</div>
		</c:if>

        <form action="${pageContext.request.contextPath}/mypage/updatePass" method="post" method="post">
          <div class="pw-group">
            <label for="currentPw">현재 비밀번호</label>
            <input type="password" name="currentPw" id="currentPw" required>
            <span id="pwCheckMsg" style="margin-left: 10px;"></span>
          </div>

          <div class="pw-group">
            <label for="newPw">변경할 비밀번호</label>
            <input type="password" name="newPw" id="newPw" required>
          </div>

          <div class="pw-group">
            <label for="confirmPw">변경할 비밀번호 재입력</label>
            <input type="password" name="confirmPw" id="confirmPw" required>
            <span id="pwMatchMsg" style="margin-left: 10px;"></span>
          </div>

          <div class="pw-buttons">
            <button type="submit">수정</button>
            <button type="button" onclick="location.href='update2.jsp'">취소</button>
          </div>
        </form>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </div>
  </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(function(){
	  $('#currentPw').on('blur keyup', function(){
	    const inputPw = $('#currentPw').val();

	    if (inputPw.trim().length === 0) {
	      $('#pwCheckMsg').html("").css('color', '');
	      return;
	    }

	    $.ajax({
	      type: "GET",
	      url: "${pageContext.request.contextPath}/mypage/checkPass",
	      data: { password: inputPw },
	      success: function(result){
	        if(result === "OK"){
	          $('#pwCheckMsg').html("비밀번호가 일치합니다.").css('color', 'green');
	        } else {
	          $('#pwCheckMsg').html("비밀번호가 일치하지 않습니다.").css('color', 'red');
	        }
	      }
	    });
	  });
	});

	// 새 비밀번호, 재입력 비교
	$(function(){
	  $('#confirmPw, #newPw').on('keyup blur', function(){
	    let newPw = $('#newPw').val();
	    let confirmPw = $('#confirmPw').val();

	    if (newPw === "" || confirmPw === "") {
	      $('#pwMatchMsg').text("").css("color", "");
	    } else if (newPw === confirmPw) {
	      $('#pwMatchMsg').text("비밀번호가 일치합니다.").css("color", "green");
	    } else {
	      $('#pwMatchMsg').text("비밀번호가 일치하지 않습니다.").css("color", "red");
	    }
	  });

	  // 제출 시 일치 여부 검사
	  $('form').on('submit', function(e){
	    if ($('#newPw').val() !== $('#confirmPw').val()) {
	      alert("비밀번호가 일치하지 않습니다.");
	      e.preventDefault();
	    }
	  });
	});
</script>
  
  
</body>
</html>