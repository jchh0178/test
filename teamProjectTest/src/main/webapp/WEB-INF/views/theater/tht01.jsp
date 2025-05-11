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
	<link href="${pageContext.request.contextPath}/resources/css/module.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/module.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
</head>
<body>
        <%@ include file="../main/header.jsp" %>

    <main>
    
    <div id="container">
    	<div id="contents">
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
<h3 id="wrapEvent"><img src="https://img.cgv.co.kr/R2014/images/title/h3_theater.gif" alt="THEATER"></h3>
<div class="sect-theater ">
        <h4 class="theater-tit" ><span style='margin:0 auto;' class="selectName"></span></h4>
<!--         <a href="/support/lease/default.aspx" class="round inred btn_lease"><span style="padding:0 14px;">단체/대관문의</span></a> -->
        
        <div class="wrap-theaterinfo">
            <div class="box-image">
                <div id="theater_img_container" class="thumb-image">
                
                		리스트 출력 부분
                
                
                
                </div>	<!-- theater_img_container  -->
            </div>
            <div class="box-contents">
                <div class="theater-info">
                    <span class="txt-info">서울특별시 강남구 강남대로 438 (역삼동)</span>
                    <!-- 최대 10개까지만 보여집니다 2 -->
<!--                     <span class="screentype"> -->
<!--                             <a href="/theaters/special/?regioncode=SCX&amp;theaterCode=0056" class="screenX">SCREENX</a> -->
<!--                     </span> -->
                </div>
               
            </div>
        </div>
    </div>    	
    	
    	
    	
    	
    	
    	
    	
    	</div>	<!-- contents -->
    
    </div>		<!-- container -->
    
   

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
					console.log("area", area);		//정상적으로 불러와지는지 확인
					var text =
						"<li class= >" 
						+
						"<a style='padding: 0 5px;' href='javascript:void(0);' class='theater_name' title='${area.theater_name}'>" 
                        +
                        area.theater_name 
                        +
                       "</a>" 
                       +
                   		"</li>";
                   		
					$('#ulcontent').append(text);

				
				});
				 $('.theater_name').on('click',  function() {
	                    var selectedName = $(this).text(); // 클릭된 텍스트
	                    $('.selectName').text(selectedName); // span에 출력 (ID는 원하는 대로 설정)
	                    $('#ulcontent li').removeClass('on'); // 기존 선택된 극장 스타일 제거
	                    $(this).parent('li').addClass('on'); // 현재 클릭된 극장 스타일 추가
	                });
					
// 				 if (region == '서울' && areaList.length > 0) {
// 	                    // "강변" 극장을 찾아서 선택
// 	                    areaList.forEach(function(area, index) {
// 	                        if (area.theater_name == '강변') {
// 	                            $('#ulcontent li').removeClass('on');
// 	                            $('#ulcontent li:eq('+index+')').addClass('on');
// 	                            $('.txt-info').text(area.theater_name);
// 	                            $('.selectName').text(area.theater_name);
// 	                            return false; // 찾았으면 반복 종료
// 	                        }
// 	                    });
				//이 둘로 인해서 자동으로 클릭 이벤트가 발생하긴 하나 반복적으로 클릭 이벤트가 발생해서 
				// 계속해서 ajax로인해 데이터가 불러들이는 현상이 발생하게 됨 
// 				$('.theater_region:first').trigger('click');
// 				$('.theater_name:first').trigger('click');
				
			},
			error: function() {
				alert('오류');
			}
		});
		
		
		$('.theater_region:contains("서울")').trigger('click');
		
		
		
		
	});
})



</script>





        
 
    
        <%@ include file="../main/footer.jsp" %>

    </main>
   
</body>
</html>