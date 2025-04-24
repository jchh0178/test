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

		<form class="" action=""
			method="post">
			<div class="findIdField">
			<h4>아이디 찾기</h4>
<!-- 				<span id="leadtext">네이버 계정 또는 카카오톡 계정 의 아이디/비밀번호를 찾고자 하실 경우, 네이버 사이트 또는 카카오톡 사이트 의 -->
<!-- 					아이디/비밀번호 찾기를 이용해 주세요.</span><br>  -->
				<input type="text" name="member_name" id="name" placeholder="이름" maxlength="5">
			</div>
			<div class="findIdField">
				<input type="text" name="member_birth" id="birth" placeholder="생년월일" maxlength="8">
			</div>
			<div class="findIdField">
				<input type="text" name="member_phone" id="phone" placeholder="연락처" maxlength="11">
			</div>
			<input type="submit" class="" value="아이디 찾기">
			
			
			<h4>본인 인증으로 찾기</h4>
			
			<span class="bg"></span><a href="javascript:;" class="btn btn_em" onclick="javascript:fnCheckKmcPopup(event);" title="새 창"><button>휴대전화 인증</button></a>
<!-- 			<span class="bg"></span><a href="javascript:;" class="btn btn_em" onclick="javascript:fnCheckKmcPopup(event);" title="새 창"><span>휴대전화 인증</span></a> -->
			
		</form>
		 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
	</div>
</body>
</html>