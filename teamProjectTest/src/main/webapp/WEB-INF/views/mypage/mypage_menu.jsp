<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage_menu.jsp</title>
<style>
.mypage-wrapper {
    display: flex;
}

.mypage-sidebar {
    width: 180px;
    background-color: #f8f8f8;
    border-right: 1px solid #ddd;
    font-family: '맑은 고딕', sans-serif;
}

.mypage-title {
    background-color: #c62828;
    color: white;
    font-weight: bold;
    text-align: center;
    padding: 12px 0;
    margin-bottom: 0;
}

.mypage-menu {
    list-style: none;
    padding: 0;
    margin: 0;
}

.mypage-menu li {
    margin-bottom: 0;
}

.mypage-menu li {
    padding: 10px 16px;
    color: #333;
    cursor: pointer;
}

.mypage-menu li.on {
    background-color: #ffe9e9;
    font-weight: bold;
    color: #d50000;
    border-left: 5px solid #d50000;
}

.mypage-menu li:hover {
    background-color: #ffebee;
    font-weight: bold;
    border-left: 5px solid #d32f2f;
    color: #d32f2f;
}
</style>
</head>
<body>
<div class="mypage-sidebar">
  <div class="mypage-title">마이 메뉴</div>
  <ul class="mypage-menu">
 	 <li class="<%= request.getRequestURI().contains("mymain") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/mymain">마이 메인</a></li>
    <li class="<%= request.getRequestURI().contains("reservation") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/reservation">예매 내역</a></li>
    <li class="<%= request.getRequestURI().contains("history") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/history">히스토리</a></li>
    <li class="<%= request.getRequestURI().contains("favorite") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/favorite">선호 영화관</a></li>
    <li class="<%= request.getRequestURI().contains("update") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/update">회원정보 수정</a></li>
    <li class="<%= request.getRequestURI().contains("payment") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/payment">결제 수단</a></li>
    <li class="<%= request.getRequestURI().contains("inquiry") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/inquiry">문의내역</a></li>
    <li class="<%= request.getRequestURI().contains("withdraw") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/mypage/withdraw">회원 탈퇴</a></li>
  </ul>
</div>
</body>
</html>