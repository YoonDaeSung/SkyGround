<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="resources/jsFile/jquery-3.2.1.min.js"></script>
<script src="resources/jsFile/qna/replyJS.js"></script>

<title>SkyGround</title>

<style type="text/css">
	.form-control {
		height: 200px;
		width: 700px;
	}
	.insertBtn {
		width: 100px;
	}
	
	.cancleBtn {
		width: 100px !important;
	}
</style>

</head>
<body>
	<br>
	<div id="replyBox">
		<form id="replyJoin">
			<fieldset>
				<legend>댓글 등록</legend>
				<div>
					<input type="hidden" name="qt_turn" id="qt_turn">
					
					<label>작성자 : ${loginUser.email}</label>
					
					<!--댓글 등록시 form은 input값만 보내주기때문에  이메일값을 보내주기 위해 또하나 만듬 -->
					<input id="email" name="email" type="hidden" value="${loginUser.email}">
					
					<!--날짜 보내주기  -->
					<input id="re_date" name="re_date" type="hidden" value="re_date">
					<script>
						document.getElementById('re_date').value = new Date().toISOString().substring(0, 10);
					</script>
				</div>

				<div class="form-group">
					<label>내용</label>
					<input type="text" class="form-control" name="re_contents" id="re_contents" placeholder="내용을 입력해주세요.">
				</div>

				<div class="clearfix">
					<button type="button" class="btn btn-success insertBtn" id="replyBtn">댓글 등록</button>
					<button type="reset" class="btn btn-danger cancleBtn" 
						onclick="document.getElementById('replyBox').style.display='none'">취소
					</button>
				</div>
				
			</fieldset>
		</form>
		
	</div>
	
</body>
</html>