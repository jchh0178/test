<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메뉴</title>
<style>
.side_bar {
  width: 200px;
  height: 100vh;
  background-color: #444;
  color: white;
  padding: 20px;
  box-sizing: border-box;
}

.side_bar h2 {
  margin-top: 0;
}

.side_bar ul {
  list-style: none;
  padding: 0;
}

.side_bar li {
  margin: 10px 0;
}

.side_bar li.active,
.side_bar li:hover {
  background-color: #666;
}

.side_bar a {
  text-decoration: none;
  color: white;
  display: block;
  padding: 8px;
}
</style>
</head>
<body>

<div class="side_bar">
      <h2>관리자 메뉴</h2>
      <ul>
       <li class="<%= request.getRequestURI().contains("adminmem") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminmem">회원 관리</a></li>
       <li class="<%= request.getRequestURI().contains("adminmovie") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminmovie">영화 관리</a></li>
        <li class="<%= request.getRequestURI().contains("adminmoviei") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminmoviei">영화 등록</a></li>
        <li class="<%= request.getRequestURI().contains("adminmovied") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminscreen">상영 스케줄 관리</a></li>
       <li class="<%= request.getRequestURI().contains("adminreview") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminreview">리뷰 관리</a></li>
       <li class="<%= request.getRequestURI().contains("adminpay") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminpay">결제 관리</a></li>
        <li class="<%= request.getRequestURI().contains("adminnotice") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminnotice">공지사항</a></li>
       <li class="<%= request.getRequestURI().contains("adminfaq") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/admin/adminfaq">자주 묻는 질문</a></li>
      </ul>
</div>


</body>
</html>