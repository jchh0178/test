<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>


    <!-- Header -->
    <%@ include file="../main/header.jsp" %>


	<form action="${pageContext.request.contextPath}/login/registerPro" id="regis" class="regis" method="post">
		<div class="">
			<h2 class="">회원가입</h2>
			<div class="member_name"> 
				<input id="name" name="member_name" type="text" class="name" placeholder="이름" maxlength="5">
			</div>
			<div class="member_id">
				<input id="id" name="member_id" type="text" class="id" placeholder="아이디" maxlength="20"> 
				<span class="idhint">(영문, 숫자를 하나 이상 포함해야 합니다.(5~20자))</span> 
			<!-- 
			<input type="button" value="중복체크" id="idbtn">
				<div id="idck" class="checkText"> 
-->
				</div>

<!-- 			</div> -->
			<div class="member_pass">
				<input id="pass" name="member_pass" type="password" class="pass" placeholder="비밀번호" maxlength="20"> 
				<span class="passhint">(영문, 숫자, 특수문자를 하나 이상 포함해야 합니다.(5~20자))</span>
			</div>
			<!-- 
			<div class="member_pass">
				<input id="passck" name="member_pass" type="password" class="pass" placeholder="비밀번호 확인" maxlength="20"> 
				<span id="confirmPasswdResult"></span>
			</div>
			 -->
			 
			<!--  email 입력란 : (hidden에서 email과 emailDomain 합쳐서 member_email 저장) -->
			<input id="email" name="email" type="text" class="email" placeholder="이메일">
			@ 
			<input id="emailDomain" name="emailDomain" type="text" class="emailDomain" placeholder="입력">
			<select class="domainList" id="domainList">
			  <option value="">직접 입력</option>
			  <option value="naver.com">naver.com</option>
			  <option value="gmail.com">gmail.com</option>
			  <option value="daum.net">daum.net</option>
			</select>
			<input type="hidden" id="member_email" name="member_email">
			
			<div class="essentialtf">
				<div class="genderContainer">
					<label for="gender" class="genderlabel">남</label> 
					<input type="radio" id="gender" class="gender" name="member_gender" value="M"> 
					<label for="gender2" class="genderlabel">여</label>
					<input type="radio" id="gender2" class="gender" name="member_gender" value="F">
				</div>
				<input id="birth" name="member_birth" type="text" class="birth" placeholder="생년월일(8자리)" maxlength="8">
			</div>
			


			
		    <div class="essentialtf">
		      <input id="address1" name="member_address" type="text" class="cellphoneNo" placeholder="주소" readonly maxlength="11">
		      <input type="button" value="주소검색" id="" onclick="execDaumPostcode()"><br>
		      <input id="address2" name="member_address" type="text" class="cellphoneNo" placeholder="상세주소" maxlength="11"> 
		    </div>

    
	    <!-- 전화번호 입력 -->
	<div class="essentialtf">
	  <input type="text" id="phone" name="member_phone" placeholder="전화번호" maxlength="11">
	  <input type="button" value="인증번호 받기" onclick="sendAuthCode()">
	</div>
	
	<!-- 인증번호 입력 영역 (처음엔 숨김) -->
	<div id="authSection" style="display: none; margin-top: 10px;">
	  <input type="text" id="authCodeInput" placeholder="인증번호 입력">
	  <input type="button" value="확인" onclick="checkAuthCode()">
	</div>
	    
	    
    
    <div class="genderContainer">
					<label for="genre" class="genderlabel">액션</label> 
					<input type="checkbox" id="gender" class="gender" name="member_like_genre" value="액션"> 
					<label for="genre" class="genderlabel">로맨스</label>
					<input type="checkbox" id="gender2" class="gender" name="member_like_genre" value="로맨스">
				</div>
			<input type="submit" id="btn" value="회원가입">
  </div>
</form>

<!-- Footer -->
<%@ include file="../main/footer.jsp" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


	// 주소 검색 api 적용임
	  function execDaumPostcode() {
	    new daum.Postcode({
	      oncomplete: function(data) {
	        document.getElementById("address1").value = data.address;
	      }
	    }).open();
	  }



	//이메일 도메인 저장
	document.getElementById("domainList").addEventListener("change", function() {
    document.getElementById("emailDomain").value = this.value;
    updateFullEmail();
  });

  document.getElementById("email").addEventListener("input", updateFullEmail);
  document.getElementById("emailDomain").addEventListener("input", updateFullEmail);

  function updateFullEmail() {
    const emailFront = document.getElementById("email").value;
    const emailBack = document.getElementById("emailDomain").value;
    
    if (emailFront && emailBack) {
      document.getElementById("member_email").value = emailFront + "@" + emailBack;
    } else {
      document.getElementById("member_email").value = "";
    }
  }

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