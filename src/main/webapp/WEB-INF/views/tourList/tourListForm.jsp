<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />

<!--이미지 슬라이딩 주기위한 부트스트랩 및 스크립트  -->
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="resources/jsFile/tourList/polaroid.js"></script>

<title>SkyGround</title>

<!-- 이미지 슬라이딩 css  -->
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
	}
	
	header {
		background-color: rgba(33, 33, 33, 0.9);
		color: #fff;
		display: block;
		font: 14px/1.3 Arial, sans-serif;
		position: relative;
		margin: 0 0 10px;
		padding: 0;
	}
	
	header h2 {
		font-size: 22px;
		margin: 0px auto;
		padding: 10px 0;
		width: 80%;
		text-align: center;
	}
	
	header a, a:visited {
		text-decoration: none;
	}
	
	.polaroid {
		width: 80%;
		margin-left: 10%;
		height: 170px;
		margin-top: 4% !important;
	}
	
	.polaroid-caption {
		text-align: center;
		/* height: 170px; */
	}
	
	img:hover{
		cursor: pointer;
	}
	
	.bg_image{
		background-image : url("resources/image/tourImage/main.jpg");
		background-size: cover; 
		width: 100%;
		height: 1000px;
		padding-top: 200px;
	}
</style>

<script type="text/javascript">

	jQuery(document).ready(function($) {
		$('.polaroid').polaroid({
			autoPlay : false,
			duration : 2000,
			rotationRange : {
				min : -7,
				max : 7
			},
			shadow : '5px 5px 3px rgba(0,0,0,0.2)',
			borderRadius : '2px'
				
		});
	});
</script>

</head>
<body>
	<div class="main_header">
		<jsp:include page="../include/header.jsp" />
	</div>
	
	<div class="bg_image ">
		<div class="polaroid polaroid-caption" id="polaroid">
			<img src="resources/image/tourImage/beach.jpg" width="600px" height="auto" data-caption="<h3>SKYG 해수욕장</h3>
				<h5>차량 5분거리</h5>
				<h4>
					푸르른 하늘을 연상시키는 쪽빛 바다를 배경으로 펼쳐지는
					경관이 정말 환상정입니다, 곳곳에는 갯바위 낚시도 할 수 있어
					가족단위로 조용히 보낼 수 있는 아담한 해수욕장입니다.
				</h4>"
			/>
			
			<img src="resources/image/tourImage/2.jpg" width="600px" height="auto" data-caption="<h3>보리암</h3>
				<h5>차량 20분거리</h5>
				<h4>
					상주리 금산 남쪽 봉우리에 있는 절로 전국의 3대 기도처이며 양양 낙산사 홍련암 강화군
					보문사와 함께 한국 3대 관세음보살 성지로 꼽힙니다, 보리암에서 내려다보는 남해의
					절경때문에 관광자원으로도 매우 훌륭한 사찰입니다.
				</h4>"
			/>
			
			<img src="resources/image/tourImage/hanryu.jpg" width="600px" height="auto" data-caption="<h3>한려해상 국립공원</h3>
				<h5>차량 15분거리</h5>
				<h4>
					한려해상국립공원은 1968년 우리나라에서 4번째이자 해상공원으로는 최초로 국립공원으로 지정되었다. 
					경남 거제시 지심도에서 전남 여수시 오동도까지 300리 뱃길을 따라 크고 작은 섬들과 천혜의 자연경관이 
					조화를 이루는 해양생태계의 보고이다.
				</h4>"
			/>
			
			<img src="resources/image/tourImage/4.jpg" width="600px" height="auto" data-caption="<h3>대나무 숲</h3>
				<h5>차량 15분거리</h5>
				<h4>
					자연이 감싸는 청정지역의 미세먼지 없는 대나무 숲입니다.
					팬션에서 휴식 후, 도시를 떠나 상쾌한 공기를 느끼고 싶을 때,
					대나무 숲으로 초대합니다.
				</h4>"
			/>
		</div>
	</div>
	
	<div>
		<jsp:include page="../include/footer.jsp" />
	</div>
	
</body>
</html>