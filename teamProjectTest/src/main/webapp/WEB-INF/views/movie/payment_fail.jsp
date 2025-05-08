<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>결제 실패</title>
</head>
<body>
  <h2>❌ 결제가 실패했습니다.</h2>
  <p>오류 메시지: ${error}</p>
  <a href="${pageContext.request.contextPath}/movie/booking">다시 시도하기</a>
</body>
</html>