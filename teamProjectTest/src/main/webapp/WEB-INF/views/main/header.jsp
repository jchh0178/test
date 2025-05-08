<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>ReVue Header</title>
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body { font-family: 'Noto Sans KR', sans-serif; }

    header {
      background: none;
      color: #000;
      border-bottom: 1px solid #ddd;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    }

    .header-inner {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      position: relative;
    }

    .header-left,
    .header-right {
      display: flex;
      align-items: center;
      gap: 18px;
    }

    .top-right {
      position: absolute;
      top: 10px;
      right: 20px;
    }

    .top-right a {
      color: #333;
      text-decoration: none;
      margin-left: 10px;
      font-size: 14px;
      transition: color 0.2s;
    }

    .top-right a:hover {
      color: #e74c3c;
    }

    .logo a {
      font-size: 18px;
      font-weight: bold;
      text-decoration: none;
      color: #000;
    }

    nav ul {
      display: flex;
      list-style: none;
      gap: 16px;
      margin: 0;
      padding: 0;
    }

    nav ul li {
      position: relative;
    }

    nav ul li a {
      color: #000;
      text-decoration: none;
      font-size: 17px;
      font-weight: 500;
      padding: 6px 10px;
      border-radius: 4px;
      transition: background 0.2s ease, color 0.2s ease;
    }

    nav ul li a:hover {
      background: #f5f5f5;
      color: #e74c3c;
    }

    .submenu {
      position: absolute;
      top: 36px;
      left: 0;
      background: rgba(0, 0, 0, 0.85);
      padding: 10px 0;
      display: none;
      min-width: 150px;
      z-index: 1000;
      border-radius: 4px;
    }

    .submenu li {
      padding: 4px 16px;
    }

    .submenu li a {
      font-size: 13.5px;
      color: #fff;
      white-space: nowrap;
      transition: color 0.2s;
    }

    .submenu li a:hover {
      color: #ffcc00;
    }

    nav ul li:hover .submenu {
      display: block;
    }

    .hamburger-wrap {
      position: relative;
      display: inline-block;
    }

    .hamburger-menu {
      display: none;
      position: absolute;
      top: 36px;
      left: 0;
      background: #fff;
      padding: 20px;
      box-shadow: 0 3px 6px rgba(0,0,0,0.15);
      border-radius: 6px;
      z-index: 1000;
      flex-direction: row;
      gap: 40px;
      min-width: 500px;
    }

    .hamburger-group h4 {
      margin-bottom: 10px;
      font-size: 15px;
      color: #333;
    }

    .hamburger-group ul {
      list-style: none;
      padding: 0;
    }

    .hamburger-group ul li a {
      display: block;
      font-size: 14px;
      margin: 4px 0;
      color: #333;
      text-decoration: none;
      white-space: nowrap;
    }

    .hamburger-group ul li a:hover {
      color: #e74c3c;
    }
  </style>
</head>
<body>

<header>
  <div class="top-right">
    <a href="${pageContext.request.contextPath}/login/login">로그인</a> |
    <a href="${pageContext.request.contextPath}/login/register">회원가입</a> |
    <a href="${pageContext.request.contextPath}/mypage/mymain">마이페이지</a> |
    <a href="${pageContext.request.contextPath}/admin/adminmem">관리자페이지</a> |
    <a href="${pageContext.request.contextPath}/movie/payment">결제</a> |
    <a href="${pageContext.request.contextPath}/theater/screen">상영정보</a>
    
  </div>

  <div class="header-inner">
    <div class="header-left">
      <div class="hamburger-wrap" id="hamburgerWrap">
        <a href="#" class="nav-btn" id="hamburgerBtn">☰</a>
        <div class="hamburger-menu" id="hamburgerMenu">
          <div class="hamburger-group">
            <h4>영화</h4>
            <ul>
              <li><a href="${pageContext.request.contextPath}/movie/main">무비차트</a></li>
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
            <a href="${pageContext.request.contextPath}/movie/main">영화</a>
            <ul class="submenu">
             <li><a href="${pageContext.request.contextPath}/movie/main">무비차트</a></li>
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