<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패스워드 알림이</title>
</head>
<body>

<script type="text/javascript">

alert("비밀번호 : ${loginDTO.member_pass}");
location.href="${pageContext.request.contextPath}/login/login";

</script>


</body>
</html>