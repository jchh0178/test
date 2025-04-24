<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>리뷰 관리</title>
<style type="text/css">
  body {
  font-family: 'Arial', sans-serif;
  margin: 0;
  background-color: #f9f9f9;
}

.container {
  display: flex;
}


main.content {
  flex: 1;
  padding: 20px;
  background-color: white;
}

.review-table {
  width: 100%;
  border-collapse: collapse;
  margin-bottom: 20px;
}

.review-table th, .review-table td {
  border: 1px solid #ccc;
  padding: 10px;
  text-align: center;
}

.review-table th {
  background-color: #f0f0f0;
}

.delete-btn {
  padding: 5px 10px;
  background-color: #e74c3c;
  color: white;
  border: none;
  cursor: pointer;
}

.delete-btn:hover {
  background-color: #c0392b;
}

.pagination {
  text-align: center;
  margin-top: 10px;
}

.pagination a {
  margin: 0 5px;
  padding: 5px 10px;
  text-decoration: none;
  background-color: #eee;
  color: #333;
}

.pagination a.active {
  background-color: #444;
  color: white;
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.5);
  display: none;
}

.modal-content {
  background-color: white;
  padding: 20px;
  width: 300px;
  margin: 15% auto;
  border-radius: 5px;
  text-align: center;
}

.delete-box {
  text-align: right;
  margin-bottom: 10px;
}
  
</style>
</head>
<body>
  <div class="container">
      <%@ include file="admin_menu.jsp" %>

    <main class="content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
      <h1>리뷰 관리</h1>
      <table class="review-table">
		<thead>
		  <tr>
		    <th><input type="checkbox" id="checkAll" onclick="toggleAll(this)"></th>
		    <th>No.</th>
		    <th>영화명</th>
		    <th>작성자</th>
		    <th>장르</th>
		    <th>등급</th>
		    <th>출연진</th>
		    <th>리뷰내용</th>
		    <th>긍정/부정</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
		    <td><input type="checkbox" class="row-check"></td>
		    <td>1</td>
		    <td>춘부</td>
		    <td>정보영</td>
		    <td>드라마</td>
		    <td>12세</td>
		    <td>홍길동</td>
		    <td>좋았어요</td>
		    <td>긍정</td>
		  </tr>
		</tbody>
		      </table>
		      
		<div class="delete-box">
		  <button class="delete-btn" onclick="confirmDelete()">삭제</button>
		</div>

      <div class="pagination">
        <a href="#">«</a>
        <a class="active" href="#">1</a>
        <a href="#">2</a>
        <a href="#">3</a>
        <a href="#">4</a>
        <a href="#">5</a>
        <a href="#">»</a>
      </div>
       <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </main>
  </div>

  <!-- 삭제 확인 모달 -->
  <div class="modal" id="confirmModal">
    <div class="modal-content">
      <p>리뷰를 삭제 하시겠습니까?</p>
      <button onclick="hideModal()">취소</button>
      <button onclick="deleteReview()">확인</button>
    </div>
  </div>

  <!-- <script>
    function confirmDelete() {
      document.getElementById("confirmModal").style.display = "block";
    }
    function hideModal() {
      document.getElementById("confirmModal").style.display = "none";
    }
    function deleteReview() {
      hideModal();
      alert("삭제 완료되었습니다.");
    }
  </script> -->
</body>
</html>