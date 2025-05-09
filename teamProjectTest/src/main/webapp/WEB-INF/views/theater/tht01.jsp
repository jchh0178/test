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
</head>
<body>
        <%@ include file="../main/header.jsp" %>

    <main>
    
    
    
    <hr style="color:red">
    
        <div class="sect-common">
    <div class="favorite-wrap">
        <!-- 
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
         -->
<script type="text/javascript">
let sessionId;

$(function() {
	$('#favoriteTheaters a').on('click', function() {
		$('.sect-city').find('li').removeClass('on');
		document.getElementById('wrapEvent').scrollIntoView({ behavior: 'smooth' });
        var dataTh = $(this).data('th');
        $('.area-link').trigger('click', [dataTh, ]);
        $('#ulcontent>li').removeClass('on');
	});
});



</script>
        <div class="sect-city" style="display: flex; height: auto">
	        <ul>
			
				<li class="on">
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
	        <!-- 
	        <div class="area" style="position:absolute; top: 220px;">
				<ul id="ulcontent">
						<li class="">
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="강남">
			                    강남
			                    <span hidden="hidden">1</span>
			                    <input type="hidden" value="서울특별시 강남구 강남대로 438 (역삼동)">
			                </a>
			            </li>
			            
						<li class="">
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="홍대">
			                    홍대
			                    <span hidden="hidden">5</span>
			                    <input type="hidden" value="서울특별시 마포구 양화로 153 (동교동) 4층">
			                </a>
			            </li>
			            
						<li class="">
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="건대입구">
			                    건대입구
			                    <span hidden="hidden">9</span>
			                    <input type="hidden" value="서울시 광진구 아차산로 30길 26 몰오브케이 3층">
			                </a>
			            </li>
			            
						<li class="on">
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="대학로">
			                    대학로
			                    <span hidden="hidden">13</span>
			                    <input type="hidden" value="서울 종로구 대명길 (명륜동)">
			                </a>
			            </li>
			            
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="동대문">
			                    동대문
			                    <span hidden="hidden">17</span>
			                    <input type="hidden" value="서울시 중구 장충단로 13길 20 현대시티아울렛 10층">
			                </a>
			            </li>
			            
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="명동">
			                    명동
			                    <span hidden="hidden">21</span>
			                    <input type="hidden" value="서울특별시 중구 명동길 14 (명동)">
			                </a>
			            </li>
			            
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="압구정">
			                    압구정
			                    <span hidden="hidden">25</span>
			                    <input type="hidden" value="서울특별시 강남구 압구정로30길 45 (신사동)">
			                </a>
			            </li>
			            
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="여의도">
			                    여의도
			                    <span hidden="hidden">28</span>
			                    <input type="hidden" value="서울특별시 영등포구 국제금융로 10, 지하3층(여의도동)">
			                </a>
			            </li>
			            
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="용산아이파크몰">
			                    용산아이파크몰
			                    <span hidden="hidden">31</span>
			                    <input type="hidden" value="서울특별시 용산구 한강대로23길 55, 6층(한강로동)">
			                </a>
			            </li>
			            
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="area-link" title="청담">
			                    청담
			                    <span hidden="hidden">35</span>
			                    <input type="hidden" value="서울특별시 강남구 도산대로 323 (신사동)">
			                </a>
			            </li>
			             -->
			           
			
        </div>
    </div>
</div>
<script type="text/javascript">
$(function() {
	sessionId = $('#sessionId').val();
	$('#btn_set_my_favorite').on('click', function() {
		if(sessionId == null || sessionId == '') {
			alert('로그인 후 이용해주세요')
			return;
		}
		
		var regionList = $('.theater_region').map(function() {
		    return $(this).text();
		}).get();
		
		
		var text = `
			<div class="layer-wrap" style="margin-top: -253px; margin-left: -320px; position: fixed;">
		    <div class="popwrap" style="width:633px;">
		        <h1>자주 가는 극장 설정</h1>
		        <div class="pop-contents fav-cgv">
		        <!-- Contents Addon -->
		            <div class="sect-cgv-control">
		                <h2 class="hidden">선호하는 지역 및 영화관 선택</h2>
		                <p>영화관을 선택하여 등록해주세요. <strong>최대 5개까지</strong> 등록하실 수 있습니다.</p>
		                <p>
		                    <select id="theater_region" name="" title="자주가는 지역선택">                        
		                    	<option value="" selected="selected">지역선택</option>
		                    </select>	
		                    <select id="select_theater" name="" title="자주가는 극장선택">                        
		                    	<option value="" selected="selected">극장선택</option>
	                    	</select> 
		                    <button id="btn_add_favorite_theater" type="button" class="round inblack on"><span>선호하는 극장 추가</span></button>
		                </p>
		            </div>
		            <div class="sect-favorite-control">
		                <h2><strong></strong>님이 자주 가는 극장</h2>
		                <div class="theater-choice">
		                    <ul>
		                    </ul>
		                </div>
		            </div>
					<div class="set-btn fix-width">
		                <button type="submit" id="btnSave" class="round inred"><span>등록하기</span></button> 
		            </div>
	
		        <!-- //Contents Addon -->
		        </div>
		        <button id="btn_close" type="button" class="btn-close">자주가는 극장 팝업 닫기</button>
		    </div>
		</div>
		`
		$('body').append(text);
		
		regionList.forEach(function(list) {
			$('#theater_region').append(`<option value="${list}">${list}</option>`);
		})
		
		
 		var favth = regionList = $('#favoriteTheaters').find('em').map(function() {
 		    return $(this).text();
 		}).get();
		
		for(var i = 0; i < 5; i++) {
			var myTheater = favth[i] != null ? favth[i] : '';
			
			$('.theater-choice>ul').append(`
				<li class="none" style="margin:5px;">
                    <div class="box-polaroid">
                        <div class="box-inner">
                            <div class="theater" style="font-size:11px; text-align: center;">${myTheater}</div>
                            <button type="button" data-theater="${myTheater}" style="background: #e2e2e0 url(https://img.cgv.co.kr/R2014/images/common/ico/ico_close.png) no-repeat 6px 50%;">삭제</button>
                        </div>
                    </div>
                </li>
			`);
		}
		
	});
});

$(document).on('click', '#btnSave', function() {
	$('.btn-close').trigger('click');
})

$(document).on('click', '.box-inner>button', function() {
	var thList = $('.box-inner>button').not($(this)).map(function() {
        return $(this).data('theater'); // data-theater 속성 값 가져오기
    }).get();
	
	var deleteTh = thList.join(',');
	
	$.ajax({
		type : 'POST',
		url : "/teamproject/theater/myFavTheater",
		data : {'DELETE_TH': deleteTh , "MEM_ID":sessionId},
		success: function(result) {
			$('.theater-choice>ul').html('');
			for(var i = 0; i < 5; i++) {
				var myTheater = thList[i] != null ? thList[i] : '';
				$('.theater-choice>ul').append(`
					<li class="none" style="margin:5px;">
	                    <div class="box-polaroid">
	                        <div class="box-inner">
	                            <div class="theater" style="font-size:13px; text-align: center;">${myTheater}</div>
	                            <button type="button" data-theater="${myTheater}" style="background: #e2e2e0 url(https://img.cgv.co.kr/R2014/images/common/ico/ico_close.png) no-repeat 6px 50%;">삭제</button>
	                        </div>
	                    </div>
	                </li>
				`);
			}
			
		},
		error: function(e) {
			
		}
	});
});

let selectRegion;

// 자주가는 극장 추가할때 사용
$(document).on('change', '#theater_region', function() {
	selectRegion = $('#theater_region').val();
	$.ajax({
		type : 'get',
		url : "/teamproject/theater/getArea",
		data : {'TH_REGION': selectRegion},
		dataType: 'json',
		success: function(areaList) {
			$('#select_theater').html(`<option value="" selected="selected">극장선택</option>`);
			areaList.forEach(function(area) {
				$('#select_theater').append(`<option value="${area.TH_NAME}">${area.TH_NAME}</option>`)
			});
		},
		error: function() {
			alert('오류')
		}
	});//ajax 종료	
});

$(document).on('click', '#btn_add_favorite_theater', function() {
	var selectArea = $('#select_theater').val();
	
	$.ajax({
		type : 'post',
		url : "/teamproject/theater/myFavTheater",
		data : {'MEM_ID':sessionId, 'TH_NAME': selectArea},
		success: function() {
			var currtheater = $('.box-inner>.theater').filter(function() {
		        return $(this).text().trim() != '';
		    })
		    .map(function() {
		        return $(this).text().trim();
		    })
		    .get();
			
			$('.theater-choice>ul').html('');
			
			currtheater.push(selectArea);
			
			var setTheater = new Set(currtheater);
			currtheater = Array.from(setTheater);
			for(var i = 0; i < 5; i++) {
				var myTheater = currtheater[i] != null ? currtheater[i] : '';
				$('.theater-choice>ul').append(`
					<li class="none" style="margin:5px;">
	                    <div class="box-polaroid">
	                        <div class="box-inner">
	                            <div class="theater" style="font-size:13px; text-align: center;">${myTheater}</div>
	                            <button type="button" data-theater="${myTheater}" style="background: #e2e2e0 url(https://img.cgv.co.kr/R2014/images/common/ico/ico_close.png) no-repeat 6px 50%;">삭제</button>
	                        </div>
	                    </div>
	                </li>
				`);
			}
			
		},
		error: function(e) {
			if(e.responseText == "sizeOver") {
				alert('등록 할 수 있는 최대개수 초과')
			} else if(e.responseText == "notUpdate"){
				alert('이미 등록된 극장입니다');	
			}
		}
	});
});	



let region;
$(function() {
	// 특정 지역 선택시 극장을 띄우기 위해 사용 
	$('.region').on('click', function() {
		region = $(this).text();
		$('.sect-city li').removeClass();
		$(this).parent('li').addClass('on');
		
		$.ajax({
			type : 'get',
			url : "${pageContext.request.contextPath}/theater/ajaxList",
			data : {'region': region},
			dataType: 'json',
			success: function(areaList) {
				$('#ulcontent').html('');
				
				areaList.forEach(function(area) {
					var text =
						`
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="name" title="${area.name}">
			                    ${list}
			                    
// 			                    <span hidden="hidden">${area.name}</span>
// 			                    <input type="hidden" value="${area.name}">
			                </a>
			            </li>
			            `;
		            $('.txt-info').html(area.name);
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
      
        
        

			<!--  각 지점 공지 게시판 -->
    
        <%@ include file="../main/footer.jsp" %>

    </main>
   
</body>
</html>