<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>분실물 문의 내역</title>
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

        .mypage-content {
            flex: 1;
            padding: 40px;
        }

        .inquiry-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
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

        .inquiry-desc {
            margin: 10px 0 20px;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            border: 1px solid #ddd;
            text-align: center;
            padding: 10px;
        }

        th {
            background-color: #f7f7f7;
        }

        .status-complete {
            color: green;
            font-weight: bold;
        }

        .status-pending {
            color: red;
            font-weight: bold;
        }

        .btn-delete {
            padding: 5px 10px;
            background-color: #eee;
            border: 1px solid #ccc;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="mypage-wrapper">
    <%@ include file="mypage_menu.jsp" %>

    <div class="mypage-content">
        <!-- Header -->
    <%@ include file="../main/header.jsp" %>
    
        <div class="inquiry-title">문의 내역</div>

        
        <div class="tab-menu">
	        <div>챗봇</div>
	        <div>1:1 문의 내역</div>
	        <div class="active">분실물 문의 내역</div>
     	 </div>

        <div class="inquiry-desc">고객센터를 통해 남기신 분실물 문의내역을 확인할 수 있습니다.</div>

        <table>
            <thead>
                <tr>
                    <th>글번호</th>
                    <th>극장</th>
                    <th>분실물 내용</th>
                    <th>등록일</th>
                    <th>답변상태</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>부산 동래</td>
                    <td>에어팟 오른쪽</td>
                    <td>2025.03.28</td>
                    <td class="status-complete">답변완료</td>
                    <td><button class="btn-delete">삭제</button></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>부산 서면</td>
                    <td>라이언 팔꿈치</td>
                    <td>2025.04.02</td>
                    <td class="status-pending">미완료</td>
                    <td><button class="btn-delete">삭제</button></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>부산 서면</td>
                    <td>텀블러</td>
                    <td>2025.04.04</td>
                    <td class="status-pending">미완료</td>
                    <td><button class="btn-delete">삭제</button></td>
                </tr>
            </tbody>
        </table>
            <!-- Header -->
    <%@ include file="../main/header.jsp" %>
        
    </div>
</div>
</body>
</html>
