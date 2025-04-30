<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>login</title>
</head>
<body>
<div>
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>

  <form action="${pageContext.request.contextPath}/login/loginPro" method="post" class="loginForm" id="loginForm">

		<span id="leadtext">아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</span>
		<div class="logintf">
			<input type="text" name="member_id" id="id" placeholder="아이디">
		</div>
		<div class="logintf">
			<input type="password" name="member_pass" id="pass"
				placeholder="비밀번호">
		</div>

		<div class="findIdPass">
			<a href="${pageContext.request.contextPath}/login/idfound" class="loginlink">아이디 찾기</a> 
			<a href="${pageContext.request.contextPath}/login/pwfound" class="loginlink">비밀번호 찾기</a> 
			<a href="${pageContext.request.contextPath}/login/register" class="loginlink">회원가입</a>
		</div>

		<div class="buttonContainer">
			<input type="submit" value="로그인하기" class="btn" id="btn">
			
			<!--  네이버 로그인  -->
			<div class="sns">
				<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=F_hif7XtXFlJyphbSdxx&state=267974268761645228630112013267620183121&redirect_uri=http://localhost:8080/revue/callback"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" /></a>
			</div>
		</div>
		

	</form>
 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %></div>

<script type="text/javascript">
let submitBtn = document.querySelector("#btn");
let appForm = document.querySelector("#loginForm");
let id = document.querySelector("#id");

submitBtn.onclick = function () {
    if(id.value == ""){
        alert("아이디 입력하세요");
        id.focus();
        return;
    }
    appForm.submit();
}
</script>

</body>
</html>