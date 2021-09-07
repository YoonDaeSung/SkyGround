<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css" href='<c:url value="resources/css/rsvCSS.css"/>'>
<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js" ></script>
<script src="resources/jsFile/reservation/rsvJS.js"></script>

<title>SkyGround</title>

<style type="text/css">
	.resultArea	td, th {
		padding: 7px;
		width: 50px;
		height: 20px;
	}
		
	.rsv_main_form{
		width : 50%;
		border-collapse: collapse;
		align-content: center;
		border: 1px solid #cfcfcf;
		margin: 0 auto;
	}
</style>

</head>
<body>

	<jsp:include page="../include/header.jsp"/>
	
	<div class="wrap">
		<div id="resultArea">
			
			<!-- DB에서 가져온 데이터 저장. -->
			<div style="display: none;">
				<c:forEach var="rsvInfo" items="${rsvInfo}" varStatus="vs">
					<input type="text" class="cl_date" id="bk_date${vs.index}" value="${rsvInfo.BK_DATE}" 
						data-nprice="${rsvInfo.RM_NPRICE}" data-price="${rsvInfo.RM_PRICE}" 
						data-min_prs="${rsvInfo.RM_MIN_PRS}" data-max_prs="${rsvInfo.RM_MAX_PRS}">
					
					<input type="text" class="cl_days" id="bk_days${vs.index}" value="${rsvInfo.BK_DAYS}">
					
				</c:forEach>
			</div>
				
			<table class="calendar" id="calendar" border="1" style="margin-left: 36%; ">
				<tr> <!-- label은 마우스로 클릭을 편하게 해줌 -->
					<td style="text-align: left;">
						<label class="yymmdd" onclick="prevCalendar()" style="cursor: pointer;"> ≪ </label>
					</td>
					
					<td class="tbCalendar yymmdd" id="tbCalendarYM" align="center" colspan="5" style="font-size: 20px; font-weight: 900;">
						yyyy년 m월
					</td>
					
					<td style="text-align: right;">
						<label class="yymmdd" onclick="nextCalendar()" style="cursor: pointer;"> ≫ </label>
					</td>
				</tr>
				<tr>
					<th align="center" class="day">
						<font color="#F79DC2">일</font>
					</th>
					
					<th align="center" class="day">월</th>
					<th align="center" class="day">화</th>
					<th align="center" class="day">수</th>
					<th align="center" class="day">목</th>
					<th align="center" class="day">금</th>
					
					<th align="center" class="day">
						<font color="skyblue">토</font>
					</th>
				</tr>
			</table>
			
			<script type="text/javascript">
				buildCalendar();
			</script> <br><br>
			
			<!-- 선택한 객실 이름 -->
			<div class="roomtbl">
				<span>선택한 객실</span>&nbsp;&nbsp;
				<em id="typeNM">${roomNM.RM_NAME}</em>
				<input type="hidden" id="typeNum" value="${roomNum}">
			</div> <br><br>
			
			<!-- 기간 선택 -->
			<div>
				<table class="rsv_main_form">
					<tr>
						<td colspan="5" class="header">&nbsp;&nbsp;&nbsp;기간 선택</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>CHECK IN</td>
						<td>CHECK OUT</td>
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>
							<span class="checkIn">
								<span id="checkInDate"></span>
							</span>
						</td>
						<td>
							<span class="checkOut on">
								<span id="checkOutDate" class="on"></span>
							</span>
						</td>
						<td>&nbsp;</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td colspan="2">
							<select class="availableDays" id="availableDays" onchange="checkOutSel()" style="width: 400px;height: 30px;">
								<option>머무실 기간 선택</option>
							</select>
						</td>
					</tr>
				</table>
			</div> <br><br>
			
			<!-- 인원 -->
			<div>
				<table class="rsv_main_form">
					<tr>
						<td colspan="3" class="header">&nbsp;&nbsp;&nbsp;인원</td>
					</tr>
					
					<tr>
						<td  class="maine_td">&nbsp;&nbsp;&nbsp;성인</td>
						<td  class="maine_td">아동 유아</td>
						<td  class="maine_td">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;영유아</td>
					</tr>
					
					<tr>
						<td>&nbsp;&nbsp;&nbsp;
							<select class="maine_box" id="sel_adult" onchange="add_peopleRate()">
								<option value="1" data-cost="0">1</option>
								<option value="2" data-cost="0" selected="selected">2</option>
							</select>
						</td>

						<td>
							<select class="maine_box" id="sel_child" onchange="add_peopleRate()">
								<option data-cost="0">선택</option>
								<option value="0" data-cost="0">없음</option>
								<option value="1">1</option>
								<option value="2">2</option>
							</select>
						</td>
						
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<select class="maine_box" id="sel_infant">
								<option>선택</option>
								<option value="0">없음</option>
								<option value="1">1</option>
								<option value="2">2</option>
							</select>
						</td>
					</tr>
				</table>
			</div> <br><br>
			
			<!-- 옵션 선택 -->
			<div>
				<table class="rsv_main_form">
					<tr>
						<td colspan="4" class="header">&nbsp;&nbsp;&nbsp;옵션 선택</td>
					</tr>
					<tr>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="checkbox" id="chkBarbecue">
						</td>
						
						<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							바베큐 그릴(20,000원)
						</td>
						
						<td>
							<select id="selBarbecue" onchange="optionChk()">
								<option value="0">선택</option>
								<option value="20000">1SET</option>
								<option value="40000">2SET</option>
								<option value="60000">3SET</option>
								<option value="80000">4SET</option>
								<option value="100000">5SET</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div> <br><br>
			
			<!-- 금액 -->
			<div>
				<table class="rsv_main_form">
					<tr>
						<td colspan="3" class="header">
							&nbsp;&nbsp;&nbsp;금액
						</td>
					</tr>
					
					<tr>
						<td class="maine_td">
							&nbsp;&nbsp;&nbsp;객실 금액 :
						</td>
						<td class="maine_td">
							<span id="room_cost">0</span>원
						</td>
						<td rowspan="4" class="maine_td">총금액 <br>
							<span id="total_cost"  class="maine_td">0</span>원
						</td>
					</tr>
					
					<tr>
						<td class="maine_td">&nbsp;&nbsp;&nbsp;
							인원 추가 금액 :
						</td>
						<td>
							<span id="people_cost" class="maine_td">0</span>원
						</td>
					</tr>
					
					<tr>
						<td class="maine_td">&nbsp;&nbsp;&nbsp;옵션금액 :</td>
						<td>
							<span id="option_cost"  class="maine_td">0</span>원
						</td>
					</tr>
					
					<tr>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
			
		</div>
		<div class="btn btn-info" id="nextBtn" onclick="next_btn()" 
			style="cursor: pointer; margin-left: 70.5%; margin-top: 2%;"> 다음 단계
		</div>
			
	</div> <br><br><br><br><br>
	
	<div>
		<jsp:include page="../include/footer.jsp"/>
	</div>
	
</body>
</html>