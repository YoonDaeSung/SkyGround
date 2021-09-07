<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<!--홈화면 동영상 띄우는 스크립트  순서 바꾸면안됨 3개 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="resources/bootstrap/js/jquery.vide.js"></script>
<script src="resources/bootstrap/js/jquery.vide.min.js"></script>

<script src="resources/jsFile/jquery-3.2.1.min.js"></script>

<style>
	.jumbotron {
		/*margin-bottom 개인수정(간격없애기)  */
		background-image: url('homeMain.jpg');
		background-size: cover;
		text-shadow: black 0.3em 0.3em 0.3ssem;
		margin-bottom: 0px;
		margin-bottom: 0px;
		color: white;
		text-align: center;
	}
	
	.wrap {
		background-repeat: no-repeat;
		background-size: cover;
		width: 100%;
		height: 100%;
		position: relative;
		z-index: 10;
		
		animation-name : movie;
		animation-duration : 4s;
	}
	
	@keyframes movie {
		from{opacity: 0.2;}
		to {opacity: 1.0;}
	}
</style>

<title>SkyGround</title>

</head>
<title>SkyGround</title>
<body>
		<!-- header include -->
	<div>
		<jsp:include page="include/header.jsp" />
	</div>

	<!--home main 동영상  -->
	<div class="wrap" data-vide-bg="resources/image/homeImage/homeMainMovie1080p.mp4">

		<!-- 메인영상 비율조정을 위한 iframe -->
		<div>
			<iframe width="1000" height="950" frameborder="0"> </iframe>
		</div>

	</div>
	
	<!-- footer include -->
	<div>
		<jsp:include page="include/footer.jsp" />
	</div>
	
</body>
</html>