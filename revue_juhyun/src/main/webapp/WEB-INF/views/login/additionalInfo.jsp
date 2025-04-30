<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>추가 정보 입력</title>
</head>
<body>
  <h1>추가 정보 입력</h1>

  <form action="${pageContext.request.contextPath}/login/additionalInfoPro" method="post">
    
    <!-- 숨겨서 같이 보내야 하는 기본정보 -->
    <input type="hidden" name="member_id" value="${id}">
    <input type="hidden" name="member_name" value="${name}">
    <input type="hidden" name="member_email" value="${email}">
    <input type="hidden" name="member_gender" value="${gender}">
    <input type="hidden" name="member_phone" value="${phone}">

    <!-- 사용자가 입력해야 하는 추가정보 -->
    <p>생년월일 : <input type="date" name="member_birth" required></p>
    <p>주소 : <input id="address1" name="member_address" type="text" class="cellphoneNo" placeholder="주소" readonly maxlength="11" required>
		      <input type="button" value="주소검색" id="" onclick="execDaumPostcode()"><br>
		      <input id="address2" name="member_address" type="text" class="cellphoneNo" placeholder="상세주소" maxlength="11" required> </p>
    <p>좋아하는 장르 : <label for="genre" class="genderlabel">액션</label> 
					<input type="checkbox" id="gender" class="gender" name="member_like_genre" value="액션"> 
					<label for="genre" class="genderlabel">로맨스</label>
					<input type="checkbox" id="gender2" class="gender" name="member_like_genre" value="로맨스"></p>

    <button type="submit">가입 완료</button>
  </form>
  
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


	// 주소 검색 api 적용
	  function execDaumPostcode() {
	    new daum.Postcode({
	      oncomplete: function(data) {
	        document.getElementById("address1").value = data.address;
	      }
	    }).open();
	  }
	</script>
</body>
</html>