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


<form class="findForm" action="/teamproject/member/tempPass" method="post" style="margin-top: 10%;">
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
		<span class="bg"></span><a href="javascript:;" class="btn btn_em" onclick="" title="새 창"><button>인증요청</button></a>

		</div>
		<div class="findIdField">
		인증번호: <input type="text" name="member_phone" id="phone" maxlength="11">
		<span class="bg"></span><a href="javascript:;" class="btn btn_em" onclick="" title="새 창"><button>인증확인</button></a>
		</div>
		<input type="submit" class="" value="비밀번호 찾기">
		
		
		<h3>새 비밀번호 설정</h3>
		아이디: <input type="text" name="member_id" id="id" placeholder="아이디" maxlength="20"><br>
		<span class="bg"></span><a href="javascript:;" class="btn btn_em" onclick="" title="새 창"><button>휴대전화 인증</button></a>
		
	</form>
	 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
	</div>
</body>
</html>