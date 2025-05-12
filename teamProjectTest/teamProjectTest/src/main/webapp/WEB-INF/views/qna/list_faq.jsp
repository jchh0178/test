<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common_qna.css">
<style>
  .tab-btn.active {
    background-color: teal;
    color: skyblue;
    font-weight: bold;
  }
  .faq_tabs {
    margin: 20px 0;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 5px;
  }
  .faq_tabs .tab-btn {
    padding: 8px 12px;
    border: 1px solid #ccc;
    background: #fff;
    cursor: pointer;
    font-size: 14px;
  }
  .faq_tabs .tab-btn:hover {
    background: #f2f2f2;
  }
  .search_area {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
  }
  .search_area input[type="text"] {
    padding: 5px;
    font-size: 14px;
  }
  .search_area button {
    padding: 5px 10px;
    font-size: 14px;
    cursor: pointer;
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
      
        <div class="customer_top">
          <h2 class="tit">자주 묻는 질문</h2>
          <p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다.<br>궁금하신 내용에 대해 검색해보세요.</p>
        </div>

        <div class="search_area">
          <form action="/teamproject/inquiry/often" method="get" id="searchForm">
            <label for="searchText" class="sr-only">검색</label>
            <input id="searchText" type="text" name="search" placeholder="검색어를 입력해 주세요" style="width:185px;">
            <button type="submit" class="round inblack" id="btnSearch">
              <span>검색하기</span>
            </button>
          </form>
        </div>

        <div class="faq_tabs qna-tab">
          <button class="tab-btn active" data-category="all">전체</button>
          <button class="tab-btn" data-category="영화예매">영화예매</button>
          <button class="tab-btn" data-category="공지사항">공지사항</button>
          <button class="tab-btn" data-category="분실물">분실물</button>
          <button class="tab-btn" data-category="극장">극장</button>
          <button class="tab-btn" data-category="결제수단">결제수단</button>
          <button class="tab-btn" data-category="홈페이지">홈페이지</button>
          <button class="tab-btn" data-category="챗봇">챗봇</button>
        </div>

        <div class="search_result clear">
          총 <span class="num">11건</span>이 검색되었습니다.
        </div>

        <div class="tbl_area">
          <table class="tbl_notice_list">
<!--             <caption>FAQ 목록</caption> -->
            <colgroup>
              <col style="width:40px;">
              <col style="width:560px;">
              <col>
            </colgroup>
            <thead>
              <tr>
                <th>번호</th>
                <th class="tit">제목</th>
                <th>등록일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>11</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=11">회원정보 수정, 회원 탈퇴는 어디에서 가능한가요?</a></td>
                <td>2024-08-30</td>
              </tr>
              <tr>
                <td>10</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=10">영화관람/매점상품 기프트콘은 어디서 환불하나요?</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>9</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=9">예매 취소 및 환불 규정은 어떻게 되나요?</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>8</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=8">관람권 번호를 등록했는데 등록되지 않아요.</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>7</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=7">인터넷 예매 후 OSTiket 현장에서 환불(예매 취소)이 가능한가요?</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>6</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=6">관람권 사용해서 예매했는데 현금영수증 발행을 못했어요!</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>5</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=5">이미 예매한 내역의 결제수단을 변경하고 싶어요.</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>4</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=4">기프트콘 구매 시 결제 방법은 어떻게 되나요?</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>3</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=3">포토플레이 출력은 어떻게 하나요?</a></td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td>2</td>
                <td><a href="/teamproject/inquiry/oftencontent?search=&OF_NUM=2">예매 도중 결제 완료 전 취소했는데 재예매 시 동일 좌석 선택이 안되요.</a></td>
                <td>2024-08-26</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="paging">
          <ul class="pagination">
            <li class="on"><a href="#" onclick="goToPage(1); return false;">1</a></li>
            <li><a href="#" onclick="goToPage(2); return false;">2</a></li>
            <li><a href="#" onclick="goToPage(3); return false;">3</a></li>
            <li><a href="#" onclick="goToPage(4); return false;">4</a></li>
            <li><a href="#" onclick="goToPage(5); return false;">5</a></li>
          </ul>
          <button class="btn-paging end" type="button" onclick="goToPage(11)">끝</button>
        </div>
         <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
      </div>
    </div>
  </div>
</div>
</body>
</html>