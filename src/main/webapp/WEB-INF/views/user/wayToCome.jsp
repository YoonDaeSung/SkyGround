<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyGround</title>
	<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js">
	</script>
<style>
	.wayF_bg {
		padding-top: 5%;
		padding-bottom: 5%;
		background-image: url("resources/image/wayImage/wayToCome_bg.jpg"); 
		background-size: cover;
	}
	.wayF_body	{
		margin-top: 10%;
		margin-left: 10%;
		margin-right: 10%;
		margin-bottom: 0px !important;
	}
	
</style>

</head>
<body>
	<div>
	<jsp:include page="../include/header.jsp"/>
	</div>
		<div class="wayF_bg">
			<div class="wayF_body">
				<h1 style="font-weight: 600;">오시는 길</h1>
				<h2>경기도 성남시 분당구 돌마로 46 광천프라자 5층 </h2>
				<h3>010-1234-4321</h3> 
				<a class="btn btn-info" href="https://map.kakao.com/?eX=606208&eY=1202762&eName=%EA%B7%B8%EB%A6%B0+%EC%BB%B4%ED%93%A8%ED%84%B0">차량으로 위치검색</a>
				
				<br><br><br>
				
				<div id="daumRoughmapContainer1561881679385" class="root_daum_roughmap root_daum_roughmap_landing"></div>
				<!--  다음 맵 스크립트 스크립트 위로 올리면, 오류뜸 위로올리기x, 순서도 바꾸기X -->
				<script charset="UTF-8">
					new daum.roughmap.Lander({
						"timestamp" : "1561881679385",
						"key" : "u5i4",
						"mapWidth" : "640",
						"mapHeight" : "360"
					}).render();
				</script>
				
				<br><br>
				<span>
				<h2><img width="60px;" src="resources/image/wayImage/carWay.jpg">[자가용 오시는 길]</h2><br>
				남해고속도로를 따라 약 350m 이동 → 계천사거리에서 ‘상주, 남해’ 방면으로<br>
				좌회전 → 섬진강대로를 따라 약 9km 이동 → 남해대교삼거리에서 ‘미조, 남해’<br>
				방면으로 우회전 → 섬진강대로를 따라 약 4km 이동 → 터널 진입 후 남해대로를<br>
				따라 약 10km 이동 → 심천삼거리에서 ‘미조, 상주’ 방면으로 좌회전 → 남해대로를<br>
				따라 약 1km 이동 → 남해지하차도 진입 후 남해대로를 따라 약 500m 이동 후<br>
				1시 방향 → 스포츠로를 따라 약 3.5km 이동 후 1시 방향 → 스포츠로를 따라<br>
				약 3km 이동 → 서상삼거리에서 ‘남면, 두곡, 사촌’ 방면으로 좌회전 → <br>
				남서대로를 따라 약 2km 이동 → SkyG Pension<br><br>
				
				<h2><img width="60px;" src="resources/image/wayImage/busWay.jpg">[대중교통  오시는 길]</h2><br>
				남해고속도로를 따라 약 1km 이동 → 상편사거리에서 ‘남해, 서포’ 방면으로 좌회전 →<br>
				경충로를 따라 약 14.5km 이동 → 터널 진입 후 남해대로를 따라 약 10km 이동 →<br>
				심천삼거리에서 ‘미조, 상주’ 방면으로 좌회전 → 남해대로를 따라 약 1.3km 이동 →<br>
				남해지하차도 진입 후 남해대로를 따라 약 500m 이동 후 1시 방향 → 스포츠로를 따라<br>
				약 3km 이동 후 1시 방향 → 스포츠로를 따라 약 3km 이동 후 1시 방향 → 스포츠로를<br>
				따라 약 3km 이동 → 서상삼거리에서 ‘남면, 두곡, 사촌’ 방면으로 좌회전 →<br>
				남서대로를 따라 약 2km 이동 → SkyG Pension
				</span>
			</div>
		</div>
		
		<br><br><br>
		<br><br><br>
		<br><br><br>
		
	<div>
	<jsp:include page="../include/footer.jsp"/>
	</div>
</body>
</html>