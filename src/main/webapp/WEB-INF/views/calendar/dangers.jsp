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
<link rel="stylesheet" type="text/css" href='<c:url value="resources/css/dangersCSS.css"/>'>
<title>SkyGround</title>
<style>
 
</style>
</head>
<body>
	<div>
	<jsp:include page="../include/header.jsp" />
	</div>
<div class="dangers_body">
<span class="number">1</span><span style="font-size: 30px; font-weight: 900;">객실이용시 확인사항</span>
<div class="dangers_list">
<li style="color: red">Check-In 시간은 PM 3시~7시까지 이며, Check-Out 시간은 AM 11시까지 입니다. (입, 퇴실 시간 변경 불가)</li>
<li>실내흡연을 절대 금지하고 있습니다. 흡연시 강제 퇴실조치 및 다음날 숙박료가 청구되오니 이점 양지해주시기 바랍니다.</li>
<li>쾌적한 객실사용을 위해 객실 내에서 생선, 육류 등을 굽거나, 튀김등 기름기가 많은 음식조리를 금지합니다.</li>
<li>화재 위험으로 인해 LED 티라이트 이외의 인화성 초 및 불꽃놀이, 부탄가스를 포함한 각종 캠핑장비는 사용을 절대 금합니다.</li>
<li>풍선 및 각종 파티용품의 부착을 금지하며, 이를 어길 시 원상복구를 요합니다.</li>
<li style="color: red">객실 이용정원은 숙박인원이 아닌 입실 인원 기준입니다. 실제 객실 사용 인원의 예약 인원 초과 시 취소로 간주되며 퇴실조치 됩니다. (환불불가)</li>
<li>반려동물은 고객님들의 편안한 휴식을 위하여 입실 할 수 없습니다.</li>
<li>미성년자는 보호자 없이 투숙이 불가능합니다.</li>
<li>부주의로 인한 각종 안전사고, 귀중품 분실 및 파손에 대해서 The View 1151은 책임지지 않습니다.</li>
<li>실내외 시설물 훼손, 파손, 분실시에는 변상하셔야 합니다. 문제가 생길시 바로 직원에게 알려주시기 바랍니다.</li>
<li>고성방가 및 무분별한 음주로 인해 타객실 손님에게 피해를 주어 문제가 될 경우 부득이하게 퇴실조치 될 수 있으니 이점 양해 바랍니다.</li>
<li style="color: red">The View 1151에 아동의 동반시, 필히 아동안전에 보호자의 각별한 주의를 부탁드립니다.</li>
<li style="color: red">수영장 이용 시, 안전사고 예방을 위해 각 객실의 제한인원(예약인원)을 엄수해주시기 바라며, 아동의 수영장 이용 시 꼭 보호자와 동반하여 이용해 주시기 바랍니다.</li>
<li>산책로 이용 시, 안전사고 예방을 위해 일몰 후의 이용 안전에 주의하여 주시기 바랍니다. 고객님의 안전을 위해 갯바위를 통한 바다 입수를 금하며 저녁 10시 이후의 산책로 이용을 금지합니다.</li>
<li>수영장 및 스파 이용시 입욕제, 꽃잎 , 거품목욕제 및 기타 다른 이물질은 스파 고장의 원인이 되어 사용을 금지하고 있습니다.</li>
<li>풀빌라 투숙고객님들의 프라이버시 보호를 위해 사전 동의되지 않은 드론 비행 및 일체 행위를 금지 합니다.</li>
<li>상업적인 촬영 및 작품제출용 촬영 , 사진동호회영상동호회 등에서 촬영을 하실 때는 사전에 문의 하시기 바랍니다.<br>&nbsp;&nbsp;&nbsp;&nbsp;
(사전협의 없이 촬영을 목적으로 객실을 예약하면 입실이 거부되며, 당일 예약취소와 동일적용 됩니다.)</li>
<li>사용하신 식기와 집기류는 세척 해주셔야 합니다. 음식물 쓰레기 및 각종 쓰레기는 객실 내 비치된 시설에 분리수거해 주시면 됩니다. (Check Out시 별도 확인)</li>
<li>더뷰 1151의 수영장은 해양 암반수를 사용합니다. 바닷물은 아니지만 염도가 있으며, 담수에 비해 천연적인 소독이 가능하며, 수질적으로도 여러 장점이 있는 물을 사용합니다.</li>
<li style="color: red"> 온수 이용은 정해진 기간에만 선택 가능하십니다. 온수풀 운영기간에는 온수 옵션 미선택 시 수영장 운영이 불가함을 알려드립니다.</li>
<li style="color: red">12~2월 혹한기에는 보다 만족스러운 온수 이용을 위해 POOLVILLA 2, 4호 객실만 온수풀의 신청과 이용이 가능하십니다. <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;혹한기 풀장 사용이 불가능한 POOLVILLA 1, 3호 객실은 보다 저렴한 가격으로 이용이 가능하십니다.</li>
<li style="color: red">수영장 및 수영장 근처에서 물풍선 사용을 금지 합니다. 물풍선 사용시 여과기로 흘러들어, 기계 고장의 원인이 됩니다.</li>
</div>
<br>
<span class="number">2</span><span style="font-size: 30px; font-weight: 900;">입금전 확인사항</span>
<div class="dangers_list">
<li> View 1151 에서는 올바른 예약문화 정착을 위하여 예약취소시 환불기준을 아래와 같이 운영하고 있으니 꼭 확인하시고 예약해주시기바랍니다.</li>
<li style="color: red">예약 후 취소시에는 기간에 상관없이 최소 10% 위약금이 발생하며, 환불액은 아래의 환불기준에 의합니다. (천재지변으로 인한 취소 및 변경 역시 동일하게 처리 됩니다.)</li>
<li style="color: red"> 변경취소시 수수료도 취소 수수료가 동일하게 적용되오니 예약시 신중하게 생각하시고 결정해 주시기 바랍니다.</li>
<li style="color: red"> 후 10시간이내 요금 전액이 결재되어야 예약이 완료되며, 입금 확인이 되지 않을 시 자동으로 취소됩니다. (전일,당일예약은 2시간 이내)</li>
<li>보호자 동반 없는 미성년자 예약 발견 시 환불 없이 예약 취소됩니다.</li>
<li style="color: redd">예약자와 입금자명이 동일하지 않을 시 예약이 완료되지 않으며 이름이 상이할 경우 연락을 하시어 확인 바랍니다.</li>
<li>예약인원 초과, 반려동물의 입실, 천재지변으로 인한 예약취소, 투숙당일 예약취소는 환불되지않습니다.</li>
<li style="color: red">추가인원 요금: 성인 5만원, 아동 (36개월~초등학생) 3만원, 유아 (36개월 미만) 무료 (유아 2명 이상 투숙시 아동 추가 요금 발생)</li>
<li>바비큐그릴 세트(숯,그릴포함) 이용료 2만원</li>
<li>매우 드문 경우이지만 고장으로 인한 수영장 이용 불가 시 금액을 아래와같이 환불해드립니다. (※ 주중 5만원 주말 8만원)</li>
<li>법정공휴일 전날은 주말요금이 적용 됩니다.</li>
<li>신정과 크리스마스 전 날인 12월 24일과 31일은 특별 성수기로 구분됩니다.</li>
</div>
<table class="dangers_table">
<tr>
			<c:forEach var= "i" begin="0" end ="9" step="1" >
			<td class="days">${i}일 전</td>&nbsp;&nbsp;
			</c:forEach>	
			<td class="days">30일 전</td>	
</tr>

<tr>
			<c:forEach var= "i" begin="0" end ="90" step="10" >
			<td class="money">${i}%</td>&nbsp;&nbsp;
			</c:forEach>	
			<td class="money">90%</td>	
</tr>
</table>
</div>
<br><br><br>
<div>
	<jsp:include page="../include/footer.jsp" />
</div>
</body>
</html>