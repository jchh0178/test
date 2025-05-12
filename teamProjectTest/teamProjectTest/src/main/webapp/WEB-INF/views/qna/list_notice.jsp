<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>공지사항</title>		
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/common_qna.css">
<style>
  .c_tab li a {
    padding: 8px 16px;
    font-size: 14px;
  }
  .search-area {
    display: flex;
    gap: 10px;
    align-items: center;
    justify-content: flex-end;
    margin-bottom: 20px;
  }
  .search-area input[type="text"] {
    padding: 5px;
    font-size: 14px;
  }
  .search-area button {
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
          <h2 class="tit">공지사항</h2>
          <p class="stit">CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
        </div>

        <div class="search-area">
          <select name="region" id="region">
            <option>지역</option>
          </select>
          <select name="branch" id="branch">
            <option>극장</option>
          </select>
          <form action="/teamproject/inquiry/news" method="get" id="searchForm">
            <input id="searchText" type="text" name="search" placeholder="검색어를 입력해 주세요">
            <button type="submit">🔍</button>
          </form>
        </div>

        <ul class="c_tab qna-tab">
          <li class="on"><a href="#">전체</a></li>
          <li><a href="#">본사공지</a></li>
          <li><a href="#">지점공지</a></li>
        </ul>

        <div class="tbl_area">
          <table class="tbl_notice_list">
            <thead>
              <tr>
                <th>번호</th>
                <th>극장</th>
                <th>구분</th>
                <th>제목</th>
                <th>등록일</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>부산</td>
                <td>공지</td>
                <td>공지사항 제목 예시</td>
                <td>2024-08-26</td>
              </tr>
              <tr>
                <td colspan="5" style="text-align:center; color:#999;">게시글 없음</td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="paging">
          <ul>
            <li class="on"><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
            <li><a href="#">6</a></li>
          </ul>
          <button class="btn-paging end" type="button">▶</button>
        </div>
         <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
      </div>
    </div>
  </div>
</div>
</body>
</html>