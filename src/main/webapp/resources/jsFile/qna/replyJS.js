$(function() {

	// 댓글 ajax창 화면 출력
	$('#replyfBtn').click(function() {
		$.ajax({
			type : 'Get',
			url : 'replyfCon',
			
			success : function(result) {
				$('#resultReplyf').html(result);
			}
		
		}); // ajax
		
	}); // $('#replyfBtn')
	
	// 댓글목록 ajax창 화면 출력
	$('#replyListBtn').click(function() {
		
		//현재 페이지의 qt_turn값 가져오기
		var turn = $("#turn").text();
		$("#qt_turn").val(turn);
		
		$.ajax({
			type : 'Post',
			url : 'replyListCon',
			data : {qt_turn: turn},
			
			success : function(result) {
				$('#resultReplyf').html(result);
			}
			
		}); // ajax
		
	}); // $('#replyListBtn')
	
	//댓글 등록 Btn
	$("#replyBtn").click(function() {
		//현재 페이지의 qt_turn값 가져오기
		var replyData = $("#replyJoin").serialize();
		
		var turn = $("#turn").text();
		$("#qt_turn").val(turn);
		
		$.ajax({
			url : "replyCon",
			type : "post",
			data : replyData,
			
			success : function(data) {
				if (data.code == 200) {
					alert("댓글이 등록되었습니다.");
				} else {
					alert("댓글이 등록되지 않았습니다, 다시 확인해주세요");
				} // else
				location.reload();
			} // success
		});
		
	});// $("#replyBtn")
	
});// function

// 댓글 삭제
function replyDeleteBtn(re_turn) {
	
	$.ajax({
		url : "replyDeleteCon",
		type : "get",
		data : {re_turn : re_turn},

		success : function(data) {
				alert("댓글이 삭제되었습니다.");
				location.reload();
		} // success
	});
} // replyDeleteBtn

// 댓글 수정form
/*function replyUpdatettBtn(re_turn, count) {
	var Btn = document.getElementById("replyUpdatefBtn");
	
	if (Btn.id == "replyUpdatefBtn"){
		
		Btn.value = "수정완료";
		//댓글수정버튼 누를시에 readonly 풀리게하기
		
		document.getElementById("re_contents"+count).readOnly = false;
		
		$("#re_contents"+count).focus();
		
		Btn.setAttribute("id", "replyUpdateBtn"); 
		
		//바뀐 아이디 값 찍어보기
//		alert( Btn.getAttribute("id") );
		
	}else{
		Btn.value = "댓글수정";
		Btn.id == "replyUpdatefBtn";
	}
}*/

function replyUpdateBtn(re_turn, count) {
	
	document.getElementById("re_contents"+count).readOnly = false;
	$("#re_contents"+count).focus();
	$("#replyUpdatefBtn").attr("type", "hidden");
	$("#rlyBtn").attr("type", "button");
	
}

//댓글수정완료 버튼
//$('#rlyBtn').click(function() {
function updateComple(count) {
	console.log("완료 반응 확인");
	
	var re_turn = $("#re_turn").val(); // 댓글 순번
	var re_contents = $("#re_contents"+count).val(); // 내용
	
	$.ajax({
		url : "replyComplete",
		type : "post",
		data : {
					re_turn:re_turn,
					re_contents:re_contents,
				}, 
		success : function(data) {
			
			if (data.code == 200) {
				alert("댓글이 성공적으로 수정 되었습니다.1");
				
			} else {
				alert("댓글이 성공적으로 수정 되었습니다.2");
			} // else 
			
		} // success
	}); //ajax
}

//	});// $('#replyUpdateBtn') 댓글수정완료 버튼
	
//} // $('#qnaUpdatefBtn') 댓글 수정 form 띄우기