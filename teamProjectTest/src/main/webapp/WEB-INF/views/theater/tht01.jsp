<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            margin-bottom: 20px;
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

        .district-list {
            display: none; /* Initially hide all district lists */
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 10px;
        }

        .district-list.active {
            display: flex;
        }

        .district-item {
            padding: 8px 16px;
            background-color: transparent; /* 배경색 투명하게 */
            border: none; /* 테두리 제거 */
            border-radius: 0; /* 둥근 테두리 제거 */
            cursor: pointer;
            font-size: 1em; /* 텍스트 크기 조정 (필요에 따라) */
            color: #333; /* 텍스트 색상 (필요에 따라) */
            text-decoration: none; /* 링크 밑줄 제거 */
        }

        .district-item:hover {
            background-color: #eee; /* 호버 시 배경색 변경 (선택 사항) */
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
        <%@ include file="../main/header.jsp" %>

        <section class="theater-section">
            <h2>전체극장</h2>
            <nav class="region-tabs">
          
            
                <button class="active" data-region="서울">서울</button>
                <button data-region="경기">경기</button>
                <button data-region="인천">인천</button>
                <button data-region="강원">강원</button>
                <button data-region="대전충청">대전/충청</button>
                <button data-region="대구">대구</button>
                <button data-region="부산울산">부산/울산</button>
                <button data-region="경상">경상</button>
                <button data-region="광주전라제주">광주/전라/제주</button>
            </nav>

			 <c:forEach var="theaterDTO" items="${theaterList }">
				<div class="district-list <c:if test='${theaterDTO.region == "서울" }'> active </c:if>" data-region="${theaterDTO.region }">
			 		<a href="${pageContext.request.contextPath}/theater/thtdetail?name=${theaterDTO.name}" class="district-item">${theaterDTO.name}</a>
 				</div>
			 </c:forEach>
			 <!-- 
 			<div class="district-list active" data-region="서울">
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=강남" class="district-item">강남</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=종로/중구" class="district-item">종로/중구</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=동대문" class="district-item">동대문</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=은평" class="district-item">은평</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=화곡" class="district-item">화곡</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=상봉프라임경기장" class="district-item">상봉프라임경기장</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=신촌" class="district-item">신촌</a>
            </div>

            <div class="district-list" data-region="경기">
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=수원" class="district-item">수원</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=고양" class="district-item">고양</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=용인" class="district-item">용인</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=의정부" class="district-item">의정부</a>
            </div>

            <div class="district-list" data-region="인천">
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=부평" class="district-item">부평</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=송도" class="district-item">송도</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=계양" class="district-item">계양</a>
            </div>

            <div class="district-list" data-region="대전/충청/세종">
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=대전" class="district-item">대전</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=청주" class="district-item">청주</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=세종" class="district-item">세종</a>
            </div>

            <div class="district-list" data-region="부산/대구/경상">
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=부산" class="district-item">부산</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=대구" class="district-item">대구</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=울산" class="district-item">울산</a>
            </div>

            <div class="district-list" data-region="강원">
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=강릉" class="district-item">강릉</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=원주" class="district-item">원주</a>
            </div>

            <div class="district-list" data-region="제주">
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=제주시" class="district-item">제주시</a>
                <a href="${pageContext.request.contextPath}/theater/thtdetail?name=서귀포시" class="district-item">서귀포시</a>
            </div>
             -->
            <div class="favorite-theater">
                <span>나의 선호극장 정보</span>
                <button class="login-button">로그인하기</button>
            </div>
            
            
        </section>


			<!--  각 지점 공지 게시판 -->
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
        <%@ include file="../main/footer.jsp" %>
    </main>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const regionTabs = document.querySelectorAll('.region-tabs button');
            const districtLists = document.querySelectorAll('.district-list');

            // 초기 로딩 시 서울 지역구 목록 활성화
            districtLists.forEach(list => {
                list.classList.remove('active');
                if (list.dataset.region === '서울') {
                    list.classList.add('active');
                }
            });

            regionTabs.forEach(tab => {
                tab.addEventListener('click', () => {
                    // 지역 탭 활성화 처리
                    regionTabs.forEach(btn => btn.classList.remove('active'));
                    tab.classList.add('active');

                    const selectedRegion = tab.dataset.region;

                    // 해당 지역구 목록만 표시
                    districtLists.forEach(list => {
                        list.classList.remove('active');
                        if (list.dataset.region === selectedRegion) {
                            list.classList.add('active');
                        }
                    });
                });
            });
        });

        let isLoggedIn = false;
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