<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/jsFile/jquery-3.2.1.min.js" ></script>
<script src="resources/jsFile/calender/claenderJS.js"></script>

<link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
<link rel="stylesheet" type="text/css" href='<c:url value="resources/css/calendar/calendarCSS.css"/>'>

<title>SkyGround</title>

</head>
<body>
	<!-- header include -->
	<div>
		<jsp:include page="../include/header.jsp" />
	</div>
	
	<!-- DB에서 가져온 데이터 저장. -->
	<div class="wrap">
		<div style="display: none;">
			<c:forEach var="mm" items="${mm}" varStatus="vs">
				<input type="text" class="cl_date" id="bk_date${vs.index}" value="${mm.bk_date}">
				<input type="text" id="rm_name${vs.index}" value="${mm.rm_name}">
				<input type="text" id="bk_dayss${vs.index}" value="${mm.bk_days}">
			</c:forEach>
			
			<c:forEach var="rmList" items="${rmList}" varStatus="vs">
				<input type="text" id="rmList_name${vs.index}" name="rml_name" value="${rmList.rm_name}">
			</c:forEach>
		</div>
		
		<h3 align="center" style="font-style: italic;" >예약 현황</h3>
		<div class="reservation_text">
			<span class='bookable'>가</span><span>예약 가능</span><br>
			<span class='finish'>완</span><span>예약 완료</span> <br>
		</div>
		
		<table class="calender_table" id="calendar" border="1" style="border-color: #e0e0e0;">
			<tr>
				<!-- label은 마우스로 클릭을 편하게 해줌 -->
				<th class="yymmdd"><label onclick="prevCalendar()">◀</label></th>
				<th  align="center" id="tbCalendarYM" class="yymmdd" colspan="5">yyyy년 m월</th>
				<th class="yymmdd"><label onclick="nextCalendar()">▶</label></th>
			</tr>
			<tr>
				<th align="center" class="day"><font color ="#F79DC2">일</font></th>
				<th align="center" class="day">월</th>
				<th align="center" class="day">화</th>
				<th align="center" class="day">수</th>
				<th align="center" class="day">목</th>
				<th align="center" class="day">금</th>
				<th align="center" class="day"><font color ="skyblue">토</font></th>
			</tr> 
		</table>
	
		<script type="text/javascript">
			buildCalendar();
		</script> <br><br><br>
		
<div id="infoTbl" class = "infoTbl" style="display: none;">

		
			<!-- 반 복 문 구 간  -->
			
			<c:forEach var='list' items="${roomInfo}" varStatus="vs">
				<c:if test="${vs.index == 0}">
					<c:set var="rm" value="0"></c:set>
				</c:if>
				
				<c:if test="${rm != list.rm_num && vs.index >= 0}">
					<c:set var="rm" value="${list.rm_num}"></c:set>
					<div style="display: none;">
						<span id="rm_num${vs.index}">${list.rm_num}</span>
					</div>
				
					<table>
						<thead>
							<tr>
								<th></th>
								<th colspan="2">&nbsp;</th>
								<th colspan="2">&nbsp;</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<!-- 체크 박스 키우기 -->
								<td rowspan="5">
									<!-- <div style="display: none;"> -->
										<input style="border-color:black; width: 25px; height: 25px; margin-right: 20px;" type="checkbox" class="${list.rm_name}" class="apple" id="rmChk" name="rmChk" 
											value="${vs.index }" onclick="rsv_check();" disabled>
									<!-- </div> -->
								</td>
								
								<!-- 이미지  -->
								<td rowspan="5"><img src="resources/image/${list.rm_image}" class ="imgbox"></td>
								<!-- 룸 이름 -->
								<td rowspan="2">
									&nbsp;<span class="maine">${list.rm_name}</span>
								</td>
								
							</tr>
							
							<tr>
								<td rowspan="2"><span class="maine">숙박 기간</span></td>
								<td rowspan="2"><span class="maine">추가 인원</span></td>
								<td rowspan="2"><span class="maine">총 가격</span></td>
							</tr>
							
							<tr>
								<!-- 인원수 -->
								<td  class="maine"><span id="prs${vs.index }">${list.rm_min_prs }/${list.rm_max_prs }</span>명</td>
							</tr>
							
							<tr>
								<!-- 고정 금액 -->
								<td rowspan="2" class="choice"><span class="cl_nprice" id="rm_npri${vs.index }">${list.rm_nprice }</span>원</td>
								
								<!-- 기간 선택 박스 Start -->
								<td rowspan="2" class="maine_selert">
									<select id="bk_days${vs.index}" class ="bk_days" name="bk_days" 
										onchange="dtransfer(this.value, ${vs.index})" style="width: 90px; height: 40px;">
										<option value="1">기간 선택</option>
										
										<c:forEach var= "i" begin="1" end ="${list.rm_max_prs}" step="1" >
											<option value='${i}'>${i}일</option>
										</c:forEach>
									</select> &nbsp;
								</td>
								<!-- 기간 선택 박스 END -->
								
								<!-- 인원 선택 박스 Start -->
								<td rowspan="2" class="maine_selert">
									<select id="bk_adult${vs.index }" class ="bk_adult" name="bk_adult" 
										onchange="itransfer(this.value,${vs.index })" style="width: 90px;height: 40px;">
										<option value="0" >인원 선택</option>
										
										<c:forEach var= "i" begin="1" end ="${list.rm_max_prs}" step="1">
											<option value='${i}'>${i}명</option>
										</c:forEach>
									</select>
								</td>
								<!-- 인원 선택 박스 END -->
								
								<!-- 변동 금액,최종 금액 -->
								<td rowspan="2" class="choice">
									<span class="cl_nprice" id="rm_npricez${vs.index }">${list.rm_nprice }</span>원
								</td>
							</tr>
							
							<tr></tr>
							<tr>
								<td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
								<td>&nbsp;
								<input type="text" readonly="readonly" id="foucs_rname" style="background: none; height:0px;">
								
								</td>
							</tr>
						</tbody>
					</table>
				
				
					<!-- 금액 불러올 데이터 (숨김)hidden -->
					<input type="hidden" id="rm_nprice_in${vs.index}" value="${list.rm_nprice }">
					<span class="roomPayNow" ></span> <br>
					<hr class ="line">
				</c:if>
			</c:forEach>
			<!-- 반 복 문 종 료 -->
		
			<!-- 최종 내역 -->
			<form>
				<div class="divfinal"> <br>
					<table>
						<tr>
							<th class="final">
								시작 일&nbsp;:&nbsp;<span id="dstart"></span> <br>
							</th>
							<th class="final">
								&nbsp;&nbsp;&nbsp;&nbsp;종료 일&nbsp;:&nbsp;<span id="dend"></span> <br>
							</th>
						</tr>
						
						<tr>
							<td class="final"> <br>
								<span class="test">선택 객실 이름&nbsp;:</span>
							</td>
							<td class="final"> <br>
								&nbsp;&nbsp;&nbsp;&nbsp;<span id=droom></span>
							</td>
						</tr>
						
						<tr>
							<td class="final"> <br>
								<span>객실 이용 금액 :</span>
							</td>
							<td class="final"> <br>
							<span id ="room_amount"></span>원
							</td>
						</tr>
						
						<tr>
							<td class="final"> <br>
								<span>인원 추가 금액 :</span>
							</td>
							<td class="final"> <br>
								<span id ="sadditional"></span>원
							</td>
						</tr>
						
						<tr>
							<td class="final">
								<hr class="finalline"><span>최종 이용 금액 :</span>
							</td>
							<td class="final">
								<hr class="finalline"><span id ="rm_npricez"></span>원
							</td>
						</tr>
					</table>
				</div> <br><br><br>
				
				<!-- 예약 버튼 -->
				<div class="rsv_check_td">
					<input type="button" id="book_btn" class = "btn" value="예약하기" style="margin-left: 730px;">
				</div> <br><br><br><br><br>
			</form>
		</div>
	</div> <!-- class="wrap" -->

	<div>
		<!-- footer include -->
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>
