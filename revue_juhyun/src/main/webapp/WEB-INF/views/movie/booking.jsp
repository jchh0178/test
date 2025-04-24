<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="section section-movie" style="border: 1px solid black;">
	    <!-- Header -->
    <%@ include file="../main/header.jsp" %>
	
		<!-- col-head -->
		<div class="col-head" id="skip_movie_list">
			<h3 class="sreader">영화</h3>
		</div>
		<!-- col-body -->
		<div class="col-body" style="height: 565px;">
			<!-- 영화선택 -->
			<div class="movie-select">
				<div class="tabmenu">
					<span class="side on"></span> <a href="#"
						class="button menu1 selected">전체</a> <span class="side on"></span>
				</div>
				<div class="sortmenu">
					<a href="#" id="movieSortRankBtn" class="button btn-rank selected">예매율순</a>
					<a href="#" id="movieSortNameBtn" class="button btn-abc">가나다순</a>

				</div>
				<div class="movie-list nano has-scrollbar has-scrollbar-y"
					id="movie_list">
					<ul class="content scroll-y" id="movie" tabindex="-1"
						style="right: -17px;">
					</ul>
					<div class="pane pane-y"
						style="display: block; opacity: 1; visibility: visible;">
						<div class="slider slider-y" id="slider"
							style="height: 50px; top: 0px;"></div>
					</div>
					<div class="pane pane-x"
						style="display: none; opacity: 1; visibility: visible;">
						<div class="slider slider-x" style="width: 50px;"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- THEATER 섹션 -->
	<div class="section section-theater" style="border: 1px solid black;">
		<!-- col-head -->
		<div class="col-head" id="skip_theater_list">
			<h3 class="sreader">극장</h3>

		</div>
		<!-- col-body -->
		<div class="col-body" style="height: 565px;">

			<!-- 극장선택 -->
			<div class="theater-select" style="height: 554px;">
				<div class="tabmenu">
					<span class="side on"></span> <a href="#"
						class="button menu1 selected">전체</a> <span class="side on"></span>
				</div>
				<div class="theater-list" style="height: 513px;">
					<div class="theater-area-list" id="theater_area_list">
						<ul>
							<li class="hidden" style="display: list-item;">
								<!-- 													th_region 들어가는곳  -->

								<div class="area_theater_list nano has-scrollbar">
									<ul class="content scroll-y" tabindex="-1"
										style="right: -17px;"></ul>
									<div class="pane pane-y"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-y" style="height: 50px;"></div>
									</div>
									<div class="pane pane-x"
										style="display: none; opacity: 1; visibility: visible;">
										<div class="slider slider-x" style="width: 50px;"></div>
									</div>
								</div>
							</li>

						</ul>
					</div>
					<div class="theater-cgv-list nano has-scrollbar"
						id="theater_cgv_list">
						<ul class="content scroll-y" id="theater" tabindex="-1"
							style="right: -17px;"></ul>
						<div class="pane pane-y"
							style="display: none; opacity: 1; visibility: visible;">
							<div class="slider slider-y" id="slider2" style="height: 50px;"></div>
						</div>
						<div class="pane pane-x"
							style="display: none; opacity: 1; visibility: visible;">
							<div class="slider slider-x" style="width: 50px;"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- DATE 섹션 -->
	<div class="section section-date" style="border: 1px solid black;">
		<div class="col-head" id="skip_date_list">
			<h3 class="sreader">날짜</h3>
			<a href="#" onclick="return false;" class="skip_to_something">날짜
				건너뛰기</a>
		</div>
		<div class="col-body" style="height: 565px;">
			<!-- 날짜선택 -->
			<div class="date-list nano has-scrollbar has-scrollbar-y"
				id="date_list">
				<ul class="content scroll-y" id="date" tabindex="-1"
					style="right: -17px;">
				</ul>
				<div class="pane pane-y"
					style="display: block; opacity: 1; visibility: visible;">
					<div class="slider slider-y" id="slider3"
						style="height: 50px; top: 0px;"></div>
				</div>
				<div class="pane pane-x"
					style="display: none; opacity: 1; visibility: visible;">
					<div class="slider slider-x" style="width: 50px;"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- TIME 섹션 -->
	<div class="section section-time" style="border: 1px solid black;">
		<div class="col-head" id="skip_time_list">
			<h3 class="sreader">시간</h3>
			<a href="#" class="skip_to_something"
				onclick="skipToSomething('tnb_step_btn_right');return false;">시간선택
				건너뛰기</a>
		</div>
		<div class="col-body" style="height: 565px;">
			<!-- 시간선택 -->
			<div class="time-option"></div>
			<div class="placeholder">영화, 극장, 날짜를 선택해주세요.</div>
			<div class="time-list nano has-scrollbar">

				<div id="Mtime" class="content scroll-y" tabindex="-1"
					style="right: -17px;"></div>
			</div>
		</div>
	</div>
	<!-- SEAT 섹션 -->
	<div class="section section-seat" style="border: 1px solid black;">
		<div class="col-head" id="skip_seat_list">
			<h3 class="sreader">
				인원 / 좌석 <span class="sreader">인원/좌석선택은 레이어로 서비스 되기 때문에 가상커서를
					해지(Ctrl+Shift+F12)한 후 사용합니다.</span>
			</h3>
			<a href="#" class="skip_to_something"
				onclick="skipToSomething('tnb_step_btn_right');return false;">인원/좌석선택
				건너뛰기</a>
		</div>
		<div class="col-body">
			<div class="person_screen">
				<!-- NUMBEROFPEOPLE 섹션 -->
				<div class="section section-numberofpeople">
					<div class="col-body">

						<!-- 인접좌석 -->
						<!-- <div class="adjacent_seat_wrap">
											<div class="adjacent_seat" id="adjacent_seat">
												<span class="title">좌석 붙임 설정</span>
												<div class="block_wrap">
													<span class="seat_block block1"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(1, this);" disabled><span class="box"></span><span class="sreader">1석 좌석붙임</span></label></span>
													<span class="seat_block block2"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(2, this);" disabled><span class="box"></span><span class="box"></span><span class="sreader">2석 좌석붙임</span></label></span>
													<span class="seat_block block3"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(3, this);" disabled><span class="box"></span><span class="box"></span><span class="box"></span><span class="sreader">3석 좌석붙임</span></label></span>
													<span class="seat_block block4"><label><input type="radio" name="adjacent_seat" onclick="ftSetAdjacentSeatSelector(4, this);" disabled><span class="box"></span><span class="box"></span><span class="box"></span><span class="box"></span><span class="sreader">4석 좌석붙임</span></label></span>
												</div>
											</div>
										</div> -->

						<div id="nopContainer" class="numberofpeople-select"
							style="min-width: 426px;">
							<!-- 2021.05.25 - 좌석 거리두기 -->
							<!-- 최대 선택 가능 인원 표기 -->
							<div id="maximum_people"
								style="padding-bottom: 5px; text-align: right; font-size: 11px !important; color: red;"></div>
							<div class="group adult" id="nop_group_adult">
								<span class="title">일반</span>
								<ul>
									<li data-count="0" class="selected"><a href="#"
										onclick="return false;"><span class="sreader mod">일반</span>0<span
											class="sreader">명</span></a></li>
									<li data-count="1"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>1<span class="sreader">명</span></a></li>
									<li data-count="2"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>2<span class="sreader">명</span></a></li>
									<li data-count="3"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>3<span class="sreader">명</span></a></li>
									<li data-count="4"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>4<span class="sreader">명</span></a></li>
									<li data-count="5"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>5<span class="sreader">명</span></a></li>
									<li data-count="6"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>6<span class="sreader">명</span></a></li>
									<li data-count="7"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>7<span class="sreader">명</span></a></li>
									<li data-count="8"><a href="#" onclick="return false;"><span
											class="sreader mod">일반</span>8<span class="sreader">명</span></a></li>
								</ul>
							</div>
							<div class="group youth" id="nop_group_youth">
								<span class="title">청소년</span>
								<ul>
									<li data-count="0" class="selected"><a href="#"
										onclick="return false;"><span class="sreader mod">청소년</span>0<span
											class="sreader">명</span></a></li>
									<li data-count="1"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>1<span class="sreader">명</span></a></li>
									<li data-count="2"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>2<span class="sreader">명</span></a></li>
									<li data-count="3"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>3<span class="sreader">명</span></a></li>
									<li data-count="4"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>4<span class="sreader">명</span></a></li>
									<li data-count="5"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>5<span class="sreader">명</span></a></li>
									<li data-count="6"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>6<span class="sreader">명</span></a></li>
									<li data-count="7"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>7<span class="sreader">명</span></a></li>
									<li data-count="8"><a href="#" onclick="return false;"><span
											class="sreader mod">청소년</span>8<span class="sreader">명</span></a></li>
								</ul>
							</div>
							<div class="group child" id="nop_group_child">
								<span class="title">어린이</span>
								<ul>
									<li data-count="0" class="selected"><a href="#"
										onclick="return false;"><span class="sreader mod">어린이</span>0<span
											class="sreader">명</span></a></li>
									<li data-count="1"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>1<span class="sreader">명</span></a></li>
									<li data-count="2"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>2<span class="sreader">명</span></a></li>
									<li data-count="3"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>3<span class="sreader">명</span></a></li>
									<li data-count="4"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>4<span class="sreader">명</span></a></li>
									<li data-count="5"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>5<span class="sreader">명</span></a></li>
									<li data-count="6"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>6<span class="sreader">명</span></a></li>
									<li data-count="7"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>7<span class="sreader">명</span></a></li>
									<li data-count="8"><a href="#" onclick="return false;"><span
											class="sreader mod">어린이</span>8<span class="sreader">명</span></a></li>
								</ul>
							</div>
						</div>
					</div>
					 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
				</div>
</body>
</html>