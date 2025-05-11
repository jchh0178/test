<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>극장 메인 페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
        <%@ include file="../main/header.jsp" %>

    <main>
    
    
    
    <hr style="color:red">
    
        <div class="sect-common">
    <div class="favorite-wrap">
        <div class="sect-favorite">
            <h4 style="z-index: 999; font-size: 24px; color: white; font-weight: 900; top: 20px;"><i id="fav_theater">자주가는 극장</i></h4>
            <ul id="favoriteTheaters">
	           	
	           	
					<li>
						<a href="javascript:void(0)" data-th="">
							<span>1</span>
							<em>
								
							</em>
						</a>
					</li>
				
	           	
					<li>
						<a href="javascript:void(0)" data-th="">
							<span>2</span>
							<em>
								
							</em>
						</a>
					</li>
				
	           	
					<li>
						<a href="javascript:void(0)" data-th="">
							<span>3</span>
							<em>
								
							</em>
						</a>
					</li>
				
	           	
					<li>
						<a href="javascript:void(0)" data-th="">
							<span>4</span>
							<em>
								
							</em>
						</a>
					</li>
				
	           	
					<li>
						<a href="javascript:void(0)" data-th="">
							<span>5</span>
							<em>
								
							</em>
						</a>
					</li>
				
            </ul>
            <button id="btn_set_my_favorite" type="button" title="새창">자주가는 극장 설정</button>
        </div>
        
<script type="text/javascript">
// let sessionId;

// $(function() {
// 	$('#favoriteTheaters a').on('click', function() {
// 		$('.sect-city').find('li').removeClass('on');
// 		document.getElementById('wrapEvent').scrollIntoView({ behavior: 'smooth' });
//         var dataTh = $(this).data('th');
//         $('.area-link').trigger('click', [dataTh, ]);
//         $('#ulcontent>li').removeClass('on');
// 	});
// });



</script>
        <div class="sect-city" style="display: flex; height: auto">
	        <ul>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">서울</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">인천</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">경기</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">부산울산</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">대전충청</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">광주전라제주</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">경상</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">강원</a>
				</li>
			
				<li class="">
					<a href="javascript:void(0)" class="theater_region">대구</a>
				</li>
			
			
			<!-- 지역 눌렀을때 생성 되는 부분 -->
	        </ul>
	          <div class="area" style="position:absolute; top: 220px;">
				<ul id="ulcontent">
				
	        	 </ul>
	       	 </div>
	      
			           
			
        </div>
    </div>
</div>
<script type="text/javascript">


let region;
$(function() {
	// 특정 지역 선택시 극장을 띄우기 위해 사용 
	$('.theater_region').on('click', function() {
		region = $(this).text();
		$('.sect-city li').removeClass();
		$(this).parent('li').addClass('on');
		
		$.ajax({
			type : 'get',
			url : "${pageContext.request.contextPath}/theater/ajaxList",
			data : {'theater_region': region},
			dataType: 'json',
			success: function(areaList) {
				console.log("areaList", areaList);

				$('#ulcontent').html('');
				
				areaList.forEach(function(area) {
					console.log("area", area);
					console.log("area.theater_name", "${area.theater_name}");
					var text =
						"<li>" +
		                    "<a style='padding: 0 5px;' href='javascript:void(0);' class='theater_name' title='${area.theater_name}'>" +
		                    "ID: " + area.theater_id + area.theater_name +

			                "</a>" +
			            "</li>"
			            ;
		            $('.txt-info').html(area.theater_name);
					$('#ulcontent').append(text);	
				});
				
				$('.area-link:first').trigger('click');
			},
			error: function() {
				alert('오류')
			}
		});
	});
})

</script>
      
<!-- 실컨텐츠 시작 -->
<div class="wrap-theater">
    <h3><img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="THEATER" /></h3>
    <!-- 여의도 CINE SHOP 운영 종료에 따른 홈페이지 수정 요청의 件(CGVITSM-14364) -->
    <!--<div class="sect-theater ">-->
    <div class="sect-theater ">
        <h4 class="theater-tit"><span>CGV강남</span></h4>
        <a href="/support/lease/default.aspx" class="round inred btn_lease"><span style="padding:0 14px;">단체/대관문의</span></a>
        
        <div class="wrap-theaterinfo">
            <div class="box-image">
                <div id="theater_img_container" class="thumb-image"></div>
            </div>
            <div class="box-contents">
                <div class="theater-info">
                    <strong class="title">서울특별시 강남구 역삼동 814-6 스타플렉스<br>서울특별시 강남구 강남대로 438  (역삼동)<a href="./?page=location&theaterCode=0056#menu">위치/주차 안내  &gt;</a></strong>
                    <span class="txt-info">
                        <em>1544-1122</em>
                        <em>6관 / 857석</em>
                        <span></span>
                    </span>
                    <!-- 최대 10개까지만 보여집니다 2 -->
                    <span class="screentype">
                        
                            <a href='/theaters/special/?regioncode=SCX&theaterCode=0056' class='screenX'>SCREENX</a>
                        
                    </span>
                </div>
                <div class="noti-theater">
                    <h5>공지사항</h5>
                    <ul>
                        
                    </ul>
                    <a class="link-more" href="/support/news/Default.aspx?type=2" target="_blank" title="새창 열림">공지사항 더보기</a>
                </div>
            </div>
        </div>
    </div><!-- .sect-theater -->
   

    <div class="theater-ad">
        <iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@SponsorBar_980" width="980" height="90" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="SponsorBar_980" id="SponsorBar_980"></iframe>
    </div>
    <ul class="tab-menu" id="menu">
        <li class='on'><a href="./?areacode=01&theaterCode=0056&date=20250511#menu" title='현재 선택됨'>상영시간표</a></li>
        <li class='last'><a href="./?page=location&theaterCode=0056#menu" >위치/주차안내</a></li>
        <!--<li class='last'><a href="./?page=price&theaterCode=0056#menu" >관람료안내</a></li>-->
    </ul>
    <div class="cols-content">
        <!-- 상영시간표 UserControl -->
        
<div class="col-detail"> 
<div class="descri-info theater">
    <ul>
        <li><a id="li_view_price_btn" class="priceinfo" style="cursor:pointer;" onclick="javascript:fnPricePage();" title="새창">관람가격 안내</a></li>
        <li><a href="#" id="viewgrade" class="viewgrade" target="_blank" title="새창">관람등급 안내</a></li>
    </ul>
</div>
<!-- 탭메뉴 class="on" 에따라서 아래 h4 내용을 바꿔주세요 -->                
<h4 class="hidden"> + [상영시간표]</h4>
            
<!-- Showtimes Start -->
<iframe id="ifrm_movie_time_table" src="/common/showtimes/iframeTheater.aspx?areacode=01&theatercode=0056&date=20250511" title="[] 상영시간표" width="100%" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
<!-- /Showtimes End -->

</div>
        
        
        
        <div class="col-aside">
            <div class="ad-partner01"> 
            	<iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@M_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="M_Rectangle" id="M_Rectangle"></iframe>
            </div>
            <div class="ad-partner02">
            	<iframe src="http://ad.cgv.co.kr/NetInsight/html/CGV/CGV_201401/sub@C_Rectangle" width="160" height="300" title="" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" name="C_Rectangle" id="C_Rectangle"></iframe>
            </div>
        </div>
    <!--    <div class="sect-sns">
            <ul>                	
                <li><a class="link-facebook" href="#" id="link_facebook">FaceBook</a></li>
                <li><a class="link-twitter" href="#" id="link_twitter">Twitter</a></li>
            </ul>
            <div class="share">
                <div id="fb-root"></div>
                <script>
                    (function (d, s, id) {
                        var js, fjs = d.getElementsByTagName(s)[0];
                        if (d.getElementById(id)) return;
                        js = d.createElement(s); js.id = id;
                        js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&appId=341385562539159&version=v2.0";
                        fjs.parentNode.insertBefore(js, fjs);
                    } (document, 'script', 'facebook-jssdk'));
                </script>
                <div class="fb-like" style="z-index:2" data-href="http%3a%2f%2fwww.cgv.co.kr%2ftheaters%2fdefault.aspx" data-layout="button_count" data-action="like" data-show-faces="false" data-share="false"></div>
            </div>  	
        
        </div>-->
    </div>
</div>
<!-- 실컨텐츠 끝 --> 

<script type="text/javascript">

function fnPricePage(){
    var strTheaterCode = "0056";
    location.href='/theaters/theaterPrice.aspx?tc='+strTheaterCode;
}

//<![CDATA[
    (function ($) {
        $(function () {

            var now = new Date();
            var _edate = new Date(2014, 7, 15, 23, 50, 0); //7/23
			
		   if (now < _edate) {
			   var theatercode = "0056";
			   if(theatercode == "0014")
			   {
			   
					window.open('http://img.cgv.co.kr/popup/pop_notice_sangam.html','CGV상암','width=280,height=380,left=0,top=0');
			   }
		   }
            document.iFrame = $('#ifrm_movie_time_table').sameHeightFrame({ 'callback': successHandler });
            function successHandler() {
                //iframe resize 후 아이콘 보여준다
                $('.descri-info').show();
            }

	        var theaterJsonData = [{"AreaTheaterDetailList":[{"RegionCode":"01","TheaterCode":"0056","TheaterName":"CGV강남","TheaterName_ENG":null,"IsSelected":true},{"RegionCode":"01","TheaterCode":"0001","TheaterName":"CGV강변","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0229","TheaterName":"CGV건대입구","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0366","TheaterName":"CGV고덕강일","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0010","TheaterName":"CGV구로","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0063","TheaterName":"CGV대학로","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0252","TheaterName":"CGV동대문","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0230","TheaterName":"CGV등촌","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0009","TheaterName":"CGV명동","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0105","TheaterName":"CGV명동역 씨네라이브러리","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0057","TheaterName":"CGV미아","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0288","TheaterName":"CGV방학","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0030","TheaterName":"CGV불광","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0046","TheaterName":"CGV상봉","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0300","TheaterName":"CGV성신여대입구","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0276","TheaterName":"CGV수유","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0150","TheaterName":"CGV신촌아트레온","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0040","TheaterName":"CGV압구정","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0112","TheaterName":"CGV여의도","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0292","TheaterName":"CGV연남","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0059","TheaterName":"CGV영등포","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0074","TheaterName":"CGV왕십리","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0013","TheaterName":"CGV용산아이파크몰","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0131","TheaterName":"CGV중계","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0199","TheaterName":"CGV천호","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0107","TheaterName":"CGV청담씨네시티","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0223","TheaterName":"CGV피카디리1958","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0164","TheaterName":"CGV하계","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"0191","TheaterName":"CGV홍대","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"P001","TheaterName":"CINE de CHEF 압구정","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"01","TheaterCode":"P013","TheaterName":"CINE de CHEF 용산아이파크몰","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"01","RegionName":"서울","RegionName_ENG":"Seoul","DisplayOrder":"1","IsSelected":true},{"AreaTheaterDetailList":[{"RegionCode":"02","TheaterCode":"0260","TheaterName":"CGV경기광주","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0270","TheaterName":"CGV고양백석","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0255","TheaterName":"CGV고양행신","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0257","TheaterName":"CGV광교","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0266","TheaterName":"CGV광교상현","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0348","TheaterName":"CGV광명역","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0232","TheaterName":"CGV구리","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0358","TheaterName":"CGV구리갈매","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0344","TheaterName":"CGV기흥","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0278","TheaterName":"CGV김포","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0188","TheaterName":"CGV김포운양","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0298","TheaterName":"CGV김포한강","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0329","TheaterName":"CGV남양주 화도","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0351","TheaterName":"CGV다산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0236","TheaterName":"CGV동두천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0124","TheaterName":"CGV동백","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0041","TheaterName":"CGV동수원","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0106","TheaterName":"CGV동탄","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0359","TheaterName":"CGV동탄그랑파사쥬","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0265","TheaterName":"CGV동탄역","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0233","TheaterName":"CGV동탄호수공원","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0226","TheaterName":"CGV배곧","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0155","TheaterName":"CGV범계","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0015","TheaterName":"CGV부천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0194","TheaterName":"CGV부천역","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0287","TheaterName":"CGV부천옥길","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0242","TheaterName":"CGV산본","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0196","TheaterName":"CGV서현","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0143","TheaterName":"CGV소풍","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0274","TheaterName":"CGV스타필드시티위례","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0073","TheaterName":"CGV시흥(임시휴업)","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0055","TheaterName":"CGV신세계경기","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0211","TheaterName":"CGV안산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0279","TheaterName":"CGV안성","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0003","TheaterName":"CGV야탑","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0262","TheaterName":"CGV양주옥정","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0338","TheaterName":"CGV역곡","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0004","TheaterName":"CGV오리","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0305","TheaterName":"CGV오산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0307","TheaterName":"CGV오산중앙","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0271","TheaterName":"CGV용인","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0113","TheaterName":"CGV의정부","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0187","TheaterName":"CGV의정부태흥","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0205","TheaterName":"CGV이천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0054","TheaterName":"CGV일산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0148","TheaterName":"CGV파주문산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0310","TheaterName":"CGV파주야당","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0181","TheaterName":"CGV판교","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0195","TheaterName":"CGV평촌","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0052","TheaterName":"CGV평택","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0334","TheaterName":"CGV평택고덕","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0214","TheaterName":"CGV평택소사","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0309","TheaterName":"CGV포천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0326","TheaterName":"CGV하남미사","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0301","TheaterName":"CGV화성봉담","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0145","TheaterName":"CGV화정","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"02","TheaterCode":"0365","TheaterName":"DRIVE IN 용인크랙사이드","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"02","RegionName":"경기","RegionName_ENG":"Gyeonggi","DisplayOrder":"2","IsSelected":false},{"AreaTheaterDetailList":[{"RegionCode":"202","TheaterCode":"0043","TheaterName":"CGV계양","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0021","TheaterName":"CGV부평","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0325","TheaterName":"CGV송도타임스페이스","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0002","TheaterName":"CGV인천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0296","TheaterName":"CGV인천가정(루원시티)","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0340","TheaterName":"CGV인천도화","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0352","TheaterName":"CGV인천시민공원","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0258","TheaterName":"CGV인천연수","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0269","TheaterName":"CGV인천학익","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0308","TheaterName":"CGV주안역","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"202","TheaterCode":"0235","TheaterName":"CGV청라","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"202","RegionName":"인천","RegionName_ENG":"Incheon","DisplayOrder":"3","IsSelected":false},{"AreaTheaterDetailList":[{"RegionCode":"12","TheaterCode":"0139","TheaterName":"CGV강릉","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"12","TheaterCode":"0355","TheaterName":"CGV기린","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"12","TheaterCode":"0354","TheaterName":"CGV원통","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"12","TheaterCode":"0281","TheaterName":"CGV인제","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"12","TheaterCode":"0070","TheaterName":"CGV춘천","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"12","RegionName":"강원","RegionName_ENG":"Kangwon","DisplayOrder":"4","IsSelected":false},{"AreaTheaterDetailList":[{"RegionCode":"205","TheaterCode":"0370","TheaterName":"CGV논산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0207","TheaterName":"CGV당진","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"03","TheaterCode":"0007","TheaterName":"CGV대전","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"03","TheaterCode":"0286","TheaterName":"CGV대전가수원","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"03","TheaterCode":"0154","TheaterName":"CGV대전가오","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"03","TheaterCode":"0202","TheaterName":"CGV대전탄방","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"03","TheaterCode":"0127","TheaterName":"CGV대전터미널","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0091","TheaterName":"CGV서산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0219","TheaterName":"CGV세종","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0356","TheaterName":"CGV아산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"03","TheaterCode":"0206","TheaterName":"CGV유성노은","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0331","TheaterName":"CGV제천(임시휴업)","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0369","TheaterName":"CGV천안","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0293","TheaterName":"CGV천안터미널","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0110","TheaterName":"CGV천안펜타포트","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0228","TheaterName":"CGV청주(서문)","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0142","TheaterName":"CGV청주지웰시티","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0319","TheaterName":"CGV청주터미널","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0284","TheaterName":"CGV충북혁신","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0328","TheaterName":"CGV충주교현","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"205","TheaterCode":"0217","TheaterName":"CGV홍성","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"03,205","RegionName":"대전/충청","RegionName_ENG":"Daejeon/Chungcheong","DisplayOrder":"5","IsSelected":false},{"AreaTheaterDetailList":[{"RegionCode":"11","TheaterCode":"0345","TheaterName":"CGV대구","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0157","TheaterName":"CGV대구수성","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0108","TheaterName":"CGV대구스타디움","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0185","TheaterName":"CGV대구아카데미","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0343","TheaterName":"CGV대구연경","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0216","TheaterName":"CGV대구월성","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0256","TheaterName":"CGV대구죽전","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0147","TheaterName":"CGV대구한일","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"11","TheaterCode":"0109","TheaterName":"CGV대구현대","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"11","RegionName":"대구","RegionName_ENG":"Daegu","DisplayOrder":"6","IsSelected":false},{"AreaTheaterDetailList":[{"RegionCode":"05","TheaterCode":"0061","TheaterName":"CGV대연","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0042","TheaterName":"CGV동래","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0337","TheaterName":"CGV부산명지","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0005","TheaterName":"CGV서면","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0285","TheaterName":"CGV서면삼정타워","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0303","TheaterName":"CGV서면상상마당","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0089","TheaterName":"CGV센텀시티","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0160","TheaterName":"CGV아시아드","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"207","TheaterCode":"0335","TheaterName":"CGV울산동구(임시휴업)","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"207","TheaterCode":"0128","TheaterName":"CGV울산삼산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"207","TheaterCode":"0333","TheaterName":"CGV울산성남","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"207","TheaterCode":"0264","TheaterName":"CGV울산신천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"207","TheaterCode":"0246","TheaterName":"CGV울산진장","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0306","TheaterName":"CGV정관","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0245","TheaterName":"CGV하단아트몰링","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0318","TheaterName":"CGV해운대","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"P004","TheaterName":"CINE de CHEF 센텀","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"05","TheaterCode":"0367","TheaterName":"DRIVE IN 영도","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"05,207","RegionName":"부산/울산","RegionName_ENG":"Busan/Ulsan","DisplayOrder":"7","IsSelected":false},{"AreaTheaterDetailList":[{"RegionCode":"204","TheaterCode":"0263","TheaterName":"CGV거제","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0330","TheaterName":"CGV경산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0323","TheaterName":"CGV고성","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0053","TheaterName":"CGV구미","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0240","TheaterName":"CGV김천율곡","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0028","TheaterName":"CGV김해","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0311","TheaterName":"CGV김해율하","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0239","TheaterName":"CGV김해장유","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0033","TheaterName":"CGV마산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0097","TheaterName":"CGV북포항","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0272","TheaterName":"CGV안동","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0234","TheaterName":"CGV양산삼호","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0324","TheaterName":"CGV진주혁신","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0079","TheaterName":"CGV창원더시티","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"204","TheaterCode":"0283","TheaterName":"CGV창원상남","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"204","RegionName":"경상","RegionName_ENG":"Gyeongsang","DisplayOrder":"8","IsSelected":false},{"AreaTheaterDetailList":[{"RegionCode":"04","TheaterCode":"0220","TheaterName":"CGV광양","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0221","TheaterName":"CGV광양 엘에프스퀘어","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"206","TheaterCode":"0295","TheaterName":"CGV광주금남로","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"206","TheaterCode":"0193","TheaterName":"CGV광주상무","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"206","TheaterCode":"0210","TheaterName":"CGV광주용봉","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"206","TheaterCode":"0218","TheaterName":"CGV광주첨단","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"206","TheaterCode":"0244","TheaterName":"CGV광주충장로","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"206","TheaterCode":"0215","TheaterName":"CGV광주하남","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0237","TheaterName":"CGV나주","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0289","TheaterName":"CGV목포","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0280","TheaterName":"CGV목포평화광장","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0225","TheaterName":"CGV서전주","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0114","TheaterName":"CGV순천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0268","TheaterName":"CGV순천신대","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0315","TheaterName":"CGV여수웅천","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0020","TheaterName":"CGV익산","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0213","TheaterName":"CGV전주고사","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0336","TheaterName":"CGV전주에코시티","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0179","TheaterName":"CGV전주효자","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"04","TheaterCode":"0186","TheaterName":"CGV정읍","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"06","TheaterCode":"0302","TheaterName":"CGV제주","TheaterName_ENG":null,"IsSelected":false},{"RegionCode":"06","TheaterCode":"0259","TheaterName":"CGV제주노형","TheaterName_ENG":null,"IsSelected":false}],"RegionCode":"206,04,06","RegionName":"광주/전라/제주","RegionName_ENG":"Gwangju/Jeonlla/Jeju","DisplayOrder":"9","IsSelected":false}];
	        var selectedDate = 20250511;
            //extraTheaterData 는 특별 관 또는 따로 관리되어야 하는 극장 리스트 이다.
            //파일 위치는 common/js/extraTheaterData.js
	        $('.sect-city').theaterMatrix({'data': theaterJsonData, 'selectedDate': selectedDate, 'extraTheaterData': extraTheaterData });

            $("#btn_Important_close").on("click", function() {
                $("#divBoxImportantNotice").hide();
            });

            
            /* 사진 더보기 Script Start */
            var jsonData = [{"imageUrl":"https://img.cgv.co.kr/Theater/Theater/2024/1231/17356319393670.jpg","alt":"CGV강남 극장 리뉴얼 이미지"},{"imageUrl":"https://img.cgv.co.kr/Theater/Theater/2024/1231/17356319868900.jpg","alt":"CGV강남 극장 리뉴얼 이미지"}];

    		// 저장된 데이터의 첫번째 이미지를 우선 삽입
    		var $theaterImg = $('#theater_img_container').empty();

    		if (jsonData && jsonData.length > 0) {
    			$img = $('<img/>', {
    				'src': jsonData[0]['imageUrl'],
    				'alt': jsonData[0]['alt']
    			});
    		} else {
    			$img = $('<img/>', {
    				'src': app.config('staticDomain') + 'images/common/default_theater.gif',
    				'alt': '극장이미지'
    			});
    		}

    		$img.appendTo($theaterImg);

    		// 극장사진이 더 있는경우 더보기 버튼이 보이고, 추가 데이터의 이미지 슬라이더를 호출한다.
    		if (jsonData && jsonData.length > 1) {
    			var $moreBtn = $('<a/>', { 'href': '#' }),
					$moreImg = $('<img/>', {
						'src': app.config('staticDomain') + 'images/common/btn/btn_imgmore.png',
						'alt': '사진더보기'
					});

    			$moreBtn.append($moreImg).on('click', function () {
    				app.instWin.add({ 'type': 'photo', 'data': jsonData, 'offset': 0, mask: true});
    				return false;
    			}).appendTo($theaterImg);
    		}

            /* 사진 더보기 Script End */
            
            
            try {
                var container = window.parent.document.iFrame;
                container.resize(); // 갱신될때마다 iFrame 높이값 재조정.
            }
            catch(e) {
                //ToDO : iframe 순서로 인한 예외 처리
                /*setTimeout(function(){
                    var container = window.parent.document.iFrame;
                    container.resize(); // 갱신될때마다 iFrame 높이값 재조정.
                },500);*/
            }

            /* 관람료 Script Start */
            
            
                $('#wrap_theater_price div.special').hide();    //극장가격 특별관은 기본으로 숨김처리
            

            $('#wrap_theater_price .tab-menu-round li').click(function () {

                var $this = $(this);
                var $onItem = $('#wrap_theater_price .tab-menu-round li.on');
                var thisClass = $this.data('screen-type');
                var onItemClass = $onItem.data('screen-type');

                if($this.data('screen-type') == $onItem.data('screen-type')) { return false; }

                $onItem.removeClass("on");
                $this.addClass("on");

                $('#wrap_theater_price div.' + onItemClass).hide();     //기존 애 숨김
                $('#wrap_theater_price div.' + thisClass).show();       //클릭한 애 보여줌

                if ($this.data('screen-type') == 'cgv')
                    $('#priceinfo_online').html($("#temp_priceinfo_online").html());
                  
                else
                    $('#priceinfo_online').html("");

                return false;
            });
            /* 관람료 Script End */
			
        });
    })(jQuery);



    
//]]>
</script>

			<!--  각 지점 공지 게시판 -->
    
        <%@ include file="../main/footer.jsp" %>


<!-- 극장 상세 정보 출력 영역 -->
<div class="theater-detail" style="margin: 30px 0; display: none;" id="theater-detail-box">
    <div class="box-border">
        <div class="theater-info">
            <strong id="theater-name" class="theater-title"></strong>
            <p id="theater-address" class="theater-desc"></p>
            <p id="theater-phone" class="theater-desc"></p>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('.favorite-wrap a').on('click', function() {
        var name = $(this).find('em').text().trim();
        var infoMap = {
            "강남점": {address: "서울 강남구 강남대로 438", phone: "02-6000-1234"},
            "홍대점": {address: "서울 마포구 양화로 125", phone: "02-7000-5678"},
            "영등포점": {address: "서울 영등포구 영중로 15", phone: "02-3000-0000"}
        };
        var info = infoMap[name] || {address: "정보 없음", phone: "정보 없음"};
        $('#theater-name').text(name);
        $('#theater-address').text("주소: " + info.address);
        $('#theater-phone').text("전화번호: " + info.phone);
        $('#theater-detail-box').show();
    });
});
</script>

			<!--  각 지점 공지 게시판 -->
    
        <%@ include file="../main/footer.jsp" %>

    </main>
   
</body>
</html>