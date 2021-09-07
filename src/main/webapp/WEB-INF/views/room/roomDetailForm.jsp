<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='resources/css/room/detailCSS.css'/>">
<link rel="stylesheet" href="<c:url value='resources/css/room/js-image-slider.css'/>">
<link rel="stylesheet" href="<c:url value='resources/css/room/generic.css'/>">

<!-- Script -->
<script src="resources/jsFile/jquery-3.2.1.min.js" ></script>
<script src="resources/jsFile/room/roomJS.js"></script>
<script src="resources/jsFile/room/js-image-slider.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:500,700&display=swap&subset=korean" rel="stylesheet">
<style>
.sunflower{
	font-family: Sunflower;
	
}
</style>
<title>SkyGround</title> 
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<div class="wrap" style="height: 1400px;">
		<form style="margin-top: 200px">
			
			<c:forEach var="dt" items="${detailR}" varStatus="vs">
				<c:if test="${vs.index == 0}">
					<c:set var="rm" value="0"></c:set>
					<div class="sunflower" style="text-align: center; letter-spacing: 15px; font-size: 32pt;">
						<em>${dt.rm_name}</em>
					</div>
				</c:if>
			</c:forEach>
			<br><br>
<!-- 슬라이드 쇼 -->
<!-- 이미지 크기 : 1608x600 -->
		<div class="line_bottom">
			<div id="sliderFrame">
				<div id="slider">
					<c:forEach var="dt" items="${detailR}">
						<img src="resources/image/${dt.rm_image}" style="width: 100%; height: 100%;">
					</c:forEach>
				</div>
			</div>
			
<!-- 작은 이미지 -->
				<div id="thumbs">
					<c:forEach var="dt" items="${detailR}">
						<div class="thumb">
							<img src="resources/image/${dt.rm_image}">
						</div>
					</c:forEach>
				</div> <br>
		  </div>
			<c:forEach var="dt" items="${detailR}" varStatus="vs">
				<c:if test="${vs.index == 0}">
					<c:set var="rm" value="0"></c:set>
					<div class=" bg1 text-center">
<!-- 아이콘  -->
					<div class="line_bottom bg-2 text-center">
					  <h3><strong>객실 내부 시설</strong></h3>
					  <p class="p">
					  	<img class="icon" src="resources/image/icon/computer.png">
					  	<img class="icon" src="resources/image/icon/fastinternet.png">
					  	<img class="icon" src="resources/image/icon/airconditional.png">
					  	<img class="icon" src="resources/image/icon/food.png">
					  	<img class="icon" src="resources/image/icon/refregirator.png">
					  	<img class="icon" src="resources/image/icon/bed.png">
					  	<img class="icon" src="resources/image/icon/heater.png">
					  	<img class="icon" src="resources/image/icon/dolby.jpg">
					  </p>
					</div>
					  <div class="dtcontainer">
							  <h2>객실 정보 </h2>
							  <br><br>
							  <table class="table">
							    <thead>
							      <tr>
							        <th>비 성수기</th>
							        <th>성수기 </th>
							        <th>최소 인원</th>
							        <th>최대 인원</th>
							        <th>객실 규모(㎡)</th>
							        <th>객실 규모(평)</th>
							        <th>객실 구조</th>
							      </tr>
							    </thead>
							    <tbody>
							      <tr>
							        <td>${dt.rm_nprice}원</td>
							        <td>${dt.rm_price}원</td>
							        <td>${dt.rm_min_prs}인</td>
							    	<td>${dt.rm_max_prs}인</td>
							    	<td>${dt.rm_size}㎡ </td>
							    	<td>${dt.rm_pyeong}평</td>
							    	<td>${dt.rm_strt}</td>
							      </tr>
							    </tbody>
							 </table>
						</div>
					</div>
		    	</c:if>
			</c:forEach>
		</form> 
	</div>
	<!-- Image Slider -->
	
	<div style="cursor: pointer; border: 1px solid; width: 100px; border:0px; margin-left: 45.5%; margin-bottom: 4%; ">
      <a style="height: 70px;" class="btn btn-info" href="getRsv?rm_num=${roomNum.rm_num}"><h3>예약하러 가기</h3></a>
   </div>
	
	<!-- TOP -->
	<button id="topBtn" title="Go to top">TOP</button>
	
	<!-- footer include -->
	<div>
		<jsp:include page="../include/footer.jsp" />
	</div>
	
</body>
</html>