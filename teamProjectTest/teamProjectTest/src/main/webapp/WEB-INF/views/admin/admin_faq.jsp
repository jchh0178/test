<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>관리자 - 자주 묻는 질문</title>

<style type="text/css">
body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  padding: 0;
  background: #f7f7f7;
}

.container {
  display: flex;
}



.content {
  flex: 1;
  padding: 30px;
  background: #fff;
}

.search-container {
  margin-bottom: 20px;
}

.search-container input {
  width: 300px;
  padding: 8px;
  margin-left: 10px;
}

.category-tabs button {
  margin: 5px;
  padding: 8px 15px;
  background: #eee;
  border: 1px solid #ccc;
  cursor: pointer;
}

.faq-list {
  margin-top: 20px;
}

.faq-item {
  margin-bottom: 15px;
}

.faq-question {
  width: 100%;
  background: #f0f0f0;
  border: none;
  text-align: left;
  padding: 10px;
  font-weight: bold;
  cursor: pointer;
}

.faq-answer {
  background: #fafafa;
  padding: 10px;
  border: 1px solid #ddd;
  display: none;
}

.faq-question.active + .faq-answer {
  display: block;
}

.faq-actions {
  margin-top: 20px;
}

.edit-btn, .delete-btn {
  padding: 10px 20px;
  margin-right: 10px;
}
</style>

</head>
<body>
  <div class="container">
	    <%@ include file="admin_menu.jsp" %>

    <main class="content">
    
    <%@ include file="../main/header.jsp" %>
    
      <h1>자주 묻는 질문</h1>
      <div class="search-container">
        <label for="search">빠른검색</label>
        <input type="text" id="search" placeholder="검색어를 입력하세요" />
        <button>🔍</button>
      </div>

      <div class="category-tabs">
        <button>전체</button>
        <button>영화예매</button>
        <button>공지사항</button>
        <button>분실물</button>
        <button>극장</button>
        <button>결제수단</button>
        <button>홈페이지</button>
        <button>챗봇</button>
      </div>

<div class="faq-list">
  <div class="faq-item">
    <input type="checkbox" class="faq-check" />
    <button class="faq-question">[영화예매] 영화 예매는 어떻게 하나요?</button>
    <div class="faq-answer">예매는 상단 메뉴에서 '영화예매'를 통해 가능합니다.</div>
  </div>
  <div class="faq-item">
    <input type="checkbox" class="faq-check" />
    <button class="faq-question">[결제수단] 결제 수단은 어떤 것이 있나요?</button>
    <div class="faq-answer">신용카드, 체크카드, 간편결제 등을 지원합니다.</div>
  </div>
  <!-- 추가 항목들도 위와 같은 구조로 반복 -->
</div>

<div class="faq-actions">
  <button class="edit-btn" onclick="editFaq()">수정</button>
  <button class="delete-btn" onclick="deleteFaq()">삭제</button>
</div>


<%@ include file="../main/footer.jsp" %>


    </main>
  </div>
  
  <script>
  function getCheckedFaqIndexes() {
    const checkboxes = document.querySelectorAll('.faq-check');
    let checkedIndexes = [];
    checkboxes.forEach((cb, i) => {
      if (cb.checked) {
        checkedIndexes.push(i);
      }
    });
    return checkedIndexes;
  }

  function editFaq() {
    const selected = getCheckedFaqIndexes();
    if (selected.length !== 1) {
      alert("수정은 하나의 질문만 선택해주세요.");
      return;
    }
    alert("수정할 항목 번호: " + (selected[0] + 1));
    // 실제 수정 화면 이동 코드 or 팝업 등 구현
  }

  function deleteFaq() {
    const selected = getCheckedFaqIndexes();
    if (selected.length === 0) {
      alert("삭제할 질문을 선택해주세요.");
      return;
    }
    if (confirm(selected.length + "개의 항목을 삭제하시겠습니까?")) {
      alert("삭제 처리 완료 (예시)");
      // 실제 삭제 처리 필요
    }
  }
</script>
</body>
</html>