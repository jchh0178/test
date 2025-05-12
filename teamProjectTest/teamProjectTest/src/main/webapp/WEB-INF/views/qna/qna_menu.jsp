<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String uri = request.getRequestURI();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna_menu</title>
<style>
/* 기존 스타일 그대로 유지 */
.cols-content {
  display: flex;
  gap: 20px;
}

.col-aside {
  width: 220px;
  flex-shrink: 0;
  border-right: 1px solid #e0e0e0;
  padding: 30px 20px;
  background-color: #f9f9f9;
  border-radius: 10px;
  box-shadow: 2px 2px 10px rgba(0,0,0,0.05);
}

.col-detail {
  flex-grow: 1;
  max-width: 900px;
  width: 100%;
}

.menu-title {
  font-size: 22px;
  font-weight: 600;
  margin-bottom: 25px;
  color: #222;
  border-bottom: 2px solid #007bff;
  padding-bottom: 8px;
}

.snb ul {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.snb li {
  margin: 0;
}

.snb a {
  text-decoration: none;
  font-size: 16px;
  color: #333;
  padding: 10px 15px;
  display: block;
  border-radius: 6px;
  transition: all 0.3s ease;
}

.snb a:hover {
  background-color: #e6f0ff;
  color: #007bff;
}

.snb li.on a {
  font-weight: bold;
  background-color: #007bff;
  color: white;
}
</style>
</head>
<body>

<div class="col-aside">
  <h2>고객센터 메뉴</h2>
  <div class="snb">
    <ul>
      <li class="<%= uri.contains("qna_main.jsp") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/qna/qnamain">고객센터 메인</a></li>
<%--       <li class="<%= uri.contains("list_lost.jsp") ? "on" : "" %>"><a href="/qna/list_lost.jsp">분실물 문의</a></li> --%>
      <li class="<%= uri.contains("qna_write.jsp") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/qna/qnawrite">1:1 문의하기</a></li>
      <li class="<%= uri.contains("list_faq.jsp") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/qna/listfaq">자주 찾는 질문</a></li>
      <li class="<%= uri.contains("list_notice.jsp") ? "on" : "" %>"><a href="${pageContext.request.contextPath}/qna/listnotice">공지사항</a></li>
      <li><a href="#">챗   봇</a></li>
    </ul>
  </div>
</div>

</body>
</html>