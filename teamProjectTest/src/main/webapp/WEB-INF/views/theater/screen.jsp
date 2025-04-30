<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>KOFIC 영화관 입장권 통합전산망 :: 상영스케줄</title>
<!-- 공통 js/css -->













<!--[if IE]>
<script src="/kobis/web/comm/commjs/html5shiv.js"></script>
<![endif]-->



<!-- 기본 css -->
<link rel="stylesheet" type="text/css" href="/kobis/web/comm/commcss/default.css">
<link rel="stylesheet" type="text/css" href="/kobis/web/comm/commcss/jquery-ui-1.12.1.min.css" />
<link rel="stylesheet" type="text/css" href="/kobis/web/comm/commcss/common.css" />


<script type="text/javascript" src="/kobis/web/comm/commjs/jquery-1.12.4.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/jquery.dotdotdot.min.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/jquery.bxslider.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/comm_script.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/jquery-ui-1.13.2.min.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/jquery.ui.datepicker-ko.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/kobis.js"></script>






<link rel="stylesheet" type="text/css" href="/kobis/web/comm/commcss/cont.css" />
<link rel="stylesheet" type="text/css" href="/kobis/web/comm/commcss/kobis.css">
<script type="text/javascript" src="/kobis/web/comm/commjs/jcarousellite_1.0.1.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/IGuide.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/jquery.cookie.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/dialogStyle.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/layerpopup.js"></script> 
<script type="text/javascript" src="/kobis/web/comm/commjs/innershiv.js"></script>
<script type="text/javascript" src="/kobis/web/comm/commjs/detailLayer.js"></script>
<script type="text/javascript" src="/kobis/web/comm/online/js/chart.min.js"></script>
<script type="text/javascript" src="/kobis/web/comm/online/js/jquery.peity.js"></script>  
 
<style type="text/css">
.title a {display: inline; float: none;}
</style>
<!-- 공통 js/css -->
<script type="text/javascript">
	//조회 버튼 검색
	var date = new Date();
	var currentDate = getDate(date.getFullYear(), date.getMonth(), date.getDate());
	var theaCd = "";
	var wideareaCd = "";
	var basareaCd = "";

	function selectedWidearea(uiObj, wideareaCd) {
		$("#wideareaCd").val(wideareaCd);
		$(uiObj).find("input").prop("checked");
		makeBasareaCd(wideareaCd, $("#sBasareaCd"));
		$("#sTheaCd").find("li").remove();
		$("#schedule").find("li").remove();
	}

	function selectedBasarea(uiObj, basareaCd) {
		uiObj.addClass("current");
		uiObj.siblings().removeClass("on");

		makeTheaCd($("#wideareaCd").val(), basareaCd, $("#sTheaCd"));
		$("#schedule").find("li").remove();
	}

	function selectedTheater(uiObj, theaCd) {
		$("#theaCd").val(theaCd);

		uiObj.addClass("current");
		uiObj.siblings().removeClass("on");

		makeSchedule(theaCd, $("#showDt").val(), $("#schedule"));
	}

	function makeBasareaCd(wideareaCd, selectObj) {
		$.post("/kobis/business/mast/thea/findBasareaCdList.do?CSRFToken=MMnwfnPNxhCkggJaU_o1hwwLIte2mDETj5AqmL8qt-U", { sWideareaCd: wideareaCd }
			,function(data){
				$(".step2").addClass("on");
				var basareaCdList = data.basareaCdList;
				$(selectObj).find("li").remove();
				for(var i = 0; i < basareaCdList.length; i++){
					if(selectObj){
						$(this).addClass("on");
			            if(basareaCdList[i].cd == basareaCd) {
			            	$(selectObj).append($("<li class=\"current\" basareaCd=\"" + basareaCdList[i].cd + "\" onclick=\"selectedBasarea($(this), '" + basareaCdList[i].cd + "');\"><input type='radio' checked='true' name='step2' id='step2_"+(i+1)+"' /><label for='step2_"+(i+1)+"'>" + basareaCdList[i].cdNm + "</label></li>"));
			            } else {
			            	$(selectObj).append($("<li basareaCd=\"" + basareaCdList[i].cd + "\" onclick=\"selectedBasarea($(this), '" + basareaCdList[i].cd + "'); \"><input type='radio' name='step2' id='step2_"+(i+1)+"' /><label for='step2_"+(i+1)+"'>" + basareaCdList[i].cdNm + "</label></li>"));
			            }

					}
				}
			}
			,'json'
		);
	}

	function makeTheaCd(wideareaCd, basareaCd, selectObj) {
		$.post("/kobis/business/mast/thea/findTheaCdList.do?CSRFToken=MMnwfnPNxhCkggJaU_o1hwwLIte2mDETj5AqmL8qt-U", { sWideareaCd: wideareaCd, sBasareaCd: basareaCd }
			,function(data){
				$(".step3").addClass("on");
				var theaCdList = data.theaCdList;
				$(selectObj).find("li").remove();
				if(theaCdList.length == 0) {
					$(selectObj).append($("<li>영화상영관 없음</li>"));
				}
				for(var i = 0; i < theaCdList.length; i++){
					if(selectObj){

						 if(theaCdList[i].cd == theaCd) {
							 $(selectObj).append($("<li class=\"current\" theaCd=\"" + theaCdList[i].cd + "\" onclick=\"selectedTheater($(this), '" + theaCdList[i].cd + "'); \"><input type='radio' checked='true' name='step3' id='step3_"+(i+1)+"' /><label for='step3_"+(i+1)+"'>" + theaCdList[i].cdNm + "</label></li>"));
						 } else {
							 $(selectObj).append($("<li theaCd=\"" + theaCdList[i].cd + "\" onclick=\"selectedTheater($(this), '" + theaCdList[i].cd + "'); \"><input type='radio' name='step3' id='step3_"+(i+1)+"' /><label for='step3_"+(i+1)+"'>" + theaCdList[i].cdNm + "</label></li>"));
						 }
					}
				}
			}
			,'json'
		);
	}

	function makeSchedule(theaCd, showDt, selectObj) {
		if(theaCd == "" || showDt == "") {
			return;
		}
		$.post("/kobis/business/mast/thea/findSchedule.do?CSRFToken=MMnwfnPNxhCkggJaU_o1hwwLIte2mDETj5AqmL8qt-U", { theaCd: theaCd, showDt: showDt }
			,function(data){
				$(".step4").addClass("on");	
				var schedule = data.schedule;
				var theater = data.theater;
				if(theater[0].homepgUrl != "") {
					$(".btn_book").attr("target", "_blank");
					$(".btn_book").attr("href", theater[0].homepgUrl);
					$(".date > p > a").show();
				} else {
					$(".date > p > a").hide();
				}

				$(selectObj).find("li").remove();
				dayHtml = "";
				if(selectObj){
					for(var i = 0; i < schedule.length; i++) {
						
						
						
						dayHtml+= "<li>"                        
						dayHtml+= "<div class='tit'>"
						dayHtml+= "<span class='screen'>"+schedule[i].scrnNm +"</span>"
						dayHtml+= "<a href=\"#\" onclick=\"mstView('movie','"+schedule[i].movieCd+"')\">"+ schedule[i].movieNm + "</a>";
						dayHtml+= "</div>"
						var showTm = schedule[i].showTm.split(",");
						dayHtml+= "<div class='times'>"
						for(var j = 0; j < showTm.length; j++) {
						dayHtml+= "<input type='radio' name='step4' id='step4_"+(i+1)+"_"+(j+1)+"' disabled='disabled' /><label for='step4_"+(i+1)+"_"+(j+1)+"' style='cursor:default;'>"+ showTm[j].substring(0,2) + ":" + showTm[j].substring(2) + "</label>"
						}
						dayHtml+="</div>"
						dayHtml+="</li>" 
						
						/* dayHtml += "<li><strong><em style='background: url(/kobis/web/comm/images/mast/bg_theater_1px.gif) repeat;width:auto;padding: 0 3px;'>" 
							+ schedule[i].scrnNm + "</em>
						&nbsp;<a href=\"#\" class=\"undln\" onclick=\"mstView('movie','"+schedule[i].movieCd+"')\">" + schedule[i].movieNm + "</a></strong>";
						dayHtml += "<ul>";
						var showTm = schedule[i].showTm.split(",");
						for(var j = 0; j < showTm.length; j++) {
							dayHtml += "<li>" + showTm[j].substring(0,2) + ":" + showTm[j].substring(2) + "</li>";
						}
						dayHtml += "</ul>";
						dayHtml += "</li>"; */
					}
					if(dayHtml ==""){
						dayHtml += "<li><div class='tit'>상영스케줄이  없습니다.</div></li>"
					}
					$(selectObj).append(dayHtml);
				}
			}
			,'json'
		);
	}

	$(function(){
	   	$("ul#sWideareaCd li").each(function () {
            $(this).click(function () {
            	$(this).addClass("current");
            	$(this).siblings().removeClass("on");
        	});

            if($(this).attr("wideareaCd") == wideareaCd) {
            	$(this).addClass("current");
            }
        });

	   	var mm = date.getMonth() + 1;
	   	var dd = date.getDate();
	   	$("p strong").text(mm + "월 " + dd + "일");
	   	$("#showDt").val(getDateString(date).split("-").join(""));

	   	$("#previous").click(function () {
		   	if(currentDate.valueOf() > getDate(date.getFullYear(), date.getMonth(), date.getDate()).valueOf()) {
		   		currentDate = getDate(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate()-1);
		   		$("p strong").text((currentDate.getMonth()+1) + "월 " + currentDate.getDate() + "일");
		   		$("#showDt").val(getDateString(currentDate).split("-").join(""));
	   		}
		   	makeSchedule($("#theaCd").val(), $("#showDt").val(), $("#schedule"));
	   	});

	   	$("#next").click(function () {
	   		if(currentDate.valueOf() < getDate(date.getFullYear(), date.getMonth(), date.getDate()+6).valueOf()) {
		   		currentDate = getDate(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate()+1);
		   		$("p strong").text((currentDate.getMonth()+1) + "월 " + currentDate.getDate() + "일");
		   		$("#showDt").val(getDateString(currentDate).split("-").join(""));
	   		}
	   		makeSchedule($("#theaCd").val(), $("#showDt").val(), $("#schedule"));
	   	});

	   	selectedWidearea($(".step1 li[wideareacd="+wideareaCd+"]"), wideareaCd);
	   	$(".step1 li[wideareacd="+wideareaCd+"]").find("input").prop("checked", true);
	   	selectedBasarea($(".step2 li[basareaCd="+basareaCd+"]"), basareaCd);
	   	selectedTheater($(".step3 li[theaCd="+theaCd+"]"), theaCd);  
	});

	function getDate(year, month, day) {
		return new Date(year, month, day);
	}
</script>
</head>

<body>
<!-- 로딩중 -->
<!-- <div id="wrap_layer" style="position:fixed">
	<p style="position:absolute;top:50%;left:50%;margin-left:-270px;"><img src="/kobis/web/comm/images/comm/progressbar.gif" alt="현재 페이지를 로딩중입니다."></p>
</div> -->
<!-- 로딩중 -->

<div id="wrap" class="mvie5_4">
	










<script type="text/javascript">
	function mainTopMenuTopView(divName) {
		var frm = document.getElementById(divName);
		if(frm.style.display != "block") frm.style.display = "block";
		else frm.style.display = "none";
	}
	
	function fn_changeSearch() {
		SetCookie("sel_s_type", $("#sel_s_type").val());
		var pForm = document.searchMainTopMovie;
		
		if($("#sel_s_type").val() == "M") {
			pForm.action="/kobis/business/mast/mvie/searchMovieList.do";
			$("#inp_solrSearch").attr("name", "sMovName");
		} else {
			pForm.action="/kobis/business/comm/search/search.do";
			$("#inp_solrSearch").attr("name", "queryString");
		}
	}
	
	function fn_mainTopMovieSearch(){
		var pForm = document.searchMainTopMovie;
		pForm.submit();
	}
	
	$(document).ready(function() { 
	    if(GetCookie("sel_s_type") == "T") {
	    	$("#sel_s_type").val("T");
	    	
	    	var pForm = document.searchMainTopMovie;
	    	pForm.action="/kobis/business/comm/search/search.do";
	    	
	    	$("#inp_solrSearch").attr("name", "queryString"); 
	    }
	    $("ul.list_nav > li > a").click(function(){
	    
	    		
	    	if($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0)").length >0){
	    		$(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0) a").click();
	    		goDirectPage($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0)  li.depth3:eq(0) a").attr("href"));
	    	}else{
	    		$(this).parent().find(".bg_sub ul.nav_sub > li:eq(0) a").click();
	    		goDirectPage($(this).parent().find(".bg_sub ul.nav_sub > li:eq(0) a").attr("href"));
	    	}
	    	
	    	
	    	if($(this).parent().hasClass("nav5")){
	    		/* $(this).attr("href","/kobis/business/stat/online/onlinefindDailyBoxOfficeList.do"); */
	    		/* location.href="/kobis/business/stat/online/onlineMain.do"; */
	    		location.href="/kobis/business/stat/online/onlineintro.do";
	    		
	    	}
	    });
	}); 
	function goDirectPage(page){
		location.href=page;
	}
</script>


<link rel="stylesheet" type="text/css" href="/kobis/web/comm/commcss/autoLogout.css" />




<!-- 운영 적용시 if문 삭제 -->


 
    <!-- container -->
    <div id="container">
    
    
<div id="snb">
		
	 	 	<h2 class="blind">
            	영화정보검색
            </h2>
            <h3>
            	영화정보검색
            </h3>
 			<ul class="list_snb">
 		
 				<!-- 메뉴 대시보드 제거 하드코딩 c:choose 삭제 -->
 				
		 			<li no="101">
		 				<strong class="tit"><a href="/kobis/business/mast/mvie/searchMovieList.do">영화</a></strong>
		 				
		                    <a href="javascript:;" class="hidetxt"><span class="ico_comm">펼쳐보기</span></a>
		                    <ul class="list_submenu">
			 						
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="241"> 
			 										<a href="/kobis/business/mast/mvie/searchMovieList.do" class="block">영화정보</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="360"> 
			 										<a href="/kobis/business/mast/mvie/findOpenScheduleList.do" class="block">개봉스케줄</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="243"> 
			 										<a href="/kobis/business/mast/mvie/searchPrdtList.do" class="block">한국영화 제작상황판</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="363"> 
			 										<a href="/kobis/business/mast/mvie/findDiverMovList.do" class="block">독립·예술영화</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 									
			 				</ul>
		 				
		 			</li>
		 			
 				<!-- 메뉴 대시보드 제거 하드코딩 c:choose 삭제 -->
 				
		 			<li no="102">
		 				<strong class="tit"><a href="/kobis/business/mast/peop/searchPeopleList.do">영화인</a></strong>
		 				
		 			</li>
		 			
 				<!-- 메뉴 대시보드 제거 하드코딩 c:choose 삭제 -->
 				
		 			<li no="255">
		 				<strong class="tit"><a href="/kobis/business/mast/comp/searchCompanyList.do">영화사</a></strong>
		 				
		 			</li>
		 			
 				<!-- 메뉴 대시보드 제거 하드코딩 c:choose 삭제 -->
 				
		 			<li no="365">
		 				<strong class="tit"><a href="/kobis/business/mast/thea/findTheaterInfoList.do">영화상영관</a></strong>
		 				
		                    <a href="javascript:;" class="hidetxt"><span class="ico_comm">펼쳐보기</span></a>
		                    <ul class="list_submenu">
			 						
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="547"> 
			 										<a href="/kobis/business/mast/thea/findTheaterInfoList.do" class="block">영화상영관정보</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="570"> 
			 										<a href="/kobis/business/mast/thea/findAreaTheaterStat.do" class="block">지역별 영화상영관현황</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="1260"> 
			 										<a href="/kobis/business/mast/thea/findShowHistorySc.do" class="block">상영내역</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="368"> 
			 										<a href="/kobis/business/mast/thea/findTheaterSchedule.do" class="block">상영스케줄</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="370"> 
			 										<a href="/kobis/business/mast/thea/findScreenQuota.do" class="block">스크린쿼터내역</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="371"> 
			 										<a href="/kobis/business/mast/thea/findArtScreenStat.do" class="block">전용상영관 현황</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="1331"> 
			 										<a href="/kobis/business/mast/thea/findArtShowHistory.do" class="block">전용상영관 상영내역</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 									
			 				</ul>
		 				
		 			</li>
		 			
 				<!-- 메뉴 대시보드 제거 하드코딩 c:choose 삭제 -->
 				
		 			<li no="103">
		 				<strong class="tit"><a href="/kobis/business/mast/fest/searchUserFestInfoList.do">영화제</a></strong>
		 				
		 			</li>
		 			
 				<!-- 메뉴 대시보드 제거 하드코딩 c:choose 삭제 -->
 				
		 			<li no="170">
		 				<strong class="tit"><a href="/kobis/business/mast/mvie/searchUserMovCdList.do">코드검색 및 등록</a></strong>
		 				
		                    <a href="javascript:;" class="hidetxt"><span class="ico_comm">펼쳐보기</span></a>
		                    <ul class="list_submenu">
			 						
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="171"> 
			 										<a href="/kobis/business/mast/mvie/searchUserMovCdList.do" class="block">영화코드</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="373"> 
			 										<a href="/kobis/business/mast/send/findSenderCodeList.do" class="block">전송사업자코드</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 										
			 								<!-- 메뉴 하드코딩 c:choose 제거2 --> 
			 								
			 										<li no="375"> 
			 										<a href="/kobis/business/mast/thea/findTheaterCodeList.do" class="block">영화상영관코드</a>
			 										<ul>
										 				
										 				</ul>
										 			</li>
			 									
			 				</ul>
		 				
		 			</li>
		 				
 			</ul>
 			
</div>	


  		
    	<div id="content"> 
            <!-- 타이틀 & 현재 페이지 위치 -->
             
	<div class="hd">
		<h4 class="tit" no="368">
				
				<img src="/kobis/web/comm/images/comm/title_showSchedule.gif" alt="상영스케줄">
		</h4>
		<strong class="blind">상영스케줄</strong>
	<ul class="locate">
		<li><a href="/kobis/business/main/main.do"><span class="ico_comm">홈</span></a></li>
	
			<li><a href="/kobis/business/mast/mvie/searchMovieList.do">영화정보검색</a></li>
		
			<li><a href="/kobis/business/mast/thea/findTheaterInfoList.do">영화상영관</a></li>
		
			<li> <strong>상영스케줄</strong></li>
		
	</ul>
	</div>
	
	
            <!-- //타이틀 & 현재 페이지 위치 -->

			<div class="box_gray">
            	<p class="dot01"><span class="fwb">[상영스케줄]</span>코너는 각 영화관별 영화상영 스케쥴 정보를 당일 이후 기준으로 제공하고 있습니다.</p>
                <p class="dot01">상영스케줄 정보는 영화관의 스케줄 변경, 관변경 등으로 실제 상영내역과 일치하지 않을 수 있으며, 각 전송사업자별로 상영스케줄 운영방식에 따라 개별 영화상영관의 상영스케줄 일부 정보가 제공되지 않을 수 있습니다.</p>
            </div>
            <form action="findTheaterSchedule.do" id="searchForm" name="searchForm" method="post">            	
            	<input type="hidden" name="CSRFToken" value="MMnwfnPNxhCkggJaU_o1hwwLIte2mDETj5AqmL8qt-U" />
				<input type="hidden" id="wideareaCd" name="wideareaCd" value="" />
				<input type="hidden" id="basareaCd" name="basareaCd" value="" />
				<input type="hidden" id="theaCd" name="theaCd" value="" />
				<input type="hidden" id="showDt" name="showDt" value="" />
			</form>
            <div class="schedule">
            	<div class="fl step1 on"><!-- 해당 단계일 때 .on 추가 -->
                	<strong>광역</strong>
                    <ul>
                    	
							<li wideareaCd="0105001" onclick="selectedWidearea(this, '0105001');">
							<input type="radio" name="step1" id="step1_1">
							<label for="step1_1">서울시</label>
							</li>
						
							<li wideareaCd="0105002" onclick="selectedWidearea(this, '0105002');">
							<input type="radio" name="step1" id="step1_2">
							<label for="step1_2">경기도</label>
							</li>
						
							<li wideareaCd="0105003" onclick="selectedWidearea(this, '0105003');">
							<input type="radio" name="step1" id="step1_3">
							<label for="step1_3">강원도</label>
							</li>
						
							<li wideareaCd="0105004" onclick="selectedWidearea(this, '0105004');">
							<input type="radio" name="step1" id="step1_4">
							<label for="step1_4">충청북도</label>
							</li>
						
							<li wideareaCd="0105005" onclick="selectedWidearea(this, '0105005');">
							<input type="radio" name="step1" id="step1_5">
							<label for="step1_5">충청남도</label>
							</li>
						
							<li wideareaCd="0105006" onclick="selectedWidearea(this, '0105006');">
							<input type="radio" name="step1" id="step1_6">
							<label for="step1_6">경상북도</label>
							</li>
						
							<li wideareaCd="0105007" onclick="selectedWidearea(this, '0105007');">
							<input type="radio" name="step1" id="step1_7">
							<label for="step1_7">경상남도</label>
							</li>
						
							<li wideareaCd="0105008" onclick="selectedWidearea(this, '0105008');">
							<input type="radio" name="step1" id="step1_8">
							<label for="step1_8">전라북도</label>
							</li>
						
							<li wideareaCd="0105009" onclick="selectedWidearea(this, '0105009');">
							<input type="radio" name="step1" id="step1_9">
							<label for="step1_9">전라남도</label>
							</li>
						
							<li wideareaCd="0105010" onclick="selectedWidearea(this, '0105010');">
							<input type="radio" name="step1" id="step1_10">
							<label for="step1_10">제주도</label>
							</li>
						
							<li wideareaCd="0105011" onclick="selectedWidearea(this, '0105011');">
							<input type="radio" name="step1" id="step1_11">
							<label for="step1_11">부산시</label>
							</li>
						
							<li wideareaCd="0105012" onclick="selectedWidearea(this, '0105012');">
							<input type="radio" name="step1" id="step1_12">
							<label for="step1_12">대구시</label>
							</li>
						
							<li wideareaCd="0105013" onclick="selectedWidearea(this, '0105013');">
							<input type="radio" name="step1" id="step1_13">
							<label for="step1_13">대전시</label>
							</li>
						
							<li wideareaCd="0105014" onclick="selectedWidearea(this, '0105014');">
							<input type="radio" name="step1" id="step1_14">
							<label for="step1_14">울산시</label>
							</li>
						
							<li wideareaCd="0105015" onclick="selectedWidearea(this, '0105015');">
							<input type="radio" name="step1" id="step1_15">
							<label for="step1_15">인천시</label>
							</li>
						
							<li wideareaCd="0105016" onclick="selectedWidearea(this, '0105016');">
							<input type="radio" name="step1" id="step1_16">
							<label for="step1_16">광주시</label>
							</li>
						
							<li wideareaCd="0105017" onclick="selectedWidearea(this, '0105017');">
							<input type="radio" name="step1" id="step1_17">
							<label for="step1_17">세종시</label>
							</li>
						
                        <!-- <li><input type="radio" name="step1" id="step1_1" /><label for="step1_1">서울시</label></li>
                        <li><input type="radio" name="step1" id="step1_2" /><label for="step1_2">경기도</label></li>
                        <li><input type="radio" name="step1" id="step1_3" /><label for="step1_3">강원도</label></li>
                        <li><input type="radio" name="step1" id="step1_4" /><label for="step1_4">충청북도</label></li>
                        <li><input type="radio" name="step1" id="step1_5" /><label for="step1_5">충청남도</label></li>
                        <li><input type="radio" name="step1" id="step1_6" /><label for="step1_6">경상북도</label></li>
                        <li><input type="radio" name="step1" id="step1_7" /><label for="step1_7">경상남도</label></li>
                        <li><input type="radio" name="step1" id="step1_8" /><label for="step1_8">전라북도</label></li>
                        <li><input type="radio" name="step1" id="step1_9" /><label for="step1_9">전라남도</label></li>
                        <li><input type="radio" name="step1" id="step1_10" /><label for="step1_10">제주도</label></li>
                        <li><input type="radio" name="step1" id="step1_11" /><label for="step1_11">부산시</label></li>
                        <li><input type="radio" name="step1" id="step1_12" /><label for="step1_12">대구시</label></li>
                        <li><input type="radio" name="step1" id="step1_13" /><label for="step1_13">대전시</label></li>
                        <li><input type="radio" name="step1" id="step1_14" /><label for="step1_14">울산시</label></li>
                        <li><input type="radio" name="step1" id="step1_15" /><label for="step1_15">인천시</label></li>
                        <li><input type="radio" name="step1" id="step1_16" /><label for="step1_16">광주시</label></li>
                        <li><input type="radio" name="step1" id="step1_17" /><label for="step1_17">세종시</label></li> -->
                    </ul>
                </div>
                <div class="fl step2"><!-- 해당 단계일 때 .on 추가 -->
                	<strong>기초</strong>
                    <!-- <ul>
                        <li><input type="radio" name="step2" id="step2_1" /><label for="step2_1">강남구</label></li>
                        <li><input type="radio" name="step2" id="step2_2" /><label for="step2_2">강동구</label></li>
                        <li><input type="radio" name="step2" id="step2_3" /><label for="step2_3">강북구</label></li>
                        <li><input type="radio" name="step2" id="step2_4" /><label for="step2_4">강서구</label></li>
                        <li><input type="radio" name="step2" id="step2_5" /><label for="step2_5">관악구</label></li>
                        <li><input type="radio" name="step2" id="step2_6" /><label for="step2_6">광진구</label></li>
                        <li><input type="radio" name="step2" id="step2_7" /><label for="step2_7">구로구</label></li>
                        <li><input type="radio" name="step2" id="step2_8" /><label for="step2_8">금천구</label></li>
                        <li><input type="radio" name="step2" id="step2_9" /><label for="step2_9">노원구</label></li>
                        <li><input type="radio" name="step2" id="step2_10" /><label for="step2_10">도봉구</label></li>
                        <li><input type="radio" name="step2" id="step2_11" /><label for="step2_11">동대문구</label></li>
                        <li><input type="radio" name="step2" id="step2_12" /><label for="step2_12">동작구</label></li>
                        <li><input type="radio" name="step2" id="step2_13" /><label for="step2_13">마포구</label></li>
                        <li><input type="radio" name="step2" id="step2_14" /><label for="step2_14">서대문구</label></li>
                        <li><input type="radio" name="step2" id="step2_15" /><label for="step2_15">서초구</label></li>
                        <li><input type="radio" name="step2" id="step2_16" /><label for="step2_16">성동구</label></li>
                        <li><input type="radio" name="step2" id="step2_17" /><label for="step2_17">성북구</label></li>
                        <li><input type="radio" name="step2" id="step2_18" /><label for="step2_18">송파구</label></li>
                        <li><input type="radio" name="step2" id="step2_19" /><label for="step2_19">양천구</label></li>
                        <li><input type="radio" name="step2" id="step2_20" /><label for="step2_20">영등포구</label></li>
                        <li><input type="radio" name="step2" id="step2_21" /><label for="step2_21">용산구</label></li>
                        <li><input type="radio" name="step2" id="step2_22" /><label for="step2_22">은평구</label></li>
                        <li><input type="radio" name="step2" id="step2_23" /><label for="step2_23">종로구</label></li>
                        <li><input type="radio" name="step2" id="step2_24" /><label for="step2_24">중구</label></li>
                        <li><input type="radio" name="step2" id="step2_25" /><label for="step2_25">중랑구</label></li>
                    </ul> -->
                    <ul id="sBasareaCd"></ul>
                </div>
                <div class="fl step3"><!-- 해당 단계일 때 .on 추가 -->
                	<strong>영화상영관</strong>
                    <ul id="sTheaCd"></ul>
                </div>
                <div class="ovf step4"><!-- 해당 단계일 때 .on 추가 -->
                	<div class="date">
                    	<p><strong></strong></p>
                        <a href="javascript:;" class="prev" id="previous"><span class="ico_comm">이전</span></a>
                        <a href="javascript:;" class="next" id="next"><span class="ico_comm">다음</span></a>
                    </div>
                    <ul id="schedule">
                    </ul>
                </div>
                <a href="" class="btn_book">예매</a>
            </div>
		</div>
    </div>
      <!-- // container -->
	

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="/kobis/web/comm/commjs/gtag.js?id=UA-127072686-1"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'UA-127072686-1');
</script>

<!-- AceCounter Log Gathering Script V.8.0.AMZ2019080601 -->
 <script language='javascript'>
	var _AceGID=(function(){var Inf=['gtt6.acecounter.com','8080','AB2A31560820885','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src ="https://"+ Inf[0] +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
	var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src='https:'+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();
</script>
<noscript><img src='//gtt6.acecounter.com:8080/?uid=AB2A31560820885&je=n&' border='0' width='0' height='0' alt=''></noscript>	
<!-- AceCounter Log Gathering Script End -->

<script language='javascript'>
function familySite(){
   if (document.getElementById("familySite").value == "a2") {
	   window.open ("https://www.kofic.or.kr");
   } else if (document.getElementById("familySite").value == "a3") {
	   window.open ("https://www.kobis.or.kr/kobisopenapi/homepg/main/main.do");
   }
}
</script>

</div>
</body>
</html>
