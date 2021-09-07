<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js" ></script>
<style>
	.all_img_box	{
	border-radius: 30px;
	box-shadow: 5px 5px 5px 5px rgba(0, 0, 0, 0.3);
	margin-top: 15px;
	}

	.info_img_box1 {
		width:55%;
		float: left;
		margin-bottom: 20px;
	}
		/* 	제목 */
		.info_text {
		font-size: 350%;
		font-weight: 900;
	}
			/* 번호 */
		.info_text_no {
		font-size: 90px;
		font-weight: 900;
		color:  #e0e0eb;
	}
	
	.info_img_box2 {
		width:55%;
		float: right;
	}
	
	/*  전체 폼  */
	.pension_info_body {
		padding-left: 60px;
		padding-right: 60px;
		margin-left: 9%;
		margin-right: 9%;
	}
	.pension_info_all {
		margin-top: 13%;
	}
</style>
<title>Insert title here</title>

</head>
<body>
	<div>
	<jsp:include page="../include/header.jsp"/>
	</div>
	
		<div class="pension_info_all">
				<div class="pension_info_body">
					<h1 style="font-size: 65px; font-weight: 1000; margin-left: 36%;">팬션 안내</h1>
					
					<br><br>
					
					<span class="info_img_box1"><img class="all_img_box" width="90%" height="auto" src="resources/image/pensionInfoImage/pension1.jpg">
					</span>
					
					<span>
						<span class="info_text_no">01</span>
						&nbsp;&nbsp;&nbsp;
						<span class="info_text">펜션 야경</span>
					</span>
					
					<br><br><br><br><br>
					<br><br><br><br><br>
					
					<span class="info_img_box2"><img class="all_img_box" width="70%" height="auto" src="resources/image/pensionInfoImage/pension2.jpg">
					</span>
					<br><br><br><br><br>
					<br><br><br><br><br>
					
					<h3 style="text-align: left; color:#7d7d7d;"><br>
					
					<br><br><br><br>
					<br><br><br><br>
					
					저희 SKYG팬션은<br>
					주변이 산으로 둘려 쌓여있으며, <br>
					인적이 없고 공기가 맑아<br>
					밤하늘의 별빛을 등불삼아 걷기 좋은 펜션 입니다.<br>
					도심을 떠나 밤하늘의 자연을 만끽하세요.
					</h3>
				</div>
				
					<br><br><br><br>
					<br><br><br><br>
					<hr>
		
				<div class="pension_info_body">
					
					<br><br>
					
					<span class="info_img_box1"><img class="all_img_box" width="90%" height="auto" src="resources/image/pensionInfoImage/bbq1.jpg">
					</span>
					
					<span>
						<span class="info_text_no" style="text-align: left;">02</span>
						&nbsp;&nbsp;&nbsp;
						<span class="info_text" style="text-align: left;">바베큐</span>
					</span>
					
					<br><br><br><br>
					<br><br><br><br>
					<br><br><br><br>
					<br><br><br><br>
					<br><br><br><br>
					
					<span class="info_img_box2"><img class="all_img_box" width="70%" height="auto" src="resources/image/pensionInfoImage/bbq2.jpg">
					</span>
					<br><br><br><br>
					<br><br><br><br>
						
					<h3 style="text-align: left; color:#7d7d7d;">
					<br><br><br><br>
					SKYG 팬션에서는 바베큐 파티에 쓸 도구들을<br>
					가족과 함께 연인과 함께 편하게 즐길 수 있도록,<br>
					대여 해드리고 있습니다. <br>
					야경을 바라보며, 가족과 연인과 맛있고 즐거운<br>
					바베큐를 즐겨보세요.
					</h3>
				</div>
					<br><br><br><br>
					<br><br><br><br>
					<hr>
				
				<div class="pension_info_body">
					
					<br><br>
					
					<span class="info_img_box1"><img class="all_img_box" width="90%" height="auto" src="resources/image/pensionInfoImage/beach.jpeg">
					</span>
					
					<span>
						<span class="info_text_no" style="text-align: left;">03</span>
						&nbsp;&nbsp;&nbsp;
						<span class="info_text" style="text-align: left;">주변 관광</span>
					</span>
					
					<br><br><br><br>
					<br><br><br><br>
					<br><br><br><br>
					<br><br><br><br>
					<br><br><br><br>
					
					<span class="info_img_box2"><img class="all_img_box" width="70%" height="auto" src="resources/image/pensionInfoImage/trees.webp">
					</span>
					<br><br><br><br>
					<br><br><br><br>
						
					<h3 style="text-align: left; color:#7d7d7d;">
					<br><br><br><br>
					펜션근처에는 손님께서 원하는 장소를 방문하여<br>
					휴식을 취할 관광지가 있습니다.<br>
					푸른초원의 대나무 숲, <br>
					푸르르고 광활한 바다 등이 있습니다.<br>
					자세한 내용은 주변관광지를 참고하세요
					</h3>
					
					<h4><a href="tourListF">주변관광지 보러가기</a></h4>
				</div>
		</div>
			<br><br><br><br>
			<br><br><br><br>
			<br><br><br><br>
			
			
	<div>
	<jsp:include page="../include/footer.jsp"/>
	</div>
</body>
</html>