// 이메일 체크여부 확인 (중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var flag = 0;

// 약관 동의 (동의 = 1, 동의 하지 않음 = 0) 
var agree = 0;

//email 정규식
var emailRegex = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

//password 정규식 (영문자 + 숫자 + 특수문자(!@#$%^*+=-))
var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}$/;

$(function() {
	
	// 이메일 유효성 검사
	$("#email").focusout(function() {
		var email = $("#email").val();
		
		//글 썻다가 다시지울경우 테두리 배경 초기화
		if(email == ""){
			$("#id_checktext").text("");
			$("#email").css("background-color", "#f1f1f1");
			$("#email").css("border","none");
		}
		
		// 이메일 정규식 검사
		else if (!emailRegex.test(email) && email != "" ) {
			$("#id_checktext").text("잘못된 형식의 이메일 주소입니다.").css("color","red");
			$("#email").css("background-color", "#FFCECE");
			$("#email").css("border","2px solid #ff3f3f");
			flag = 0;
		
		} else {
			// 이메일 중복 확인
			$.ajax({
				url: "overlabEmail",
				type: "post",
				data: {email:email},
				
				success: function(data) {
					
					if (data.code == 201) {
						$("#id_checktext").text("이미 등록된 이메일입니다.").css("color","red");
						$("#email").css("background-color", "#FFCECE");
						$("#email").css("border","2px solid #ff3f3f");
						flag = 0;
						if(email==""){
							$("#email").css("background-color", "none");
							$("#email").css("border","none");
						}
							
					} else if (data.code == 200 && email != "") {
						$("#id_checktext").text("사용가능한 이메일입니다.").css("color","green");
						$("#email").css("background-color", "#ebffe2");
						$("#email").css("border","5px solid #adf0ff");
						$("#email").css("border-radius","5px");
						flag = 1;
						
					} else if (flag == 1 && email == "") {
						$("#id_checktext").text("이메일을 입력해주세요.").css("color","red");
						$("#email").css("background-color", "#FFCECE");
						$("#email").css("border","2px solid #ff3f3f");
						flag = 0;
					}
					
				}, //success
				error: function(error) {
					alert("email 중복확인 시스템 오류, 관리자에게 문의해주세요");
				} // error
				
			}); // ajax
			
			return false;
		} // else
		
	}); // $("#email").keyup
	
	// 비밀번호 유효성 검사
	$("#password").focusout(function() {
		
		var password = $("#password").val();
		
		// 비밀번호 정규식 검사 비번 잘못 입력했을시에
		
		//글 썻다가 다시지울경우 테두리 배경 초기화
		if(password == ""){
			$("#pw_checktext").text("");
			$("#password").css("background-color", "#f1f1f1");
			$("#password").css("border","none");
		}
		
		else if (!passwordRegex.test(password) && password != "" ) {
			$("#pw_checktext").text("영문, 숫자, 특수문자(!@#$%^*+=-) 조합 6~16자를 사용해 주세요.").css("color","red");
			$("#password").css("background-color", "#FFCECE");
			$("#password").css("border","2px solid #ff3f3f");
			
		} else if (passwordRegex.test(password) && password != "") {
			$("#pw_checktext").text("유효한 비밀번호입니다.").css("color","green"); // 개발중 확인 메시지.
			$("#password").css("background-color", "#ebffe2");
			$("#password").css("border","5px solid #adf0ff");
			$("#password").css("border-radius","5px");
		}
		
	}); // $("#password").focusout
	
	
	// 비밀번호 동일성 확인
	$("#pwCheck").keyup(function() {
		
		var password = $("#password").val();
		var pwCK = $("#pwCheck").val(); // 비밀번호 확인 입력 input 태그 ID.
		
		if(pwCK == ""){
			$("#pw_rechecktext").text("");
			$("#pwCheck").css("background-color", "#f1f1f1");
			$("#pwCheck").css("border","none");
		}
		
		else if (password == pwCK && password != "") {
			$("#pw_rechecktext").text("비밀번호가 일치 합니다.").css("color","green");
			$("#pwCheck").css("background-color", "#ebffe2");
			$("#pwCheck").css("border","5px solid #adf0ff");
			$("#pwCheck").css("border-radius","5px");
		
		} else if (pwCK == "") {
			$("#password").text("영문, 숫자, 특수문자(!@#$%^*+=-) 조합 6~16자를 사용해 주세요.");
			// pwCK가 공백일 경우 text가 안보이게 한다.
			
		}
		else {
			$("#pw_rechecktext").text("비밀번호가 일치 하지 않습니다.").css("color","red");
			$("#pwCheck").css("background-color", "#FFCECE");
			$("#pwCheck").css("border","2px solid red");
		}
		
	}); // $("#pwCheck").keyup
	
	// 공백 검사
	function emptyCheck() {
		
		var email = $("#email").val(); // 이메일 입력  input 태그 ID.
		var pw = $("#password").val(); // 비밀번호 입력 input 태그 ID.
		var pwCK = $("#pwCheck").val(); // 비밀번호 확인 입력 input 태그 ID.
		var name = $("input[name=name]").val(); // 이름 입력 input 태그 ID.
		var birth = $("input[name=birth]").val(); // 생년월일 입력 input 태그 ID.
		var gender = $("input[name=gender]").is(":checked"); // 성별 선택 radio 태그 NAME.
	
		/* 공백 검사 */
		if (email == "") {
			$("#email").focus();
			$("#id_checktext").text("이메일을 입력해주세요.").css("color","red");
			$("#email").css("background-color", "#FFCECE");
			$("#email").css("border","2px solid #ff3f3f");
			return false;
		
		} 
		if (pw == "") {
			$("#password").focus();
			$("#pw_checktext").text("비밀번호를 입력해주세요.").css("color","red");
			$("#password").css("background-color", "#FFCECE");
			$("#password").css("border","2px solid #ff3f3f");
			return false;
			
		} 
		if (pwCK == "" || pw != pwCK) {
			$("#pwCheck").focus();
			$("#pw_checktext").text("비밀번호를 확인해주세요.").css("color","red");
			$("#pwCheck").css("background-color", "#FFCECE");
			$("#pwCheck").css("border","2px solid #ff3f3f");
			return false;
			
		}
		if (name == "") {
			$("input[name=name]").focus();
			$("#name_checktext").text("이름을 입력해주세요.").css("color","red");
			$("#name").css("background-color", "#FFCECE");
			$("#name").css("border","2px solid #ff3f3f");
			return false;
			
		} 
		if (birth == "" || birth.length <= 7) {
			$("#input[name=birth]").focus();
			$("#birth_checktext").text("생년월일 8글자를 입력해주세요.").css("color","red");
			$("#birth").css("background-color", "#FFCECE");
			$("#birth").css("border","2px solid #ff3f3f");
			return false;
			
		} 
		if (gender == "") {
			$("#input[name=gender]").focus();
			$("#gender_checktext").text("성별을 선택해주세요.").css("color","red");
			return false;
			
		}
		
	} // emptyCheck()
	
	// 약관 동의 (동의 = 1, 동의 하지 않음 = 0) 
	$("input[name=agree]").click(function() {
		
		var chk = $("input[name=agree]").is(":checked");
		
		if (chk == true ) {
			agree = 1;
		
		} else {
			agree = 0;
		}
		
	});
	
	// 회원가입 버튼 클릭 시, 이벤트 발생.
	$("#joinBtn").click(function() {
		
		var password = $("#password").val();
		var pwCK = $("#pwCheck").val();
		var birth = $("input[name=birth]").val(); // 생년월일 입력 input 태그 ID.	
		// 공백이 있으면 return
		if (emptyCheck() == false) {
			return;
			/* 공백 검사 */
			emptyCheck();
		
		} 
		/* 공백이 없을 시, email 중복 확인
		 * flag == 0 이면 이메일 중복으로 return
		 */
		else if (flag == 0){
			$("#email").focus();
			$("#id_checktext").text("이미 등록된 이메일입니다.").css("color","red");
			$("#email").css("background-color", "#FFCECE");
			$("#email").css("border","2px solid #ff3f3f");
			return;
			
		} 
		// 비밀번호가 정규식 검사에 적합하지 않으면 return
		else if (!passwordRegex.test(password) ) {
			$("#password").focus();
			$("#pw_checktext").text("영문, 숫자, 특수문자(!@#$%^*+=-) 조합 6~16자를 사용해 주세요.").css("color","red");
			$("#password").css("background-color", "#FFCECE");
			$("#password").css("border","2px solid #ff3f3f");
			return;
		}
		//생년월일이 8글자 미만일경우 return
		else if (birth.length <= 7){
			$("#birth").focus();
			$("#birth_checktext").text("생년월일  8글자를 입려해주세요.").css("color","red");
			return;
		}
		// 약관 동의를 하지 않을 시, return
		else if (agree == 0) {
			$("#terms_checktext").text("이용양관 및 개인정보 보호정책에 동의해 주세요.").css("color","red");
			return;
		}
		
		/* 회원가입 처리 */
		var formID = $("#joinform").serialize();
		
		$.ajax({
			url: "join",
			type: "post",
			data: formID,
			
			success: function(data) {
				
				if (data.code == 200) {
					alert("회원가입이 완료되었습니다.");
					location.reload();
					window.self.close();
					
				} else if (data.code == 201) {
					alert("회원가입에 실패하였습니다, 잠시후 다시 시도해주세요.");
				}
				
			}, //success
			error: function(error) {
				alert("회원가입 시스템 오류입니다, 관리자에게 문의해주세요");
			} // error
			
		}); // ajax
	}); // $("#joinBtn").click
	
});