<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>극장 상세 페이지</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f0f0f5;
            font-family: 'Segoe UI', sans-serif;
        }

        main {
            width: 100%;
            max-width: 900px;
            padding: 30px 40px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .region-tabs,
        .info-tabs {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            margin-bottom: 20px;
        }

        .region-tabs button,
        .info-tabs button {
            padding: 8px 16px;
            border: none;
            background-color: #eee;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .region-tabs button.active,
        .info-tabs button.active {
            background-color: #2c3e50;
            color: white;
        }

        .branch-name {
            font-size: 1.6rem;
            font-weight: bold;
            background-color: #4b6584;
            color: white;
            padding: 12px 24px;
            border-radius: 6px;
            display: inline-block;
            margin-bottom: 20px;
        }

        .content-area {
            background-color: #fafafa;
            padding: 25px;
            border-radius: 8px;
            border: 1px solid #ddd;
            min-height: 250px;
        }

        @media screen and (max-width: 600px) {
            main {
                padding: 20px;
            }

            .branch-name {
                font-size: 1.3rem;s
                padding: 10px 16px;
            }
        }
    </style>
</head>
<body>
    <main>
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
    
    
    
        <!-- 지역 선택 -->
        <div class="region-tabs">

		<c:forEach var="list" items="${list2 }">
            <c:if test="${theaterDTO.theater_region eq list.theater_region }"  >
           		 <button class="active"><a href="${pageContext.request.contextPath}/theater/thtdetail2?name=${list.theater_region}">${list.theater_region}</a></button>
            </c:if>
            
            <c:if test="${theaterDTO.theater_region ne list.theater_region }"  >
            		<button><a href="${pageContext.request.contextPath}/theater/thtdetail2?name=${list.theater_region}">${list.theater_region}</a></button>
            </c:if>
            
    	</c:forEach>
        </div>

        <!-- 지점명 -->
        <div class="branch-name" id="branchName">${theaterDTO.theater_name }점</div>

        <!-- 정보 탭 -->
        <div class="info-tabs">
            <button class="active" data-tab="info">극장정보</button>
            <button data-tab="schedule">상영시간표</button>
            <button data-tab="price">관람료</button>
        </div>

        <!-- 출력 영역 -->
        <div class="content-area" id="contentArea">
            <p>지역:${theaterDTO.theater_region }</p>
            <p>지점:${theaterDTO.theater_name }</p>
        </div>
         <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
    </main>

     <script>
     var region = "${theaterDTO.region}";
     var name = "${theaterDTO.name}";
     var brand = "${theaterDTO.brand}";
     var code = "${theaterDTO.code}";
     const hasSessionData = ${not empty theaterDTO};
     if (hasSessionData == true) {
         document.getElementById("contentArea").innerHTML = 
             "<h2>" + region + " 지역 극장 정보</h2>" +
             "<p>극장 이름: " + name + "</p>" +
             "<p>브랜드: " + brand + "</p>";
     } 
     
     
     
     
     
     
      // true = 세션 있음
     
     
  // 탭 클릭 시 내용 변경
  document.querySelectorAll('.info-tabs button').forEach(button => {
    button.addEventListener('click', () => {
      document.querySelectorAll('.info-tabs button').forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      const tab = button.getAttribute('data-tab');
      const contentArea = document.getElementById('contentArea');

      // 세션이 없을 때만 출력 문구 적용
      if (!hasSessionData) {
        if (tab === 'info') {
          contentArea.innerHTML = '<p>극장 정보가 여기에 출력됩니다.</p>';
        } else if (tab === 'schedule') {
          contentArea.innerHTML = '<p>상영 시간표가 여기에 출력됩니다.</p>';
        } else if (tab === 'price') {
          contentArea.innerHTML = '<p>관람료 정보가 여기에 출력됩니다.</p>';
        }
      }
    });
  });

  // 지역 버튼 클릭 시
  document.querySelectorAll('.region-tabs button').forEach(button => {
    button.addEventListener('click', () => {
      document.querySelectorAll('.region-tabs button').forEach(btn => btn.classList.remove('active'));
      button.classList.add('active');

      const selectedRegion = button.textContent.trim();
      const branchName = document.getElementById('branchName');
      branchName.textContent = selectedRegion + ' 대표지점';

      // 세션 없을 때만 출력 영역 덮어쓰기
      if (!hasSessionData) {
        document.getElementById('contentArea').innerHTML =
          `<p>${selectedRegion} 대표지점 극장 정보가 여기에 출력됩니다.</p>`;
      }

      // 극장정보 탭으로 강제 전환
      document.querySelectorAll('.info-tabs button').forEach(btn => btn.classList.remove('active'));
      document.querySelector('.info-tabs button[data-tab="info"]').classList.add('active');
    });
  });
</script>
</html>