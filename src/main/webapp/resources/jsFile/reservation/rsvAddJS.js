$(function() {
//	console.log("페이지 확인");
	
	/* 콤마 제거 */
	function unComma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	$('#rsvBtn').click(function() {
		
		var typeNum = Number($('#typeNum').val() ); // 객실 번호
		var typeNM = $('#typeNM').text(); // 객실 이름
		var rsv_email = $('#rsv_email').val(); // 로그인한 사용자
		var startDay = $('#startDay').val(); // 체크인 날짜
		var endDay = $('#endDay').val(); // 체크아웃 날짜
		var personA = Number($('#personA').val() ); // 성인 인원
		var personC = Number($('#personC').val() ); // 아동 인원
		var personI = Number($('#personI').val() ); // 영유아 인원
		var roomPrce = Number(unComma($('#roomPrce').text()) ); // 객실 금액
		var persPrce = Number(unComma($('#persPrce').text()) ); // 인원추가 금액
		var optionPrce = Number(unComma($('#optionPrce').text()) ); // 옵션추가 금액
		var totPrce = Number(unComma($('#totPrce').text()) ); // 총 합계 금액
		
		
		var rsv_NM = $('#rsv_NM').val(); // 예약자 이름
		var rsv_tel = $('#rsv_tel1').val() + $('#rsv_tel2').val() + $('#rsv_tel3').val(); // 연락처
		var rsv_em_tel = $('#rsv_em_tel1').val() + $('#rsv_em_tel2').val() + $('#rsv_em_tel3').val(); // 비상 연락처
		
		/* 공백 검사 */
		if(rsv_NM == "") {
			alert("이름을 입력해 주세요.");
			$('#typeNM').focus();
			return;
		}
		
		if(rsv_tel == "") {
			alert("연락처를 입력해 주세요.");
			$('#rsv_tel1').focus();
			return;
		}
		
		if(rsv_em_tel == "") {
			alert("비상 연락처를 입력해 주세요.");
			$('#rsv_em_tel1').focus();
			return;
		}
		/* 공백 검사 */
		
		var setData = {
				rm_num:typeNum, rm_name:typeNM, bk_date:startDay, bk_days:endDay, 
				bk_adult:personA, bk_child:personC, bk_infant:personI, 
				room_prce:roomPrce, pers_prce:persPrce, bk_option:optionPrce,
				bk_total:totPrce, bk_name:rsv_NM, email:rsv_email, bk_phone:rsv_tel, em_phone:rsv_em_tel
		};
		
		$.ajax({
			url: "setBook",
			type: "post",
			data: setData,
			
			success: function(data) {
				
				if (data.code == 200) {
					alert("예약이 완료되었습니다." +
							"예약해 주셔서 감사합니다.");
					location.href = 'home';
				
				} else if (data.code == 201) {
					alert("죄송합니다. 예약이 안되었습니다.");
				}
				
			}, //success
			error: function(error) {
				alert("객실예약 시스템 에러!");
				
			} // error
			
		}); // ajax
	}); // $('#rsvBtn').click
	
});