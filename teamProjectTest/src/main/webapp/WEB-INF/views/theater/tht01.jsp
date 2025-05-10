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
						`
						<li>
		                    <a style="padding: 0 5px;" href="javascript:void(0);" class="theater_name" title="${area.theater_name}">
		                    [ID: ${area.theater_id}]${area.theater_name}

			                </a>
			            </li>
			            `;
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
      
        
        

			<!--  각 지점 공지 게시판 -->
    
        <%@ include file="../main/footer.jsp" %>

    </main>
   
</body>
</html>