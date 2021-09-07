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

<script src="resources/jsFile/reservation/rsvCheckJS.js"></script>

<title>SkyGround</title>
<style>
	.reserv_logo{
		text-align: center;
	}
	.reserv_table{
	border-color: #c9c9c9 !important;
	}
	
	.reserv_table th{
		text-align: center;
		background-color: #f0f0f0;
		width: 200px;
		border-color: #c9c9c9 !important;
		
	}
	
	.reserv_table td{
		border-color: #c9c9c9 !important;
		text-align: left;
		width: 600px;
		padding-top: 7px ; 
		padding-bottom: 7px;
		padding-left: 10px;
		padding-right: 10px;
	}
	.reserve_Btn{
	float: right;	
	}
	
	rsvBtn{
	width: 200px;
	height: 70px;
	}
	
	reserv_table th td {
	padding: 10px !important;
	border-color: #c9c9c9 !important;
	padding: 7px !important;
	height: 20px !important;
	}
	
	.onlyNumber, .onlyName {
	margin : 0px !important;
	padding : 0px !important;
	}
	
	.onlyName {
	width: 45.5% !important;
	}
	
	.hr_line{
	border: 1px solid #9c9c9c;
	}
</style>
</head>
<body>
		<div class="rsvStatus_body">
		<h1>예약내역 확인</h1>
		<c:forEach var="chkInfo" items="${chkInfo}">
		<input type="hidden" id="typeNum" value="${chkInfo.rm_num}">
		<input type="hidden" id="typeCode" value="${chkInfo.bk_code}">
		
		<br>
		<hr class="hr_line">
		<br>
		<table border="1" class="reserv_table" style="border: 1px solid #cfcfcf; width: 100%; vertical-align: middle;">
			<tr>
				<th>객실</th>
				<td id="typeNM">${chkInfo.rm_name}</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td id="period">
					${chkInfo.bk_date} ~ ${chkInfo.bk_days}
					<input type="hidden" id="startDay" value="${chkInfo.bk_date}">
					<input type="hidden" id="endDay" value="${chkInfo.bk_days}">
				</td>
			</tr>
			<tr>
				<th>숙박 인원</th>
				<td id="person">
					<c:choose>
						<c:when test="${chkInfo.bk_child == 0 && chkInfo.bk_infant != 0}">
							성인 = ${chkInfo.bk_adult}명, 아동/유아 = 없음, 영유아 = ${chkInfo.bk_infant}명
						</c:when>
						<c:when test="${chkInfo.bk_child != 0 && chkInfo.bk_infant == 0}">
							성인 = ${chkInfo.bk_adult}명, 아동/유아 = ${chkInfo.bk_child}명, 영유아 = 없음
						</c:when>
						<c:when test="${chkInfo.bk_child == 0 && chkInfo.bk_infant == 0}">
							성인 = ${chkInfo.bk_adult}명, 아동/유아 = 없음, 영유아 = 없음
						</c:when>
						<c:otherwise>
							성인 = ${chkInfo.bk_adult}명, 아동/유아 = ${chkInfo.bk_child}명, 영유아 = ${chkInfo.bk_infant}명
						</c:otherwise>
					</c:choose>
					<input type="hidden" id="personA" value="${chkInfo.bk_adult}">
					<input type="hidden" id="personC" value="${chkInfo.bk_child}">
					<input type="hidden" id="personI" value="${chkInfo.bk_infant}">
				</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>
					<span id="detailPrce">
						객실금액=
						<em id="roomPrce">
							<fmt:formatNumber type="number" value="${chkInfo.room_prce}" />  <!-- 콤마 찍 -->
						</em>원 + 
						
						인원추가금액=
						<em id="persPrce">
							<fmt:formatNumber type="number" value="${chkInfo.pers_prce}" /> 
						</em>원
					</span>
				</td>
			</tr>
			<tr>
				<th>
					합계금액			
				</th>
				<td>
					<em id="totPrce" style="color: #ff3535;">
						<fmt:formatNumber type="number" value="${chkInfo.bk_total}" />
					</em>원
				</td>
			</tr>
		</table>
		<br><br>
		<table border="1" class="reserv_table" style="border: 1px solid #cfcfcf; width: 100%; vertical-align: middle;">
			<tr>
				<th>예약자 명</th>
				<td>
					<span>${chkInfo.bk_name}</span>
				</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>
					<span>${chkInfo.bk_phone}</span>
				</td>
			</tr>
			<tr>
				<th>비상 연락처</th>
				<td>
					<span>${chkInfo.em_phone}</span>
				</td>
			</tr>
		</table>
	</c:forEach>
	<br>
	</div>
</body>
</html>