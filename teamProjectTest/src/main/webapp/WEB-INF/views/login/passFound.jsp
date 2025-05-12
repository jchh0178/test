<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비번 찾기</title>
</head>
<body>
<div>
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>


<form class="findForm" action="${pageContext.request.contextPath}/login/passFound" method="post" style="margin-top: 10%;">
		<div class="findPassField">
		<h3>비밀번호 찾기</h3>
<!-- 			<span id="leadtext">네이버 계정의 아이디/비밀번호를 찾고자 하실 경우, 네이버 사이트의 -->
<!-- 				아이디/비밀번호 찾기를 이용해 주세요.</span><br>  -->
		아이디: <input type="text" name="member_id" id="id" placeholder="아이디" maxlength="20">
		</div>
		<div class="findIdField">
		이름: <input type="text" name="member_name" id="name" placeholder="이름" maxlength="5">
		</div>
		<div class="findIdField">
		휴대폰번호: <input type="text" name="member_phone" id="phone" placeholder="'-'없이 입력" maxlength="11">
				<input type="button" value="인증번호 받기" onclick="sendAuthCode()">
		</div>
<!-- 		<div class="findIdField"> -->
		인증번호: <input type="text" id="authCodeInput" class="number" placeholder="인증번호 입력">
				  <input type="button" name="check" value="확인" onclick="checkAuthCode()">
				  <input type="hidden" name="hCheck" value="0">
<!-- 		</div> --><br>
		<input type="submit" class="pass" value="비밀번호 재설정">
		
		
		
	</form>
	 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	
		 function sendAuthCode() {
		    const phone = document.getElementById("phone").value;

		    if (!phone) {
		      alert("전화번호를 입력해주세요.");
		      return;
		    }

		    fetch("${pageContext.request.contextPath}/login/sendSMS", {
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

		 
		 
			//인증번호 체크하기---------------------------------------------
		  function checkAuthCode() {
		    const userInput = document.getElementById("authCodeInput").value;
		    $('.hcheck').val("");
		    if (userInput === window.generatedCode) {
		      alert("✅ 인증 성공!");
		    
		      $('.hcheck').val("1");
		      
		    } else {
		      alert("❌ 인증 실패. 다시 입력해주세요.");
		      $('.hcheck').val("0");
		    }
		  }
			
			
		  $('.pass').on('click', function() {
			const hcheck = $('.hcheck').val();
			let sub = document.querySelector(".findForm");  
			if(hcheck == 1){
				  alert("전송이 되었습니다.");
				  sub.submit();
			  }else{
				  alert("인증번호를 제대로 입력 해주세요");
				  $('.number').focus();                            
				  
			  }
			
			
		});
	
	
	
	</script>
</body>
</html>