var today = new Date(); //오늘 날짜 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date(); //today의 Date를 세어주는 역할
var today_format;

var toDate = new Date(); //현재 날짜 추출 하기

/* 캘린더 */

function prevCalendar() { //이전 달
	today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	buildCalendar(); //달력 cell 만들어 출력 
}

function nextCalendar() { //다음 달
	today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	buildCalendar(); //달력 cell 만들어 출력
}

function buildCalendar() { //현재 달 달력 만들기
	
	// toDate format YYYY-MM 형식으로 출력 (달 까지만 출력)
    var toDate_format  = toDate.getFullYear().toString()+"-"+
    ( (toDate.getMonth()+1).toString().length==2?(toDate.getMonth()+1).toString():"0"+(toDate.getMonth()+1).toString() );
	
	var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
	var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
	
	//날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
	var tbCalendar = document.getElementById("calendar");
	
	//테이블에 정확한 날짜 찍는 변수
	var tbCalendarYM = document.getElementById("tbCalendarYM");
	
	tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 
	
	/*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
	while (tbCalendar.rows.length > 2) {
		tbCalendar.deleteRow(tbCalendar.rows.length-1);
	}
	
	var row = tbCalendar.insertRow();
	var cnt = 0;// count, 셀의 갯수를 세어주는 역할
	
	for (var i=0; i < doMonth.getDay(); i++) { /*이번달의 day만큼 돌림*/
		cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
		cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
	}
	
	
	/*달력 출력*/
	loop1 : for (var i=1; i<=lastDate.getDate(); i++) { 
		
		// 현 보여지는 달력의 YYYY-MM-DD(2019-07-01) 형식으로 출력
		today_format = today.getFullYear().toString() + "-" 
		+ ( (today.getMonth()+1).toString().length == 2 ? (today.getMonth()+1).toString():"0"+(today.getMonth()+1).toString() ) + "-" 
		+ (i.toString() < 10 ? "0"+i.toString() : i.toString() );
		
		// 현 보여지는 달력의 YYYY-MM(2019-07) 형식으로 달까지만 출력
		var toMonth_format = today.getFullYear().toString() + "-" 
		+ ( (today.getMonth()+1).toString().length == 2 ? (today.getMonth()+1).toString():"0"+(today.getMonth()+1).toString() );
		
//		console.log(today_format); // 일자 확인
		
		cell = row.insertCell(); //열 한칸한칸 계속 만들어주는 역할
		cell.innerHTML += '<br>';
		
		cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
		
		/*오늘의 날짜에 노란색 칠하기*/
		if (today.getFullYear() == date.getFullYear() && today.getMonth() == date.getMonth() 
				&& i == date.getDate()) { 
			//달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
			cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로 
		}
		
		if (cnt % 7 == 1) { /*일요일 계산*/
			cell.innerHTML += '<div class="dayd">' + i + '<br>'; 
		
		}else if (cnt % 7 == 0) { /* 1주일이 7일 이므로 토요일 구하기*/
			cell.innerHTML += '<div class="dayt">' + i + '<br>'; 
			row = calendar.insertRow();
		
		} else { /* 평일 */
			cell.innerHTML += '<div class="days">' + i + '<br>';
		
		}
		
		// 1. toDate_format = 고정된 날짜
		// 2. today_format = 변화되는 날짜
		// 3. 고정된 오늘 날짜를 기준으로 출력. 
		if (toDate_format <= toMonth_format) {
		
			cell.innerHTML += '<span class="" id="bookMake'+i+'" title="'+today_format+'"></span>';
			
			var date_length = $('.cl_date').length; // input box(DB에 저장된 개수 저장)
						
			// DB에 있는 bk_date 개수 만큼 반복
			for (var j=0; j < date_length; j++) {
				
	//			console.log("j : " + j);
				
				var book_date = $('#bk_date' + j).val(); // input box로 받아온 체크인 날짜.
				var book_days = $('#bk_days' + j).val(); // input box로 받아온 체크아웃 날짜.
				
				// 확인을 위한 로그 찍기.
				/*
				console.log("format : " + today_format);
				console.log("book_date : " + book_date);
				console.log("book_days : " + book_days);
				console.log("비교 : " + (today_format == book_date) || (book_date <= today_format) && (today_format <= book_days) );
				*/
				
				// today_format : 달력 날짜 / book_date : DB의 체크인 날짜 / book_days : DB의 체크아웃 날짜.
				// 예약 완료 조건식.
				if ( (today_format == book_date) || (book_date <= today_format) && (today_format <= book_days) ) { 
					
					
					$("#bookMake"+i).attr("class", "finish"); // class명을 finish로 변경
					$("#bookMake"+i).removeAttr("onclick"); // onclick 속성 제거
					$(".finish").text("예약 완료");
					
	//				console.log("class(if) : " + $(".finish").attr("class") );
	//				console.log("");
					
					if (toDate_format <= today_format) {
						continue loop1;
					
					} else {
						continue;
					} 
				
				} else {
												
					$("#bookMake"+i).attr("class", "bookable"); // class명을 bookable로 변경
					$("#bookMake"+i).attr("onclick", "checkInBtn()"); // checkInBtn()를 가진 onclick 속성 추가
					$(".bookable").text("예약 가능");
					
	//				console.log("class(else) : " + $(".bookable").attr("class") );
	//				console.log("");
				} // else
				
				if (j == date_length) {
					continue loop1;
					
				} //j==date_length
				
			} // for (안쪽)
			cell.innerHTML += '</div>'; 
			
		} else{ // 4. 그 이전 날짜는 예약 종료.
	        cell.innerHTML += '<span class="finish">예약 종료</span>';
	    }
		
	} // for (밖깥쪽)
	
} // buildCalendar()
/* 캘린더 끝 */

/* 기간 선택 및 객실 금액 계산 */

// 체크 인 날짜
function checkInBtn() {
	
	// select box 초기화, 기본 값(option:eq(0) )만 남기고 삭제 하기.
	$('#availableDays option').not('option:eq(0)').remove();
	
	// 비수기 요금
	var nprice = $('.cl_date').attr('data-nprice');
//	console.log("nprice : " + nprice);
	
	// 성수기 요금
	var price = $('.cl_date').attr('data-price');
//	console.log("price : " + price);
	
	var el = window.event.srcElement;
	
	// 체크인 날짜.
	cal_Day = el.title;
	
	document.getElementById("checkInDate").scrollIntoView(); // 체크인으로 focus 이동.
	$('#checkInDate').text(cal_Day);
	
	// 1. 완료를 알 수 있는 값.
	// 2. 반복문 while 로.
	// 3. 시작 날짜부터 4일(3박 4일)까지만 예약 가능.
	
	// 날짜 비교
	var startDayArr = cal_Day.split('-');
	var endDayArr = date_add(cal_Day, 4).split('-');
	
	var startDay = new Date(startDayArr[0], parseInt(startDayArr[1])-1, startDayArr[2] );
	var endDay = new Date(endDayArr[0], parseInt(endDayArr[1])-1, endDayArr[2] );
	
	var i = 1; // 반복문에서 시작 조건 초기값.
	var end = 0; // 반목무에서 end 조건 초기값.
//	console.log("시작 날이 끝나는 날보다 작으면 : " + (startDay.getTime() < endDay.getTime() ? (end = 4) : (end = 1)) );
	
	// 선택한 시작 날짜로 부터 4일까지 비교.
	startDay.getTime() < endDay.getTime() ? (end = 4) : (end = 1);
	
	while (i < end ) {
		
		// 선택한 시작 날짜로 부터 4일까지 비교 중, 예약 완료 된 날짜가 있으면 return.
		var date_length = $('.cl_date').length; // input box(DB에 저장된 개수 저장)
		
		// DB에 있는 데이터 개수 만큼 반복
		for (var j=0; j < date_length; j++) {
			
			var book_date = $('#bk_date' + j).val(); // BD에서 받아온 input box(날짜)의 값.
			
			if (book_date == date_add(cal_Day, i)) { 
//				console.log("if문 확인");
				return;
			}

			if (j == date_length) {
				j = 0;
			} //j==date_length
		
		} // for
		
//		console.log("i : " + i);
		
		// 체크아웃 select 박스에 <option> 추가
		$("#availableDays").append("<option value=" + date_add(cal_Day, i) + 
				" data-nprice=" + nprice + " data-price=" + price +">" + i + "박</option>");
		
		i++;
	} // while
	
} // checkInBtn()

// 성수기 요금 계산 함수
function inSeasonRate(index, price, room_cost) {
	
	if (index == 2) {
		room_cost = (Number(price)*2 );
	
	} else if (index == 3) {
		room_cost = (Number(price)*3 );
	
	}
	$('#room_cost').text(addComma(room_cost) );
	
} // inSeasonRate()

// 체크 아웃 날짜
function checkOutSel() {
	
	// 선택한 옵션에서 값을 가져온다. (체크아웃 날짜)
	var endDate = $('#availableDays option:selected').val();
	
	// 가져온 값을 span태그로 넘겨준다.
	$('#checkOutDate').text(endDate);
	
	// 체크인 날짜
	var startDayArr = $('#checkInDate').text().split('-');
	var startDay = startDayArr[1];
//	console.log(startDay);
	
	// 체크아웃 날짜
	var endDayArr =  $('#checkOutDate').text().split('-');
	var endDay = endDayArr[1];
	
	/* 객실 기본 금액 */
	
	// 선택 된 비성수기 금액 가져오기.
	var nprice = $('#availableDays option:selected').attr('data-nprice');
	
	// 선택 된 성수기 금액 가져오기.
	var price = $('#availableDays option:selected').attr('data-price');
	
	// 선택 된 index 값 가져오기.
	var index = $("#availableDays option").index($("#availableDays option:selected"));
//	console.log(index);
	
	// 성수기 요금일 때 (성수기를 08 ~ 08월로 고정) => test로 07 ~ 08월로 설정.
	if ( startDay >= 07 && startDay <= 08 || endDay >= 07 && endDay <= 08 ) {
		
		// 기본 금액이 누적 되는 변수.(성수기 요금)
		var room_cost = Number(price);
		
		if (startDay <= 08 && endDay >= 09) { // (case.1) 체크인 = 성수기, 체크아웃 = 비성수기일 경우
			
			if (index == 2) {
				room_cost += Number(nprice);
				
			} else if (index == 3) {
				room_cost += (Number(nprice)*2 );
				
			}
			$('#room_cost').text(addComma(room_cost) );
			
		} else if (startDay <= 06 && endDay >= 07) { // (case.2) 체크인 = 비성수기, 체크아웃 = 성수기일 경우
			
			var room_cost = Number(nprice);
			
			if (index == 2) {
				room_cost += Number(price);
			
			} else if (index == 3) {
				room_cost += (Number(price)*2 );
			
			}
			$('#room_cost').text(addComma(room_cost) );
			
		} else { // (case.3) 성수기 요금 계산 함수
			inSeasonRate(index, price, room_cost);
		
		} // else (case.3)
		
	} else { // (case.4) 체크인, 체크아웃 = 비성수기
		
		// 기본 금액이 누적 되는 변수.(비성수기 요금)
		var room_cost = Number(nprice);
		
		if (index == 2) {
			room_cost = (Number(nprice)*2 );
		
		} else if (index == 3) {
			room_cost = (Number(nprice)*3 );
		
		}
		$('#room_cost').text(addComma(room_cost) );
		
	} // (case.4)
	
	totalRate();
	
} // checkOutSel()

// 날짜 계산을 위한 함수
function date_add(sDate, nDays) {
    var yy = parseInt(sDate.substr(0, 4), 10);
    var mm = parseInt(sDate.substr(5, 2), 10);
    var dd = parseInt(sDate.substr(8), 10);
 
    d = new Date(yy, mm - 1, dd + nDays);
 
    yy = d.getFullYear();
    mm = d.getMonth() + 1; mm = (mm < 10) ? '0' + mm : mm;
    dd = d.getDate(); dd = (dd < 10) ? '0' + dd : dd;
 
    return '' + yy + '-' +  mm  + '-' + dd;

} // date_add()
/* 기간 선택 및 객실 금액 계산 끝 */

/* 인원 선택 */
function add_people() {
	// 1. 기준은 전부 2명.
	
	// 객실 최대 인원 값.
	var max_prs = $('.cl_date').attr('data-max_prs');
//	console.log("최대 인원 : " + max_prs);
	
	for (var i=3; i <= max_prs; i++) {

		// 성인 select Box 인원 추가.
		$("#sel_adult").append("<option value=" + i + ">" + i + "</option>");
		
		// 아동과 영유아일 경우, 최대 인원이 4명 초과인 경우만 인원 추가.
		if (max_prs > 4) {
			// 아동 select Box 인원 추가.
			$("#sel_child").append("<option value=" + i + ">" + i + "</option>");
			
			// 영유아 select Box 인원 추가.
			$("#sel_infant").append("<option value=" + i + ">" + i + "</option>");
		}
	} // for
	
} // add_people()
/* 인원 선택 끝 */

/* 추가 인원 금액 계산 */
function add_peopleRate() {
	// 2. 1박 기준 1명 추가 당, 성인 = 10000원, 아동 = 5000원, 영유아 = 0원.
	// 3. 기간 선택(1박, 2박..)에 따라 1박 기준 인원 금액도 증가.
	
	// 선택 된 index 값 가져오기.
	var adult_index = $('#sel_adult option').index($('#sel_adult option:selected'))+1;
	var adult_length = $('#sel_adult option').length;
	
	// 성인 추가 인원 누적 변수
	var people_costA = 0;
	
	/* 성인 추가 요금 */
	if (adult_index > 2) {
//		console.log("index : " + index + " / " + adult_length);
		
		for (var i=0; i <= (adult_length/2); i++) {
			
			people_costA = 10000 * (i+1);
			
			// option:eq 는 0부터 시작하므로 i+2 를 시작 지점으로 잡아준다.
			$("#sel_adult option:eq("+ (i+2) +")").attr("data-cost", people_costA);

		} // for
	
	} // if
	var adult_cost = $('#sel_adult option:selected').attr('data-cost');
	
	/* 성인 추가 요금 끝 */
	
	
	/* 아동 추가 요금 */
	var child_index = $('#sel_child option').index($('#sel_child option:selected') );
	var child_length = $('#sel_child option').length;
	
	// 성인 추가 인원 누적 변수
	var people_costC = 0;
	
	if (child_index > 1) {
		
		for (var i=1; i <= child_length; i++) {
			
			var people_costC = 5000 * i;
			
			$("#sel_child option:eq("+ (i+1) +")").attr("data-cost", people_costC);

		} // for
	
	} // if
	var child_cost = $('#sel_child option:selected').attr('data-cost');
	
	/* 아동 추가 요금 끝 */
	
	// 요금 합계.
	var people_cost = Number(adult_cost) + Number(child_cost);
	$('#people_cost').text(addComma(people_cost) );
	
	// 총 금액에 합산
	totalRate();
	
} // add_peopleRate()

/* 추가 인원 금액 계산 끝 */

/* 옵션 체크 여부 */
function optionChk() {
	
	var checked = $('#chkBarbecue').prop('checked');
	var selBarbecue;
	
	// 체크가 되어있으면
	if (checked) {
		selBarbecue = $('#selBarbecue option:selected').val(); // 바베큐 세트 금액
		
	} else {
		
		selBarbecue = 0;
	}
	$('#option_cost').text(addComma(selBarbecue) );
	
	// 총 금액에 합산
	totalRate();
	
} // optionChk()


/* 총 금액 합산 */

function totalRate() {
	
	var room_cost = unComma($('#room_cost').text() ); // 객실 금액
	var people_cost = unComma($('#people_cost').text() ); // 인원추가 금액
	var option_cost = unComma($('#option_cost').text() ); // 바베큐세트 금액
	
	/*console.log("객실 : " + room_cost + ", 인원 : " + people_cost);
	console.log(Number(room_cost) + Number(people_cost) );
	console.log("");*/
	
	var total_cost = Number(room_cost) + Number(people_cost) + Number(option_cost);
	$('#total_cost').text(addComma(total_cost) );
	
} // totalRate()

/* 총 금액 합산 끝 */

/* 금액에 콤마 추가. */
function addComma(num) {
	
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	return num.toString().replace(regexp, ',');
	
} // addComma()

/* 콤마 제거 */
function unComma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

//다음 단계 버튼
function next_btn() {
	
//	console.log("버튼 반응 확인");
	
	var typeNum = $('#typeNum').val(); // 객실 번호
	var typeNM = $('#typeNM').text(); // 객실 이름
	var checkInDate = $('#checkInDate').text(); // 체크인
	var checkOutDate = $('#checkOutDate').text(); // 체크아웃
	var sel_adult = $('#sel_adult option:selected').text(); // 성인 인원
	var sel_child = $('#sel_child option:selected').val(); // 아동 인원
	var sel_infant = $('#sel_infant option:selected').val(); // 영유아 인원
	var room_cost = unComma($('#room_cost').text() ); // 객실 금액
	var people_cost = unComma($('#people_cost').text() ); // 인원추가 금액
	var option_cost = unComma($('#option_cost').text() ); // 바베큐 세트 금액
	var total_cost = unComma($('#total_cost').text() ); // 총 금액
	
	/* 공백 검사 */
	if(checkInDate == "") {
		alert("예약 날짜를 선택해 주세요.");
		document.getElementById("calendar").scrollIntoView();
		return;
	}
	
	if(checkOutDate == "") {
		alert("머무실 기간을 선택해 주세요.");
		$('#availableDays').focus();
		return;
	}
	
	if(sel_adult == "") {
		alert("성인 인원을 선택해 주세요.");
		$('#sel_adult').focus();
		return;
	}
	
	if(sel_child == "") {
		alert("아동 인원을 선택해 주세요.");
		$('#sel_child').focus();
		return;
	}
	
	if(sel_infant == "") {
		alert("유아 인원을 선택해 주세요.");
		$('#sel_infant').focus();
		return;
	}
	/* 공백 검사 */
	
	$.ajax({
		url: "nextRsvF",
		type: "post",
		data: {
			rm_num:typeNum,
			rm_name:typeNM,
			bk_date:checkInDate,
			bk_days:checkOutDate,
			bk_adult:sel_adult,
			bk_child:sel_child,
			bk_infant:sel_infant,
			bk_option:option_cost,
			room_prce:room_cost,
			pers_prce:people_cost,
			bk_total:total_cost
		},
		success: function(data) {
//			console.log(data);
			$('#nextBtn').attr('style', 'display:none');
			$('#resultArea').html(data);
		}
	});
	
}

$(function() {
	
	// 달력 실행 함수.
//	buildCalendar();
	
	// 인원 선택 (select Box에 인원 추가)
	add_people();
	
});