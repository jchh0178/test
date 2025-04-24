<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>리뷰 작성하기</title>
  <style>
    body {
      font-family: 'Malgun Gothic', sans-serif;
      background-color: #f9f9f9;
    }

    .popup-container {
      width: 340px;
      margin: 100px auto;
      border: 1px solid #ccc;
      background-color: #f0f0f0;
      padding: 20px;
      box-shadow: 2px 2px 8px rgba(0, 0, 0, 0.2);
      text-align: center;
    }

    .popup-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      font-weight: bold;
      font-size: 16px;
      margin-bottom: 20px;
      border-bottom: 1px solid #999;
      padding-bottom: 8px;
    }

    .popup-header button {
      background: none;
      border: none;
      font-size: 16px;
      cursor: pointer;
    }

    .form-group {
      margin-bottom: 15px;
      font-size: 14px;
    }

    .form-group label {
      display: block;
      margin-bottom: 6px;
      font-weight: bold;
    }

    .form-group select,
    .form-group textarea {
      width: 100%;
      padding: 6px;
      font-size: 13px;
    }

    .radio-group,
    .checkbox-group {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 10px;
      margin-top: 8px;
      font-size: 13px;
    }

    .button-group {
      text-align: center;
      margin-top: 20px;
    }

    .button-group button {
      padding: 6px 16px;
      font-size: 13px;
      margin: 0 6px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <div class="popup-container">
    <div class="popup-header">
      리뷰 작성하기
      <button onclick="window.close()">×</button>
    </div>

    <div class="form-group">
      <label>“영화명”<br>영화 어떠셨나요?</label>
    </div>

    <div class="form-group">
      <label for="score">평점</label>
      <select id="score" name="score">
        <option>10점</option>
        <option>9점</option>
        <option>8점</option>
        <option>7점</option>
        <option>6점</option>
        <option>5점</option>
        <option>4점</option>
        <option>3점</option>
        <option>2점</option>
        <option>1점</option>
      </select>
    </div>

<!--     <div class="form-group"> -->
<!--       <label>영화에 대한 평가는?</label> -->
<!--       <div class="radio-group"> -->
<!--         <label><input type="radio" name="opinion" value="good"> 긍정적이다</label> -->
<!--         <label><input type="radio" name="opinion" value="bad"> 부정적이다</label> -->
<!--       </div> -->
<!--     </div> -->

    <div class="form-group">
      <label>관람 포인트는 무엇인가요?</label>
      <div class="checkbox-group">
        <label><input type="checkbox"> 연출</label>
        <label><input type="checkbox"> 스토리</label>
        <label><input type="checkbox"> 영상미</label>
        <label><input type="checkbox"> 배우</label>
        <label><input type="checkbox"> OST</label>
      </div>
    </div>

    <div class="form-group">
      <label for="comment">실관람평을 남겨주세요.</label>
      <textarea id="comment" rows="4"></textarea>
    </div>

    <div class="button-group">
      <button type="submit">작성</button>
      <button type="button" onclick="window.close()">취소</button>
    </div>
  </div>
</body>
</html>