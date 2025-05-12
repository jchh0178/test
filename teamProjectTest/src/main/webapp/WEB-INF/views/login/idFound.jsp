<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>

		<form action="${pageContext.request.contextPath}/login/idfoundPro"class="idFound" 
			method="post">
			<div class="findIdField">
			<h4>아이디 찾기</h4>
<!-- 				<span id="leadtext">네이버 계정 또는 카카오톡 계정 의 아이디/비밀번호를 찾고자 하실 경우, 네이버 사이트 또는 카카오톡 사이트 의 -->
<!-- 					아이디/비밀번호 찾기를 이용해 주세요.</span><br>  -->
				<input type="text" name="member_name" id="name" placeholder="이름" maxlength="5">
			</div>
			<div class="findIdField">
				<input type="date" name="member_birth" id="birth" placeholder="생년월일" maxlength="8">
			</div>
			<div class="findIdField">
				<input type="text" name="member_phone" id="phone" placeholder="연락처" maxlength="11">
			</div>
			<input type="submit" class="" value="아이디 찾기">
			
			
			<h4>본인 인증으로 찾기</h4>
			
			<span class="bg"><a href="javascript:;" class="btn btn_em"  title="새 창"><button>휴대전화 인증</button></a></span>
<!-- 			<span class="bg"></span><a href="javascript:;" class="btn btn_em" onclick="javascript:fnCheckKmcPopup(event);" title="새 창"><span>휴대전화 인증</span></a> -->
			</form>
		
		 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
	</div>
	
	
	<script type="text/javascript">
	//인증번호 전송
	  function sendAuthCode() {
	    const phone = document.getElementById("phone").value;

	    if (!phone) {
	      alert("전화번호를 입력해주세요.");
	      return;
	    }

	    fetch("/revue/sendSMS", {
	      method: "POST",
	      headers: { "Content-Type": "application/x-www-form-urlencoded" },
	      body: "phone=" + encodeURIComponent(phone)
	    })
	    .then(res => res.text())
	    .then(code => {
	      alert("인증번호가 발송되었습니다.");
	      window.generatedCode = code; // 인증번호 저장 (테스트용)
	      document.getElementById("authSection").style.display = "block";
	    });
	  }

		//인증번호 체크하기
	  function checkAuthCode() {
	    const userInput = document.getElementById("authCodeInput").value;

	    if (userInput === window.generatedCode) {
	      alert("✅ 인증 성공!");
	    } else {
	      alert("❌ 인증 실패. 다시 입력해주세요.");
	    }
	  }
	
	
	
	
	</script>
</body>
</html>