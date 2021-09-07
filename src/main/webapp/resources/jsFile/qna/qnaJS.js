$(function() {
	
	//질문등록
	$("#qnaBtn").click(function() {
		var questionID = $("#questionJoin").serialize();
		
		$.ajax({ // url 요청명을 갖고 컨트롤러로 간다, ajax
			url : "questionCon",// controller, web브라우저를 무시하며 본인이 요청을보내고,
								// controller 갔다온 후, 다시 돌아와서 success 에서 받는다
			type : "post",
			data : questionID,

			success : function(data) {
				
				if (data.code == 200) {
					
					alert("질문이 등록되었습니다.");
					
					//opner.parent 함으로써 부모창이 새로고침된다
					window.close();
					opener.parent.location.reload();
					
				} else {
					alert("질문이 등록되지 않았습니다, 다시 확인해주세요");
				} // else
					
			} // success

		});

	});// qnaBtn
	
	//qnaList 에서 검색기능
	$("#qnaSearchBtn").click(function() {
		
		var keyword = $('#keyword').val();
		console.log("keyword : " + keyword);
		
		if(keyword == "") {
			alert("검색하실 단어를 입력해주세요.");
			$('#keyword').focus();
			return;
		}
		
		search.submit();
		
	});// qnaSearchBtn
	
	//qnaDeleteBtn
	$("#qnaDeleteBtn").click(function() {
		var deleteKey = $("#checking").serialize();
		$.ajax({
			url : "questDeleteCon", 
			type : "get",
			data : deleteKey,

			success : function(data) {
				if (data.code == 200) {
					
					alert("글이 성공적으로 삭제 되었습니다.");
					
					//opner.parent 함으로써 부모창이 새로고침된다
					opener.parent.location.reload();
					window.close();
				} else {
					alert("글이 삭제되지 않았습니다, 다시 확인해주세요.");
				} // else
				
			} // success
		});
		
	}); // $("#qnaDeleteBtn")
	
	// qna 수정 화면 출력
	$('#qnaUpdatefBtn').click(function() {
		var turn = $("#turn").text();
		$("#qt_turn").val(turn);
		$.ajax({
			type : 'Get',
			url : 'qnaUpdatefCon',
			data : {qt_turn: turn},
			
			success : function(result) {
				$('#resultArea').html(result);
			}
		}); // ajax
		
	}); // $('#qnaUpdatefBtn')
	
	//Q&A 수정완료 버튼
	$("#qnaUpdateBtn").click(function() {
		
		// 아래 3개에 대한정의는 form에서 input 타입이 아닌 데이터는 전해주지 못하여서, 직접 id를 주고 그 데이터를 form 이아닌 id값으로 직접 받아오는 방법
		var qt_turn = $("#turn").text();
		var qt_date = $("#date").text();
		var email = $("#user_email").text();
		var qt_title = document.getElementById("qt_title").value;
		var qt_contents = document.getElementById("qt_contents").value;
		
		$.ajax({
			url : "questUpdateCon", 
			type : "post",
			data : {qt_turn:qt_turn,
					qt_date:qt_date,
					email:email,
					qt_title:qt_title,
					qt_contents:qt_contents,
					}, 
			success : function(data) {
				
				if (data.code == 200) {
					alert("글이 성공적으로 수정 되었습니다.");
					
				} else {
					alert("글이 성공적으로 수정 되었습니다.");
				} // else
				
			} // success
		});
		
	}); // $("#qnaUpdateBtn")
	
	//Q&A 내가 질문한 목록보기
	$("#qnaMyBtn").click(function() {
		
		var keyword = $("#{ql.qt_email}").val();
		
		$.ajax({ 
			url : "questionSearchCon",
			type : "get",
			data : { quest_title : keyword },
			
			success : function(result) {
				$('#resultArea').html(result); // result -> data
				/*
				 * if(data.code == 200){ alert("성공적으로 검색 되었습니다.") }else
				 * alert("검색실패 다시확인해주세요.")
				 */

			} // success
		});
		
	});// qnaMyBtn
	
});// function


//질문 등록 form
function qnaInsertPopUp() {
	var popUrl = "qnaF";
	var popOption = "width=600, height=600, resizable=no, scrollbars=no, status=no;";
	
	window.open(popUrl,"",popOption );
}//qnaInsertPopUp
