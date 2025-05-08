<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>
<style>
/* footer */
footer {
  border-top: 1px solid #ddd;
  padding-top: 20px;
  background-color: #fff;
}

footer .foot_area {
  position: relative;
  padding-bottom: 40px;
  text-align: center; /* 가운데 정렬 */
}

footer .foot_area .foot_list {
  padding-top: 25px;
  display: flex;
  justify-content: center; /* 가운데 정렬 */
  gap: 15px;
  list-style: none;
  padding-left: 0;
}

footer .foot_area .foot_list li {
  font-size: 15px;
  position: relative;
}

footer .foot_area .foot_list li:not(:last-child)::after {
  content: "|";
  margin-left: 10px;
  color: #aaa;
  position: relative;
  left: 5px;
}

footer .foot_area .foot_list li a {
  font-weight: bold;
  font-size: 15px;
  text-decoration: none;
  color: #333;
}

footer .foot_area h2 {
  padding-top: 25px;
  font-size: 14px;
  color: #666;
  text-align: center; /* 추가 */
}

footer .foot_area .addr {
  padding-top: 5px;
  line-height: 1.4;
  font-size: 13px;
  color: #666;
  text-align: center; /* 추가 */
}

footer .foot_area .addr .space0 {
  letter-spacing: 0;
}

footer .foot_area .copy {
  padding-top: 3px;
  font-size: 13px;
  color: #666;
  letter-spacing: 0;
  text-align: center; /* 추가 */
}
</style>
</head>
<body>
  <footer>
    <div class="foot_area box_inner">
      <ul class="foot_list">
        <li><a href="${pageContext.request.contextPath}/movie/main">영화</a></li>
        <li><a href="${pageContext.request.contextPath}/movie/mbooking">예매</a></li>
        <li><a href="${pageContext.request.contextPath}/theater/thtmain">극장</a></li>
        <li><a href="${pageContext.request.contextPath}/login/login">로그인</a></li>
        <li><a href="${pageContext.request.contextPath}/login/register">회원가입</a></li>
        <li><a href="${pageContext.request.contextPath}/qna/qnamain">고객센터</a></li>
      </ul>
      <h2>ReVue : 리뷰를 통해 다시 보다</h2>
      <p class="addr">
        부산광역시 부산진구 중앙대로 109<span class="gubun"> / </span>
        <span class="br_line"> TEL : <span class="space0">051-803-0909</span> <span class="gubun"> / </span>
          <span class="br_line">E-mail : <span class="space0">work@itwillbs.co.kr</span>
          </span>
        </span>
      </p>
      <p class="copy box_inner">Copyright(c) ReVue all right reserved</p>
    </div>
  </footer>
</body>
</html>