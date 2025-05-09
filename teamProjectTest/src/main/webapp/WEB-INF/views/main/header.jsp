<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
            <link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet">

  <title>ReVue Header</title>
</head>
<body>

<header>
  <div class="top-right">
    <a href="${pageContext.request.contextPath}/login/login">로그인</a> |
    <a href="${pageContext.request.contextPath}/login/register">회원가입</a> |
    <a href="${pageContext.request.contextPath}/mypage/mymain">마이페이지</a> |
    <a href="${pageContext.request.contextPath}/admin/adminmem">관리자페이지</a> 
  </div>

  <div class="header-inner">
    <div class="header-left">
      <div class="hamburger-wrap" id="hamburgerWrap">
        <a href="#" class="nav-btn" id="hamburgerBtn">☰</a>
        <div class="hamburger-menu" id="hamburgerMenu">
          <div class="hamburger-group">
            <h4>영화</h4>
            <ul>
              <li><a href="${pageContext.request.contextPath}/movie/mmain">현재상영작</a></li>
              <li><a href="${pageContext.request.contextPath}/movie/mmaind">상영예정작</a></li>
            </ul>
          </div>
          <div class="hamburger-group">
            <h4>극장</h4>
            <ul>
              <li><a href="${pageContext.request.contextPath}/theater/thtmain">극장 안내</a></li>
              <li><a href="${pageContext.request.contextPath}/theater/thtdetail">극장 상세</a></li>
            </ul>
          </div>
          
          
          
          
          
          <div class="hamburger-group">
            <h4>예매</h4>
            <ul>
              <li><a href="${pageContext.request.contextPath}/movie/mbooking">바로 예매</a></li>
            </ul>
          </div>
          <div class="hamburger-group">
            <h4>고객센터</h4>
            <ul>
              <li><a href="${pageContext.request.contextPath}/qna/qnawrite">문의하기</a></li>
              <li><a href="${pageContext.request.contextPath}/qna/listfaq">자주 묻는 질문</a></li>
              <li><a href="${pageContext.request.contextPath}/qna/listnotice">공지사항</a></li>
              <li><a href="/revue/chatbot">챗봇</a></li>
            </ul>
          </div>
        </div>
      </div>




      <nav>
        <ul>
          <li>
            <a href="${pageContext.request.contextPath}/movie/mmain">영화</a>
            <ul class="submenu">
              <li><a href="${pageContext.request.contextPath}/movie/mmain">현재상영작</a></li>
              <li><a href="${pageContext.request.contextPath}/movie/mdetail">상영예정작</a></li>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/theater/thtmain">극장</a>
            <ul class="submenu">
              <li><a href="${pageContext.request.contextPath}/theater/thtmain">극장 안내</a></li>
              <li><a href="${pageContext.request.contextPath}/theater/thtdetail">극장 상세</a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>



<!--     <div class="logo"> 
     <a href="${pageContext.request.contextPath}/main/main">메인 로고</a> 
    </div> -->

 <a href="${pageContext.request.contextPath}/main/main">
	  <img src="${pageContext.request.contextPath}/resources/logo/ReVuelogo.png" width="100" height="100" alt="메인로고">
	</a>


    <div class="header-right">
      <nav>
        <ul>
          <li>
            <a href="${pageContext.request.contextPath}/movie/mbooking">예매</a>
            <ul class="submenu">
              <li><a href="${pageContext.request.contextPath}/movie/mbooking">바로 예매</a></li>
            </ul>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/qna/qnamain">고객센터</a>
            <ul class="submenu">
              <li><a href="${pageContext.request.contextPath}/qna/qnawrite">문의하기</a></li>
              <li><a href="${pageContext.request.contextPath}/qna/listfaq">자주 묻는 질문</a></li>
              <li><a href="${pageContext.request.contextPath}/qna/listnotice">공지사항</a></li>
              <li><a href="/revue/chatbot">챗봇</a></li>
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</header>

<script>
  const wrap = document.getElementById("hamburgerWrap");
  const menu = document.getElementById("hamburgerMenu");
  let timeoutId;

  wrap.addEventListener("mouseenter", () => {
    clearTimeout(timeoutId);
    menu.style.display = "flex";
  });

  wrap.addEventListener("mouseleave", () => {
    timeoutId = setTimeout(() => {
      menu.style.display = "none";
    }, 150);
  });
</script>

</body>
</html>