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

<script src="resources/jsFile/reservation/rsvAddJS.js"></script>

<style>
	.rsvAdd_body {
		margin-left: 15%;
		margin-right: 15%;
		margin-top: 13%;
		margin-bottom: 5%;
	}
	
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
</style>
<title>SkyGround</title>
</head>
<body>	
	<div class="rsvAdd_body">
			<form>
					<h1 class="reserv_logo">예약 최종확인</h1>
					<hr>
			<h3>
				<span style="float: left;">01</span>&nbsp;
				<span>선택사항 확인</span>
			</h3>
			
			<input type="hidden" id="typeNum" value="${addInfo.rm_num}">
			
			<table border="1" class="reserv_table" style="border: 1px solid #cfcfcf; width: 100%; vertical-align: middle;">
				<tr>
					<th>객실</th>
					<td id="typeNM">${addInfo.rm_name}</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td id="period">
						${addInfo.bk_date} ~ ${addInfo.bk_days}
						<input type="hidden" id="startDay" value="${addInfo.bk_date}">
						<input type="hidden" id="endDay" value="${addInfo.bk_days}">
					</td>
				</tr>
				<tr>
					<th>숙박인원</th>
					<td id="person">
						<c:choose>
							<c:when test="${addInfo.bk_child == 0 && addInfo.bk_infant != 0}">
								성인 = ${addInfo.bk_adult}명, 아동/유아 = 없음, 영유아 = ${addInfo.bk_infant}명
							</c:when>
							<c:when test="${addInfo.bk_child != 0 && addInfo.bk_infant == 0}">
								성인 = ${addInfo.bk_adult}명, 아동/유아 = ${addInfo.bk_child}명, 영유아 = 없음
							</c:when>
							<c:when test="${addInfo.bk_child == 0 && addInfo.bk_infant == 0}">
								성인 = ${addInfo.bk_adult}명, 아동/유아 = 없음, 영유아 = 없음
							</c:when>
							<c:otherwise>
								성인 = ${addInfo.bk_adult}명, 아동/유아 = ${addInfo.bk_child}명, 영유아 = ${addInfo.bk_infant}명
							</c:otherwise>
						</c:choose>
						<input type="hidden" id="personA" value="${addInfo.bk_adult}">
						<input type="hidden" id="personC" value="${addInfo.bk_child}">
						<input type="hidden" id="personI" value="${addInfo.bk_infant}">
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td>
						<span id="detailPrce">
							객실 금액&nbsp;=
							<em id="roomPrce"><fmt:formatNumber value="${addInfo.room_prce}" groupingUsed="true" /> </em>원 + 
							
							인원추가금액&nbsp;=
							<em id="persPrce"><fmt:formatNumber value="${addInfo.pers_prce}" groupingUsed="true" /></em>원 + 
							
							옵션추가금액&nbsp;=
							<em id="optionPrce"><fmt:formatNumber value="${addInfo.bk_option}" groupingUsed="true" /></em>원 
						</span>
					</td>
				<tr>
					<th>합계금액</th>
					<td>
						<span>
							<em id="totPrce" style="color: #ff3535;"><fmt:formatNumber value="${addInfo.bk_total}" groupingUsed="true" /></em>원
						</span>
					</td>
				</tr>
			</table>
			
			<h3>
				<span style="float: left;">02</span>&nbsp;
				<span>개인정보 입력</span>
			</h3>
			
			<table border="1" class="reserv_table" style="border: 1px solid #cfcfcf; width: 100%; vertical-align: middle;">
				<tr>
					<th>이름</th>
					<td>
						<c:if test="${loginUser == null }">
							<input class="onlyName" type="text" name="rsv_NM" id="rsv_NM">
							<input type="hidden" name="rsv_email" id="rsv_email" value="guest">
						</c:if>
						<!-- 로그인한 사용자 이면 -->
						<c:if test="${loginUser != null }">
							<input class="onlyName" type="text" name="rsv_NM" id="rsv_NM" value='${loginUser.name}'>
							<input type="hidden" name="rsv_email" id="rsv_email" value='${loginUser.email}'>
						</c:if>
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="rsv_tel1" id="rsv_tel1" maxlength="3" class="onlyNumber" style="width: 80px"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						<span>-</span>
						<input type="text" name="rsv_tel2" id="rsv_tel2" maxlength="4" class="onlyNumber" style="width: 80px"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						<span>-</span>
						<input type="text" name="rsv_tel3" id="rsv_tel3" maxlength="4" class="onlyNumber" style="width: 80px"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					</td>
				</tr>
				<tr>
					<th>비상 연락처</th>
					<td>
						<input type="text" name="rsv_em_tel1" id="rsv_em_tel1" maxlength="3" class="onlyNumber" style="width: 80px"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						<span>-</span>
						<input type="text" name="rsv_em_tel2" id="rsv_em_tel2" maxlength="4" class="onlyNumber" style="width: 80px"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						<span>-</span>
						<input type="text" name="rsv_em_tel3" id="rsv_em_tel3" maxlength="4" class="onlyNumber" style="width: 80px"
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					</td>
				</tr>
			</table>
			<br><br>
			<div class="reserve_Btn">
			<div id="rsvBtn" class="btn btn-info rsvBtn">객실예약</div>
			</div>
		</form>
	</div>
	
</body>
</html>