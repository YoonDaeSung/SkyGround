$(function() {

	$('#askBtn').click(function() {
		
		// 선택된 radio 값 가져오기.
		var typeNM = $('input[name=typeNM]:checked').val();
		
		var rsvNM = $('#rsvNM').val();
		var rsvPhone = $('#rsvPhone').val();
		
		var setData;
		
		if (typeNM == 'N') { // 예약자 명이면
			setData = {bk_name:rsvNM, bk_phone:rsvPhone}
		
		} else if (typeNM == "E") { // 이메일이면
			setData = {email:rsvNM, bk_phone:rsvPhone}
		}
		
		/* 공백 검사 */
		if ($("input[name=typeNM]").is(":checked") == '') {
			
			alert("이름 또는 이메일을 선택해 주세요.");
			$('input[name=typeNM]').focus();
			return;
		}
		
		if (rsvNM == '') {
			alert("이름 또는 이메일을 확인해 주세요.");
			$('#rsvNM').focus();
			return;
		}
		
		if (rsvPhone == '') {
			alert("휴대폰 번호를 확인해 주세요.");
			$('#rsvPhone').focus();
			return;
		}
		/* 공백 검사 */
		
		
		$.ajax({
			url: "rsvCheck",
			type: "post",
			data: setData,
			
			success: function(data) {
				
				console.log("success 진입");
				console.log("data " + data);
				console.log("data.code : " + data.code);
				
				if(data != null) {
//					alert("입력 확인");
					$('#resultArea').html(data);
				
				} else {
					alert("데이터가 없습니다.");
				}
			}, //success
			error: function(error) {
				alert("예약확인 시스템 에러!");
				
			} // error
			
		}); // ajax
		
	});

}); // $(function()