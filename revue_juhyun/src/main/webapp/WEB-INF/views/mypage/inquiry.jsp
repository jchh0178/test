<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>문의 내역</title>
  <style>
    body {
      font-family: '맑은 고딕', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #fff;
    }

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
      margin-bottom: 20px;
    }

    .mypage-menu {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .mypage-menu li {
      margin-bottom: 12px;
    }

    .mypage-menu li {
      padding: 8px 16px;
      color: #333;
    }

    .mypage-menu li.on {
      background-color: #ffe9e9;
      font-weight: bold;
      color: #d50000;
      border-left: 5px solid #d50000;
    }

    .mypage-content {
      flex: 1;
      padding: 30px;
    }

    .tab-menu {
      display: flex;
      margin-bottom: 10px;
      border-bottom: 2px solid #ddd;
    }

    .tab-menu div {
      padding: 10px 20px;
      cursor: pointer;
      background-color: #f9f9f9;
    }

    .tab-menu .active {
      background-color: #fff5e6;
      border-bottom: 2px solid #d32f2f;
      font-weight: bold;
      color: #d32f2f;
    }

    .notice {
      margin-bottom: 20px;
      font-size: 14px;
      color: #555;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 10px;
      text-align: center;
      font-size: 14px;
    }

    th {
      background-color: #f0f0f0;
    }

    .answered {
      color: green;
      font-weight: bold;
    }

    .pending {
      color: red;
      font-weight: bold;
    }
  </style>
</head>
<body>
  <div class="mypage-wrapper">
       <%@ include file="mypage_menu.jsp" %>

    <div class="mypage-content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <h2>문의 내역</h2>

     <div class="tab-menu">
	        <div>챗봇</div>
	        <div class="active">1:1 문의 내역</div>
	        <div>분실물 문의 내역</div>
     	 </div>

      <div class="notice">고객센터를 통해 남기신 1:1 문의내역을 확인할 수 있습니다.</div>

      <table>
        <thead>
          <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>등록일</th>
            <th>답변상태</th>
            <th>삭제</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>3월 24일에 동래에서 영화 봤는데요...</td>
            <td>2025.03.28</td>
            <td class="answered">답변완료</td>
            <td><button>삭제</button></td>
          </tr>
          <tr>
            <td>2</td>
            <td>혹시 라라랜드 재개봉 안하나요?</td>
            <td>2025.03.24</td>
            <td class="pending">미완료</td>
            <td><button>삭제</button></td>
          </tr>
        </tbody>
      </table>
    <!-- Header -->
    <%@ include file="../main/footer.jsp" %>

    </div>
  </div>

<script>
function showModal() {
  document.getElementById("deleteModal").style.display = "flex";
}
function closeModal() {
  document.getElementById("deleteModal").style.display = "none";
}
function confirmDelete() {
  alert("삭제되었습니다 (임시)");
  closeModal();
  // 실제 삭제 처리 코드는 여기에 작성
}
</script>
</body>
</html>
