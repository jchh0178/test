<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>극장 메인 페이지</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      background-color: #f0f2f5;
      margin: 0;
      padding: 0;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }

    main {
      width: 100%;
      max-width: 1000px;
      background-color: white;
      padding: 30px 40px;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
      overflow-y: auto;
      max-height: 90vh;
    }

    h2 {
      font-size: 1.5rem;
      margin-bottom: 10px;
    }

    .region-tabs {
      display: flex;
      gap: 10px;
      margin-bottom: 10px;
      flex-wrap: wrap;
    }

    .region-tabs button {
      padding: 8px 16px;
      background-color: #eee;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .region-tabs button.active {
      background-color: #444;
      color: white;
    }

    .region-theaters {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      margin-bottom: 20px;
    }

    .region-theaters ul {
      list-style: none;
      padding: 0;
      min-width: 180px;
    }

    .region-theaters li {
      padding: 5px 0;
      cursor: pointer;
      transition: background-color 0.2s;
    }

    .region-theaters li:hover {
      background-color: #eee;
    }

    .favorite-theater {
      margin-bottom: 40px;
      background-color: #f0f0f0;
      padding: 12px;
      border-radius: 6px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .login-button {
      padding: 6px 12px;
      background-color: #4a90e2;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    .notice-section {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.05);
    }

    .notice-table {
      width: 100%;
      border-collapse: collapse;
    }

    .notice-table thead {
      background-color: #ddd;
    }

    .notice-table th, .notice-table td {
      text-align: left;
      padding: 10px;
      border-bottom: 1px solid #ccc;
    }

    .notice-table tr:hover {
      background-color: #f5f5f5;
    }
  </style>
</head>
<body>
  <main>
      <!-- Header -->
    <%@ include file="../main/header.jsp" %>
  
    <section class="theater-section">
      <h2>전체극장</h2>
      <nav class="region-tabs">
        <button class="active">서울</button>
        <button>경기</button>
        <button>인천</button>
        <button>대전/충청/세종</button>
        <button>부산/대구/경상</button>
        <button>강원</button>
        <button>제주</button>
      </nav>
      <div class="region-theaters">
        <ul>
          <li>강남</li>
          <li>동대문</li>
          <li>상봉프라임경기장</li>
          <li>신촌</li>
          <li>은평</li>
          <li>화곡</li>
        </ul>
        <ul>
          <li>강릉</li>
          <li>마석</li>
          <li>의정부</li>
          <li>이수</li>
        </ul>
        <ul>
          <li>군자</li>
          <li>송도</li>
          <li>센터돔</li>
          <li>ARTNINE</li>
        </ul>
        <ul>
          <li>더 부티크 용산타워</li>
          <li>상봉</li>
          <li>송파파크하비오</li>
          <li>코엑스</li>
        </ul>
      </div>
      <div class="favorite-theater">
        <span>나의 선호극장 정보</span>
        <button class="login-button">로그인하기</button>
      </div>
    </section>

    <section class="notice-section">
      <h2>극장 공지사항</h2>
      <table class="notice-table">
        <thead>
          <tr>
            <th>극장</th>
            <th>제목</th>
            <th>지역</th>
            <th>등록일</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>강릉(휴점)</td>
            <td>[강릉점] 임시 휴관 안내 (2025년 04월 05일부터)</td>
            <td>부산/대구/경상</td>
            <td>2025.04.04</td>
          </tr>
          <tr>
            <td>상봉프라임경기장</td>
            <td>[상봉프라임경기장] 25년 3월 상봉프라임경기장 휴무 행사로 인한 주차 안내</td>
            <td>서울</td>
            <td>2025.03.29</td>
          </tr>
          <tr>
            <td>코엑스</td>
            <td>[코엑스] 시사회 진행에 따른 고객 안내</td>
            <td>서울</td>
            <td>2025.03.21</td>
          </tr>
          <tr>
            <td>신촌</td>
            <td>[신촌] 상영관 리뉴얼에 따른 안내</td>
            <td>서울</td>
            <td>2025.03.07</td>
          </tr>
          <tr>
            <td>성수</td>
            <td>[성수] 영화제 진행에 따른 고객 안내 (3/7 ~ 3/9)</td>
            <td>서울</td>
            <td>2025.03.04</td>
          </tr>
        </tbody>
      </table>
    </section>
   <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
  </main>

  <script>
    let isLoggedIn = false;

    const theaterData = {
      '서울': ['강남', '동대문', '상봉프라임경기장', '신촌', '은평', '화곡'],
      '경기': ['수원', '고양', '용인', '의정부'],
      '인천': ['부평', '송도', '계양'],
      '대전/충청/세종': ['대전', '청주', '세종'],
      '부산/대구/경상': ['부산', '대구', '울산'],
      '강원': ['강릉', '원주'],
      '제주': ['제주시', '서귀포시']
    };

    document.querySelectorAll('.region-tabs button').forEach(button => {
      button.addEventListener('click', () => {
        document.querySelectorAll('.region-tabs button').forEach(btn => btn.classList.remove('active'));
        button.classList.add('active');

        const selectedRegion = button.textContent.trim();
        const theaterList = theaterData[selectedRegion] || [];

        const regionContainer = document.querySelector('.region-theaters');
        regionContainer.innerHTML = '';

        const chunkSize = 4;
        for (let i = 0; i < theaterList.length; i += chunkSize) {
          const ul = document.createElement('ul');
          const chunk = theaterList.slice(i, i + chunkSize);
          chunk.forEach(theater => {
            const li = document.createElement('li');
            li.textContent = theater;
            ul.appendChild(li);
          });
          regionContainer.appendChild(ul);
        }
      });
    });

    document.querySelector('.login-button').addEventListener('click', () => {
      if (!isLoggedIn) {
        location.href = '${pageContext.request.contextPath}/login/login';
      } else {
        alert('선호 극장 정보를 표시합니다.');
      }
    });
  </script>
</body>
</html>