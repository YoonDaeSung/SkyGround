<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">

<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js"></script>

<script src="resources/jsFile/qna/replyJS.js"></script>
<title>SkyGround</title>
</head>
<body>
	<div id="replyBox">
		<fieldset>
			<legend>댓글 목록</legend>
			<c:forEach var="ru" items="${replyUp}">
				<form>
					<label>작성자 : ${ru.email}</label> <label class="date"
						style="float: right;"> 작성 일: ${ru.re_date}</label>
					<div style="clear: both;"></div>

					<!-- 댓글 순번  -->
					<input id="re_turn" type="hidden" value="${ru.re_turn}"><br>

					<div class="form-group">
						<label>내용</label> <input type="text" class="form-control"
							name="re_contents" id="re_contents" value="${ru.re_contents}"
							readonly="readonly"> <br>
						<br>

							<div class="replyUpBtn">
								<input id="qnaUpdatefBtn" type="button" class="btn btn-info" value="수정 완료">
							</div>
					</div>
					<div class="clearfix"></div>

				</form>
				<br>
				<hr>
			</c:forEach>
		</fieldset>
	</div>

</body>
</html>