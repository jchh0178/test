<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>상영 스케줄 등록</title>
    <style>
        .container {
            display: flex;
        }
        .sidebar {
            width: 250px;
            flex-shrink: 0;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        label { display: inline-block; width: 120px; margin: 6px 0; }
        input, select, textarea { margin: 6px 0; width: 200px; }
        table { border-collapse: collapse; margin-top: 20px; width: 100%; }
        th, td { border: 1px solid #aaa; padding: 8px; text-align: center; }
    </style>
</head>
<body>

<!-- Header -->
<%@ include file="../main/header.jsp" %>

<div class="container">
    <div class="sidebar">
        <%@ include file="admin_menu.jsp" %>
    </div>

    <div class="content">
        <h2>상영 스케줄 등록</h2>

        <form action="${pageContext.request.contextPath}/admin/screenAddPro" method="post">
            <label>영화</label>
            <select name="movie_id">
                <option>-- 영화 선택 --</option>
                <c:forEach var="movie" items="${movieList}">
                    <option value="${movie.movie_id}">${movie.movie_name_kr}</option>
                </c:forEach>
            </select><br/>

            <label>극장</label>
            <select name="theater_id">
                <option>-- 극장 선택 --</option>
                <c:forEach var="theater" items="${theaterList}">
                    <option value="${theater.theater_id}">${theater.theater_name}</option>
                </c:forEach>
            </select><br/>

            <label>상영관</label>
            <select name="room_id">
                <option>-- 상영관 선택 --</option>
                <c:forEach var="room" items="${roomList}">
                    <option value="${room.room_id}">${room.room_name}</option>
                </c:forEach>
            </select><br/>

            <label>상영 날짜</label>
            <input type="date" name="screen_date"/><br/>

            <label>시작 시간</label>
            <input type="datetime-local" name="screen_start_time"/><br/>

            <label>종료 시간</label>
            <input type="datetime-local" name="screen_end_time"/><br/>

            <button type="submit">등록</button>
        </form>

        <h3>등록된 스케줄</h3>
        <table>
            <thead>
                <tr>
                    <th>영화</th>
                    <th>극장</th>
                    <th>상영관</th>
                    <th>상영날짜</th>
                    <th>시작시간</th>
                    <th>종료시간</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="screen" items="${screenList}">
                    <tr>
                        <td>${screen.movie_name_kr}</td>
                        <td>${screen.theater_name}</td>
                        <td>${screen.room_name}</td>
                        <td>${screen.screen_date}</td>
                        <td>${screen.screen_start_time}</td>
                        <td>${screen.screen_end_time}</td>
                        <td><a href="screenDelete?screen_id=${screen.screen_id}">삭제</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<%@ include file="../main/footer.jsp" %>

</body>
</html>