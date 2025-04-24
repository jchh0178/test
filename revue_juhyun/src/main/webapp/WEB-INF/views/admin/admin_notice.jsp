<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <title>관리자 - 공지사항</title>

<style type="text/css">
body {
  margin: 0;
  font-family: 'Noto Sans KR', sans-serif;
  background: #f5f5f5;
}

.container {
  display: flex;
}

.content {
  flex: 1;
  padding: 30px;
}

h1 {
  font-size: 24px;
  margin-bottom: 20px;
}

.tabs button {
  margin-right: 10px;
  padding: 8px 16px;
  border: 1px solid #ccc;
  background: white;
  cursor: pointer;
}

.filters {
  margin-top: 20px;
  display: flex;
  gap: 10px;
}

.filters select,
.filters input {
  padding: 8px;
  font-size: 14px;
}

.search-btn {
  padding: 8px 12px;
  font-size: 14px;
  background: #3498db;
  color: white;
  border: none;
  cursor: pointer;
}

table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 30px;
  background: white;
}

table th, table td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: center;
}

.buttons {
  margin-top: 20px;
  text-align: right;
}

.edit-btn,
.delete-btn {
  padding: 8px 16px;
  margin-left: 10px;
  font-size: 14px;
  cursor: pointer;
  border: none;
}

.edit-btn {
  background-color: #f1c40f;
  color: white;
}

.delete-btn {
  background-color: #e74c3c;
  color: white;
}
</style>

</head>
<body>
  <div class="container">
     <%@ include file="admin_menu.jsp" %>

    <main class="content">
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>

      <h1>공지사항</h1>
      <div class="tabs">
        <button>전체</button>
        <button>본사공지</button>
        <button>지점공지</button>
      </div>
      <div class="filters">
        <select>
          <option>지역</option>
        </select>
        <select>
          <option>극장</option>
        </select>
        <input type="text" placeholder="검색어 입력" />
        <button class="search-btn">🔍</button>
      </div>
 <table>
  <thead>
    <tr>
      <th><input type="checkbox" id="checkAll" /></th>
      <th>번호</th>
      <th>극장</th>
      <th>구분</th>
      <th>제목</th>
      <th>등록일</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><input type="checkbox" class="row-check" /></td>
      <td>1</td>
      <td>강남</td>
      <td>본사</td>
      <td>시스템 점검 안내</td>
      <td>2025-04-22</td>
    </tr>
    <!-- 추가 데이터 -->
  </tbody>
</table>

<div class="buttons">
  <button class="edit-btn" onclick="editSelected()">수정</button>
  <button class="delete-btn" onclick="deleteSelected()">삭제</button>
</div>
 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
  </main>

<script>
  // 전체 선택
  document.getElementById('checkAll').addEventListener('change', function () {
    const checked = this.checked;
    document.querySelectorAll('.row-check').forEach(cb => cb.checked = checked);
  });

  function getSelectedRows() {
    return Array.from(document.querySelectorAll('.row-check'))
      .map((cb, index) => cb.checked ? index : -1)
      .filter(index => index !== -1);
  }

  function editSelected() {
    const selected = getSelectedRows();
    if (selected.length !== 1) {
      alert("수정은 하나의 항목만 선택해주세요.");
      return;
    }
    alert(`수정할 항목 번호: ${selected[0] + 1}`);
    // 실제 수정 로직 연결 필요
  }

  function deleteSelected() {
    const selected = getSelectedRows();
    if (selected.length === 0) {
      alert("삭제할 항목을 선택해주세요.");
      return;
    }
    if (confirm(`${selected.length}개의 항목을 삭제하시겠습니까?`)) {
      alert("삭제 처리 완료 (실제 구현 필요)");
      // 실제 삭제 로직 연결 필요
    }
  }
</script>
  
  </div>
</body>
</html>