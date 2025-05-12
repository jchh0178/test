<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrap-movie-detail" id="select_main">

		<!--
<div class="tit-heading-wrap">
    <h3>영화상세</h3>
</div>
    //-->
    <!-- Header -->
    <%@ include file="../main/header.jsp" %>


		<div class="sect-base-movie">
			<h3>
				<strong> 영화 1</strong>기본정보
			</h3>
			<div class="box-image">
				<a
					href="####"
					title="포스터 크게 보기 새창" target="_blank"> <span class="thumb-image">
						<img class="poster"
						src="###"
						alt=" 영화1 포스터"> <span class="ico-posterdetail">포스터	크게 보기</span> 
						<i class="cgvIcon etc age15">15세이상관람가</i>
				</span>
				</a>
			</div>
			<div class="box-contents">
				<div class="movieTitle title">
					<strong id="movieTitle" data-Title=" 영화 1">영화 1
					</strong> <em class="round lightblue">
					<span>현재상영중</span></em>
					<p>Eng_영화1</p>
				</div>
				<div class="score">
					<strong class="percent">예매율&nbsp;<span>###</span></strong>
					<!-- 2020.05.07 개봉전 프리에그 노출, 개봉후 골든에그지수 노출변경 -->
					<!--             <div class="egg-gage small"> -->
					<!-- 		    	<span class="sprite_preegg default"></span> -->
					<!-- 				<span class="percent">99%</span> -->
					<!-- 			</div> -->
				</div>
				<div class="spec">
					<dl>
						<dt>감독 :&nbsp;</dt>
						<dd>
							<span>###</span>
						</dd>

						<dt>&nbsp;/ 배우 :&nbsp;</dt>
						<dd class="on">
							<!-- 배우페이지를 별개로 설계하게 된다면 주소를 따로 지정할 방법이 필요해서 for문으로 반복 삽입 -->
							<span>###,###,###</span>
						</dd>
						<dt>장르&nbsp;:&nbsp;</dt>
						<!-- 동일한 장르로 영화를 찾아줄 페이지를 설계하게 된다면 위처럼 forEach문 사용 -->
						<dd class="genre">###</dd>
						<dt>&nbsp;/ 기본 정보 :&nbsp;</dt>
						<!-- 2023.04.27 영화상세 등급 표기 수정-->
						<!--<dd class="on">18,&nbsp;상영시간,&nbsp;국가</dd>-->
						<dd class="on">##세이상관람가, &nbsp;##분,&nbsp;###</dd>
						<dt>개봉 :&nbsp;</dt>
						<dd class="on releaseDate">###</dd>

						
<!-- 						OST찾아 듣게끔 만약 넣을거면 Youtube 링크로 넣고 아니면 삭제 -->
						<dt>OST&nbsp;:&nbsp;</dt>
						<dd>


							<a href="https://www.youtube.com/watch?v=RC9Rna4nrpw"> ##</a> / 
							<a	href="https://www.youtube.com/watch?v=azgvyl74qto"> ##</a> /
							 <a href="https://www.youtube.com/watch?v=984XtIflkV0">## </a>

						</dd>

					</dl>
				</div>

				<!-- 	프리에그 -> 찜 기능? -->
				<!--         <span class="screentype"> -->
				<!--                 <a href="#" class="imax" title="IMAX 상세정보 바로가기" data-regioncode="07">IMAX</a> -->
				<!--         </span> -->
				<span class="like"> <!--             2020.05.07 영화찜하기 -> 프리에그 선택 변경(조회하여 노출) -->
					<a id="bookmark" class="link-count favor"
					href="javascript:void (0);"><i class="sprite_preegg btn_md "></i>찜하기</a>
					<a class="link-reservation" href="/teamproject/ticket?num=62">예매</a>
				</span>
			</div>
		</div>

		<div class="cols-content" id="menu">
			<div class="col-detail">
				<ul class="tab-menu">
					<li class="on"><a href="javascript:void(0)" class="movieInfo">주요정보</a></li>
					<li><a href="javascript:void(0)" class="movieTrailer">트레일러</a></li>
					<li><a href="javascript:void(0)" class="movieStillCut">스틸컷</a></li>
					<li><a href="javascript:void(0)" class="movieReview">평점/리뷰</a></li>
					<li><a class="runningTime" href="javascript:void(0)">상영시간표</a></li>
				</ul>
				<div class="sect-story-movie" id="sect-story-movie"></div>
			</div>
		</div>

				<!-- .sect-graph 성별연령 -->
				<div id="ctl00_PlaceHolderContent_Section_Chart"
					class="sect-graph sect-graph-emotion"
					style="width: 800px; height: 260px">
					<ul class="graph">
						<li class="gender_graph"
							style="width: 50%; height: 270px; border-right: 1px solid #cccccc;">
							<strong>성별 예매 분포</strong>
							<canvas id="gender" style="display: block;" width="400"
								height="200"></canvas> <!-- 						<span hidden="gender">남, 여</span> -->


							<span hidden=""> 60.0, 40.0 </span>
				
						</li>
						<li class="age_grapth" style="width: 50%; height: 270px;"><strong>연령별
								예매 분포</strong> <!--                         차트영역 --> <!--                         DB 작성 후 매퍼에서 임시 테이블 만들어서 성비 계산후 변수로 삽입 -->
							<div
								style="width: 100%; height: 200px; padding: 0; display: flex; justify-content: center; align-items: flex-end;">
								<div class="bar"
									style="background-color: #3A3735; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
									<span class="age">청소년</span> <span class="percent">30.0</span>
								</div>
								<div class="bar"
									style="background-color: #A8684C; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
									<span class="age">20대</span> <span class="percent">50.0</span>
								</div>
								<div class="bar"
									style="background-color: #173F3F; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
									<span class="age">30대</span> <span class="percent">20.0</span>
								</div>
								<div class="bar"
									style="background-color: #808080; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
									<span class="age">40대</span> <span class="percent">0.0</span>
								</div>
								<div class="bar"
									style="background-color: #80565A; transition: all 1s linear; box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);">
									<span class="age">50세이상</span> <span class="percent">0.0</span>
								</div>
							</div></li>
						<!-- 연령별 차트 종료 -->
					</ul>
				</div>
				
					<div class="chart_total" style="position: relative;">
						<div class="title"
							style="position: absolute; top: -15px; left: -10px;">매력 포인트</div>
						<div class="box"
							style="width: 50%; height: 100%; display: flex; justify-content: center; align-items: center;">
							<canvas id="charm"
								data-charm='{"감독연출": "0", "OST":"0", "스토리":"0", "배우연기":"0", "영상미":"0"}'></canvas>
						</div>
						<div class="title"
							style="position: absolute; top: -15px; left: 49%;">감정 포인트</div>
						<div class="box"
							style="width: 50%; height: 100%; display: flex; justify-content: center; align-items: center;">
							<canvas id="emotion"
								data-emotion='{"스트레스해소": "0", "감동":"0", "몰입감":"0", "즐거움":"0", "긴장감":"0"}'></canvas>
						</div>
					</div>
				</div>

				<div class="real-rating">
					<p class="title">관람일 포함 7일 이내에 관람평을 남기실 수 있습니다.</p>
					<p class="desc">
						현재 <span><em>0</em> 명의 실관람객이 평가해주셨습니다.</span>
					</p>
					<div class="wrap_btn">
						<a class="link-gradewrite" href="javascript:void(0);"><span>평점작성</span></a>
						<a class="link-reviewwrite" href="javascript:void(0);"><span>내평점</span></a>
					</div>
				</div>
				<!-- //preegg.css 연관 UI -->
				<ul class="sort" id="sortTab">
					<li class="sortTab on" value="most"><a
						href="javascript:void(0);" class="most">최신순<span
							class="arrow-down"></span></a></li>
					<li class="sortTab" value="recom"><a
						href="javascript:void(0);" class="recom">추천순<span
							class="arrow-down"></span></a></li>
				</ul>
						 <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
				
</body>
</html>