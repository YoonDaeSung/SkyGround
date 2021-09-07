<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
	.form-control[readonly] {
		cursor: default;
	}
	
	.replyUpBtn {
		float: right;
	}
	
	.date{
		float: right !important;
	}
	
	.admin_reply{
	color:#ff6421;
	font-size: 16px;
	margin-bottom: -20px;
	}
</style>
</head>
<body>
	<br>
	<div id="replyBox">
		<fieldset>
			<legend>댓글 목록</legend>
			<c:forEach var="rl" items="${replyList}" varStatus="vs">
				<form>	
						<c:choose>
							<c:when test="${(rl.email == 'admin@admin.com')}">
								<label>작성자 : <span class="admin_reply">관리자 답변입니다.</span></label>
							</c:when>
							
							<c:otherwise>
								<label>작성자 : ${rl.email}</label>
							</c:otherwise>
						</c:choose>
						
						<input id="re_email" type="hidden" value="${rl.email}">
						
						<label class="date" style="float: right;"> 작성 일: ${rl.re_date}</label>
						<input id="re_date" type="hidden" value="${rl.re_date}">
						
						<div style="clear: both;"></div> 
						
						<!-- 댓글 순번  -->
						<input id="re_turn" type="hidden" value="${rl.re_turn}"><br>

					<div class="form-group">
						<label>내용</label>
						<input type="text" class="form-control" name="re_contents" id="re_contents${vs.count}"
							value="${rl.re_contents}" readonly="readonly"> <br><br>
						
						<input id="qt_turn" type="hidden" value="${rl.qt_turn}">
						
						<c:if test="${(loginUser.email == rl.email) || (loginUser.email == 'admin@admin.com')}">
							<div class="replyUpBtn">
								<input type="button" class="btn btn-info" onclick="replyUpdateBtn('${rl.re_turn}', '${vs.count}')" id="replyUpdatefBtn" value="댓글수정">
								<input type="hidden" class="btn btn-info" onclick="updateComple('${vs.count}')" id="rlyBtn" value="수정완료">
								
								<input type="button" class="btn btn-danger" onclick="replyDeleteBtn('${rl.re_turn}')" value="댓글삭제">
							</div>
						</c:if>
					</div>
					<div class="clearfix"></div>
				</form> <br><hr>
			</c:forEach>
		</fieldset>
	</div>
	
</body>
</html>