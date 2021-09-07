$(function() {
	
	// 로그인
	$("#loginBtn").click(function() {
		var email = $("#logEmail").val(); // 이메일 입력 input 태그 ID.
		var password = $("#logPassword").val(); // 비밀번호 입력 input 태그 ID.
		
		/* 공백 검사 */
		if (email == "" && password == "") {
			$("#result_checktext").text("이메일 및 비밀번호를 입력해주세요.").css("color","red");
			$("#logEmail").focus();
			return false;
		} 
		
		if (email == "") {
			$("#result_checktext").text("이메일을 입력해주세요.").css("color","red");
			$("#logEmail").focus();
			$("#logEmail").css("background-color", "#FFCECE");
			$("#logEmail").css("border","2px solid #ff3f3f");
			return false;
		} 
		
		if (password == "") {
			$("#result_checktext").text("비밀번호를 입력해주세요.").css("color","red");
			$("#logPassword").focus();
			$("#logPassword").css("background-color", "#FFCECE");
			$("#logPassword").css("border","2px solid #ff3f3f");
			return false;
			
		} 
		
		$.ajax({
			url : "login",
			type : "post", 
			data : {email:email, password:password},
			
			success : function(data) {
				if (data.code == 200) {
					
					//로그인 후 home 새로고침
					location.reload();
					window.self.close();
					alert("로그인 되었습니다.")
				} // 200
				else if(data.code== 201){
					$("#result_checktext").text("비밀번호를 다시 확인해주세요.").css("color","red");
				}//201
				
				else if(data.code== 202){
					$("#result_checktext").text("이메일을 다시 확인해주세요.").css("color","red");
				}//202
				
				else{
					$("#result_checktext").text("존재하지 않는 계정입니다.").css("color","red");
				}//else		
				
			} //function(data)
		}); //ajax
		
	}); // $("#loginBtn").click
});