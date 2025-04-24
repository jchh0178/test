<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 메인</title>
<style>
/* ====================== 검색창 ====================== */
.qna_search {
  display: flex;
  align-items: center;
  gap: 15px;
  padding: 10px 15px;
  width: 100%;
  max-width: 800px;
  box-sizing: border-box;
}

.qna_search form {
  display: flex;
  align-items: center;
  gap: 8px;
}

.qna_search input[type="text"] {
  height: 32px;
  padding: 0 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
  flex: 1;
  box-sizing: border-box;
}

.qna_search .btn_search {
  height: 32px;
  padding: 0 16px;
  background-color: #007bff;
  border: none;
  color: white;
  border-radius: 4px;
  cursor: pointer;
}

.c_check_warp {
  display: flex;
  flex-direction: column;
  max-width: 800px;
  width: 100%;
}

.c_check_warp_group {
  display: flex;
  gap: 15px;
  justify-content: flex-start;
  flex-wrap: nowrap;
  margin-top: 20px;
}

.c_check_warp_group .c_box {
  flex: 1;
  min-width: 0;
  max-width: 250px;
  border: 1px solid #ccc;
  padding: 15px;
  border-radius: 8px;
  cursor: pointer;
}

.customer_notice_area {
  display: flex;
  justify-content: space-between;
  gap: 20px;
  margin-top: 30px;
}

.service_area,
.notice_area {
  width: 48%;
}

.tit {
  font-weight: bold;
  font-size: 18px;
  margin-bottom: 10px;
  display: block;
}

.list li,
.txt li {
  margin-bottom: 8px;
  line-height: 1.5;
}

.notice_area .more {
  display: block;
  text-align: right;
  margin-top: 10px;
  font-size: 14px;
  color: #007bff;
  text-decoration: none;
}
</style>
</head>
<body>
<div id="container">
  <div id="contents">
    <div class="cols-content">
      <%@ include file="qna_menu.jsp" %>
      <div class="col-detail">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
        <div class="c_check_warp">
          <div class="c_box qna_search">
            <strong class="c_tit">자주 찾는 질문 빠른검색</strong>
            <form action="#" method="get" id="searchForm">
              <input id="searchtext" type="text" name="search" title="검색어 입력" placeholder="검색어를 입력해 주세요.">
              <button type="submit" class="btn_search" title="검색하기" id="btn_search">검색</button>
            </form>
          </div>

          <div class="c_check_warp_group">
            <div class="c_box talk_inquiry">
              <strong class="c_tit">분실물 문의</strong><br>
              <span class="c_txt">분실물을 문의해주세요.</span><br>
              <a href="#">문의하기</a>
            </div>
            <div class="c_box email_inquiry">
              <strong class="c_tit">1:1 문의</strong><br>
              <span class="c_txt">문의내용을 남겨주세요.</span><br>
              <a href="#">문의하기</a>
            </div>
            <div class="c_box my_advice">
              <strong class="c_tit">챗봇</strong><br>
              <span class="c_txt">24시간 365일 언제든지 문의</span><br>
              <a href="#" target="_blank" title="새창열기">챗봇과 연결</a>
            </div>
          </div>
        </div>

        <div class="customer_notice_area">
          <div class="service_area">
            <span class="tit">자주 묻는 질문</span>
            <ul class="list">
              <li><a href="#">회원정보 수정, 회원 탈퇴는 어디에서 가능한가요?</a><span class="day">2024-08-26</span></li>
              <li><a href="#">예매 취소 및 환불 규정은 어떻게 되나요?</a><span class="day">2024-08-26</span></li>
              <li><a href="#">이미 예매한 내역의 결제수단을 변경하고 싶어요.</a><span class="day">2024-08-30</span></li>
              <li><a href="#">선호영화관은 어떻게 지정할 수 있나요?</a><span class="day">2024-08-26</span></li>
              <li><a href="#">영화 장르별 리뷰를 볼 수 있나요?</a><span class="day">2024-08-26</span></li>
            </ul>
          </div>
          <div class="notice_area">
            <span class="tit">공지사항</span>
            <ul class="txt">
              <li><a href="#">[행사/이벤트] 땅콩이 스페셜 키링 증정 이벤트 수령 극장 안내</a><span class="day">2024-08-26</span></li>
              <li><a href="#">[기타] 비정상적 예매티켓 모니터링 강화 안내</a><span class="day">2024-08-26</span></li>
              <li><a href="#">[극장] reVue 주차장 공사 안내</a><span class="day">2024-08-30</span></li>
              <li><a href="#">[극장] reVue 광교점 운영 종료 안내</a><span class="day">2024-08-26</span></li>
              <li><a href="#">[시스템 점검] LGU+ 시스템 점검 공지</a><span class="day">2024-08-26</span></li>
              <li><a href="#">[극장] <블랙핑크 월드투어 [본 핑크] 인 시네마> 무대인사 회차 휠체어석 유의사항 안내</a><span class="day">2024-08-26</span></li>
            </ul>
            <a href="#" class="more">공지사항 더보기</a>
          </div>
        </div>
               <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
      </div>

    </div>
  </div>
</div>
</body>
</html>