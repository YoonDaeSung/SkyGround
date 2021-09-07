<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js" ></script>

<script src="resources/jsFile/reservation/rsvCheckJS.js"></script>
<style>
	.rsvCheck_body{
		box-shadow: 3px 3px 3px 3px rgba(0, 0, 0, 0.15);
		border-radius: 5px;
		width: 40%;
		margin: 0 auto;
		margin-top: 13%;
		margin-bottom: 10%;
		padding: 20px;
	}
	
	.check_text_box {
		width: 75% !important;
	}
</style>
<title>SkyGround</title>
</head>
<body>
		<!-- header include -->
	<div>
		<jsp:include page="../include/header.jsp" />
	</div>
	
	<div class="rsvCheck_body">
		<form>
			<div id="resultArea" style="text-align: center;">
				<h1>예약 조회</h1>
				<hr>				
				<div>예약자 명 또는 가입한 이메일</div> <br>
				
				<div>
					<input type="radio" name="typeNM" value="N"> 예약자 명 &nbsp;&nbsp;&nbsp;&nbsp;
					<input type="radio" name="typeNM" value="E"> 이메일
				</div> <br>
				
				<div>
					<input class="check_text_box" type="text" id="rsvNM" placeholder=" 예약자 명 또는 이메일을 입력해주세요.">
				</div> <br><br>
				
				<div>휴대폰 번호</div>
				<div>
					<input class="check_text_box" type="text" id="rsvPhone" placeholder=" '-' 없이 숫자만 입력">
				</div> <br><br>
				
				<input class="btn btn-info" type="button" id="askBtn" value="예약조회">
			</div>
		</form>
	</div>
	<!-- footer include -->
	<div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>