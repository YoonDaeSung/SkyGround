var today = new Date(); // 오늘 날짜 내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date(); // today의 Date를 세어주는 역할
var present = new Date(); //현재 날짜 추출 하기 

function prevCalendar() { // 이전 달
	today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	buildCalendar(); // 달력 cell 만들어 출력
}

function nextCalendar() { // 다음 달
	today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	buildCalendar(); // 달력 cell 만들어 출력
}

function buildCalendar() { // 현재 달 달력 만들기

	var doMonth = new Date(today.getFullYear(), today.getMonth(), 1);
	var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	var tbCalendar = document.getElementById("calendar");
	var tbCalendarYM = document.getElementById("tbCalendarYM");

	tbCalendarYM.innerHTML = today.getFullYear() + "년 "
			+ (today.getMonth() + 1) + "월";

	while (tbCalendar.rows.length > 2) {
		tbCalendar.deleteRow(tbCalendar.rows.length - 1);
	}

	var row = tbCalendar.insertRow();
	var cnt = 0;// count, 셀의 갯수를 세어주는 역할

	for (var i = 0; i < doMonth.getDay(); i++) {
		cell = row.insertCell();// 열 한칸한칸 계속 만들어주는 역할
		cnt = cnt + 1;// 열의 갯수를 계속 다음으로 위치하게 해주는 역할
	}

	/* 달력 출력 */
	var today_format;

	for (var i = 1; i <= lastDate.getDate(); i++) {

		// 현 보여지는 달력의 yyyy-MM-dd 형식으로 출력
		today_format = today.getFullYear().toString()
				+ "-"
				+ ((today.getMonth() + 1).toString().length == 2 ? (today
						.getMonth() + 1).toString() : "0"
						+ (today.getMonth() + 1).toString()) + "-"
				+ (i.toString() < 10 ? "0" + i.toString() : i.toString());

		cell = row.insertCell(); // 열 한칸한칸 계속 만들어주는 역할
		cell.innerHTML += '<br>';
		cnt = cnt + 1;// 열의 갯수를 계속 다음으로 위치하게 해주는 역할

		if (cnt % 7 == 1) { //일요일만 처리 다른(색상)
			cell.innerHTML += '<div class="dayd">' + i + '<br></div>';

		} else if (cnt % 7 == 0) { //토요일만 처리 다른(색상)
			cell.innerHTML += '<div class="dayt">' + i + '<br></div>';
			row = calendar.insertRow();

		} else { //평일만 처리 다른(색상)
			cell.innerHTML += '<div class="days">' + i + '<br></div>';
		}

		var date_length = $('.cl_date').length; // input box(DB에 저장된 개수 저장)
		//		 오늘의 날짜에 노란색 칠하기 
		if (today.getFullYear() == date.getFullYear()
				&& today.getMonth() == date.getMonth() && i == date.getDate()) {
			// 달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
			cell.bgColor = "#FAF58C";// 셀의 배경색을 노랑으로
		}
		// DB에 있는 방의 데이터 개수 만큼 반복
		var rmList_length = $("input[name=rml_name]").length;
		var room_print= null; //완료 되면 참 T 안되면 else로 걸러 내는 필터 방식
		
		/*	현재 날짜만추출  yyyy-MM-dd 형식으로 출력*/
		 var npresent  = present.getFullYear().toString()+"-"+
		 ((present.getMonth()+1).toString().length==2?(present.getMonth()+1).toString():"0"+(present.getMonth()+1).toString())+"-"+
		 (present.getDate().toString().length==2?present.getDate().toString():"0"+present.getDate().toString() );
		 
		/*현재(오늘)날짜 이상의 날만 데이터가 나오게 표시 하게 되고 그 전에는 안나온다.*/
		if(npresent<=today_format){
			
		for (var r = 0; r < rmList_length; r++) {
		  var rool_name = $('#rmList_name' + r).val(); // input box(객실 이름)의 값.
		  var lll = $('#rmList_name' + r).val(); 
		  room_print= "f"; //초기값은 T로 설정해준다. 
		  
		  for (var j = 0; j < date_length; j++) {
			var room_name = $('#rm_name' + j).val(); // 예약 테이블의 방이름
			var book_days = $('#bk_dayss' + j).val(); // 종료 숙박 날짜 불러오기
			var book_date = $('#bk_date' + j).val(); // 시작 숙박 날짜 불러오기 
			
			if((room_name==rool_name)&&(book_date <= today_format)
					&& (today_format <= book_days) ) {

				room_print= "t";
				break ;
			} // if ( 예약완료이면  room_print= "t" (참) )
		  } // 예약 완료 확인 되면 for 종료
		  
		  // 방이름과 예약 가능/불가능 출력
		  if (room_print=="t") {
			  cell.innerHTML += '<span class="finish">완</span>'; 
			  cell.innerHTML += '<span class="finishpt">'+ rool_name + '</span><br>';
		  }else { 
			  cell.innerHTML += '<span class="bookable">가</span>';
//			  cell.innerHTML += rool_name + '<br>';
			  var zz = "'"+rool_name+"'";
			  var xx =  "'"+today_format+"'";
			  cell.innerHTML += '<a class = "bookablept" style="text-decoration:none" href="javascript:room('+zz+','+xx+');">'+rool_name +'</a><br>';
		  
		  } //cell.innerHTML += 가 출력 부분
			}// r < rmList_length
		}// npresent<today_format
		else{
			cell.innerHTML += '<span class="kend">&nbsp;&nbsp;예약 종료</span>';
		}
		cell.innerHTML += '<br>';
	}// 1 달완료  lastDate.getDate()
}// 현재 달 달력 만들기

var dayday = ""; //선택한 날짜 값 가져오기
var rname = "";
var variation = "";// 인원수
var sadditional = ""; //기준 인원 초과시 추가 금액 계산

function focusOn(ddd){
	alert(ddd);
}

function room(rname,tformat){
	document.getElementById("infoTbl").style.display="block"; //숨김 해제
	console.log("room function"+rname); 
	console.log("room function"+tformat); 
	rname =rname; //룸 선택 이름
	dayday =tformat; //룸 선택 날짜
	
	$("#foucs_rname").focus();
	
	/*체크 박스*/
	
	$("input:checkbox[name='rmChk']").prop("checked", false);
	$("input:checkbox[class='"+rname+"']").prop("checked", true);
	
	/*select 박스*/
	$(".bk_days").attr("disabled",true);
	$(".bk_adult").attr("disabled",true);
	rsv_check(rname);
	document.getElementById("dstart").innerHTML=tformat;
	document.getElementById("droom").innerHTML=rname;
	
	
//	document.getElementById("sroom_name").innerHTML=rname;

}; //room(rname, tformat)

/*콤마를 풀어주는 함수*/
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

/* ,000 단위로 콤마 찍어주는 함수*/
function commaNum(num){
	var len, point, str;
	num = num + "";
	point = num.length % 3
	len = num.length;
	
	str = num.substring(0, point);
	while(point < len){
		if(str != "") str += ",";
		str += num.substring(point, point +3);
		point += 3;
		
	}
	return str;
}

/* 달력 데이터 변환 */
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

var basicPerson=""; // 비수기 요금
var nrm_num =""; //방 번호
/* 체크박스 값을 가져온다  필요 변수를 미리 해놓고 */
function rsv_check() {
	
	var maxPerson; // 최대인원
	var sel_days; // 이용기간
	var chk = $('input[name=rmChk]:checked');
	/* 체크된 체크박스 값을 가져온다 */
	chk.each(function(i) {
		/*방 번호 불러 오기 */
		nrm_num = $('#rm_num'+chk.val()).text();
//		console.log("방 번호 값 출력 하기 : "+nrm_num); 
		
		/*select 박스*/
		$("#bk_days"+chk.val()).attr("disabled",false);
		$("#bk_adult"+chk.val()).attr("disabled",false);

		// 기준인원 / 최대인원
		var arr = $('#prs'+chk.val()).text().split('/');
	
		basicPerson = Number(arr[0]); // 기준 인원
		maxPerson = Number(arr[1]); // 최대인원
//		console.log("기준 인원 : "+basicPerson); 
//		console.log("최대 인원 : "+maxPerson); 
		sel_days = $('#bk_days'+ chk.val()).val(); //이용 기간
		$('#dend').text(date_add(dayday, Number(sel_days)) ); //종료 날짜 
		
	});//chk.each(function(i)
}//rsv_check()

var dval = ""; //기간 변수값
var ival = ""; //인원수 변수값

/*일짜가 바뀔때마다 바로 적용하는 함수 */
function dtransfer(val,ids){
	dval = val ; 
	$('#dend').text(date_add(dayday, Number(dval)) ); 
	
	if(basicPerson<ival) {
		sadditional =  (ival-basicPerson)*10000;
		document.getElementById("sadditional").innerHTML=commaNum(sadditional);
	}
	
	if(basicPerson>=ival) {
		sadditional= "";
		document.getElementById("sadditional").innerHTML=commaNum(sadditional);	
	}
		var	a = $('#rm_nprice_in'+ids).val();
		$('#rm_npricez').text(commaNum(period));
		var room_amount = (dval*a);
		document.getElementById("room_amount").innerHTML=commaNum(room_amount);
				if(dval > 1){
			var period = (dval*a)+sadditional;
				}
				if(dval<=1){
					var period =  Number(a)+Number(sadditional);
					$('#rm_npricez'+ids).text(commaNum(period));
					$('#rm_npricez').text(commaNum(period));
					var room_amount = (dval*a);
					document.getElementById("room_amount").innerHTML=commaNum(room_amount);
				}
			if(dval > 1){
		var period = (dval*a)+sadditional;
		$('#rm_npricez'+ids).text(commaNum(period));
		$('#rm_npricez').text(commaNum(period));
		var room_amount = (dval*a);
		document.getElementById("room_amount").innerHTML=commaNum(room_amount);
			}
			if(dval<=1){
				var period = Number(a)+Number(sadditional);
				$('#rm_npricez'+ids).text(commaNum(period));
				$('#rm_npricez').text(commaNum(period));
				var room_amount = (dval*a);
				document.getElementById("room_amount").innerHTML=commaNum(room_amount);
			}
} // dtransfer()

/*사람 수가 바뀔때마다 바로 적용하는 함수 */
function itransfer(val,ids){
	ival = val;
	if(basicPerson<ival){
		sadditional =  (ival-basicPerson)*10000;
		document.getElementById("sadditional").innerHTML=commaNum(sadditional);
	}
	if(basicPerson>=ival){
		sadditional= "";
		document.getElementById("sadditional").innerHTML=commaNum(sadditional);	
	}
		var	a = $('#rm_nprice_in'+ids).val();
				if(dval > 1){
			var period = (dval*a)+sadditional;
			$('#rm_npricez'+ids).text(commaNum(period));
			$('#rm_npricez').text(commaNum(period));
			var room_amount = (dval*a);
			document.getElementById("room_amount").innerHTML=commaNum(room_amount);
				}
				if(dval<=1){
					var period =  Number(a)+Number(sadditional);
					$('#rm_npricez'+ids).text(commaNum(period));
					$('#rm_npricez').text(commaNum(period));
					var room_amount = (dval*a);
					document.getElementById("room_amount").innerHTML=commaNum(room_amount);
				}
			if(dval > 1){
		var period = (dval*a)+sadditional;
		$('#rm_npricez'+ids).text(commaNum(period));
		$('#rm_npricez').text(commaNum(period));
		var room_amount = (dval*a);
		document.getElementById("room_amount").innerHTML=commaNum(room_amount);
			}
			if(dval<=1){
				var period = Number(a)+Number(sadditional);
				$('#rm_npricez'+ids).text(commaNum(period));
				$('#rm_npricez').text(commaNum(period));
				var room_amount = (dval*a);
				document.getElementById("room_amount").innerHTML=commaNum(room_amount);
	}  // for종료
}//itransfer

/* 예약 처리해주는 함수 부분 */
$(function() {
	$('.hover').mouseleave(
			  function() {
			    $(this).removeClass("hover");
			  }
			);
	// 예약 처리
		$('#book_btn').click(function() {
		var rm_name = $('#droom').text();		//방 이름 가져오기
		var bk_adult = ival; 					//인원 수 추가
		var bk_date = $('#dstart').text();		//예약 시작일
		var bk_days = $('#dend').text();		//예약 종료일
		var bk_total = uncomma($('#rm_npricez').text()); //총 결제 금액
		var rm_num = nrm_num;					//방 번호 가져오기
		console.log("방 이름  : "+rm_name); 
		console.log("인원 수 추가 : "+bk_adult); 
		console.log("예약일 시작 :"+bk_date); 
		console.log("예약일 종료 : "+bk_days); 
		console.log("총 결제 금액 : "+bk_total);
		console.log("방 번호 출력 하기 : "+rm_num);
		$.ajax({
			url: "calendarset",
			type: "post",
			data: {
				rm_name, bk_date, bk_days, bk_adult, bk_total, rm_num
			},
			success: function(data) {
				
				if (data.code == 200) {
					alert("예약 완료");
					location.href = 'home';
				} else {
					alert("예약 실패");
				}
				
			}
			, error: function(error) {
				alert("예약 처리 시스템 에러!");
			
			} // error
		}); // $.ajax
		
	}); // $('#book_btn').click
	
}); // $(function()