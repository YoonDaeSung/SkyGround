<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SkyGround</title>
<script src="resources/jsFile/jquery-3.2.1.min.js"></script>
<script src="resources/jsFile/qna/qnaJS.js"></script>
<script src="resources/jsFile/qna/replyJS.js"></script>

<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">

<!-- 댓글버튼 클릭시 로그인 체크  -->
<script type="text/javascript">
/* 	function replylogInCheck() {
		
		if ( ${loginUser == null} ) {
			alert("로그인 이후 시도해주세요.");
		}
	} // replylogInCheck() */
</script>

<style>
body {
	background-image: url("resources/image/qnaImage/qnaListBg.jpg");
	background-size: cover;
}

.wrap {
	box-shadow: 3px 3px 3px 3px rgba(0, 0, 0, 0.15);
	padding: 20px;
	background-color: white;
	background-size: cover;
	width: 80%;
	height: 100%;
	margin-top: 15%;
	margin-left: 10%;
	margin-right: 10%;
	margin-bottom: 10%;
	border-radius: 5px;
}

.contents_box {
	border-radius: 5px;
	border: 2px;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	padding: 8px;
	line-height: 1.42857143;
	vertical-align: top;
	border: 2px solid #ddd;
	border-top: 2px;
}

.qt_turn_box {
	border-top: 2px;
}

.detail_box {
	padding-top: 50px;
}

.detailUpBtn {
	float: right;
}

.text_box_title {
	padding-left: 0px !important;
	padding-right: 0px !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	border: none;
	background-color: white !important;
}

.text_box_contents {
	padding-left: 0px !important;
	padding-right: 0px !important;
	padding-top: 0px !important;
	padding-bottom: 0px !important;
	border: none;
	background-color: white !important;
}
</style>
<title>SkyGround</title>
</head>

<body>
	<div class="main_header">
		<jsp:include page="../include/header.jsp" />
	</div>
	<div class="wrap">
		<div class="detail_box">
			<form id="checking">
				<div id="resultArea">
					<div class="container">
						<table class="table table-striped" style="text-align: left; border: 1px;">
							<thead>
								<tr class="qt_turn_box">
									<th colspan="1" style="background-color: #eeeeee; text-align: left;"> 
										순번 : <span id="turn">${qnaDetail.qt_turn}</span>
									</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>작성자 : ${qnaDetail.email}</td>
								</tr>
								<tr>
									<td>등록 일 : ${qnaDetail.qt_date}</td>
								</tr>
								<tr style="background-color: white;">
									<td>제목 : <input class="text_box_title" readonly="readonly"
										type="text" value="${qnaDetail.qt_title}"></td>
								</tr>
								<tr>
									<td height="250px">내용 :<input class="text_box_contents"
										readonly="readonly" type="text"
										value="${qnaDetail.qt_contents}"></td>
								</tr>
								<tr>
									<td>
										<a href="questionDetailCon?qt_turn=${prev.qt_turn}">
										<span class="glyphicon glyphicon-chevron-left"></span>이전글</a>
										&nbsp;&nbsp;||&nbsp;&nbsp;
										<a href="questionDetailCon?qt_turn=${next.qt_turn}">다음 글
										<span class="glyphicon glyphicon-chevron-right"></span></a>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="detailUpBtn">
							<!--글을 등록한 회원 및 관리자만 수정, 삭제 버튼 보이게하기 -->
							<c:if
								test="${(code==200) || (loginUser.email == 'admin@admin.com')}">
								<a class="btn btn-info" id="qnaUpdatefBtn">수정</a>
								<a class="btn btn-danger" href="questDeleteCon?qt_turn=${qnaDetail.qt_turn}">삭제 </a>
							</c:if>
						</div>

						<!--댓글 등록폼 ajax버튼  -->
						<c:if test="${loginUser != null}">
						<a class="btn btn-info" id="replyfBtn">댓글달기</a>
						</c:if>
						<a class="btn btn-warning" id="replyListBtn">댓글목록</a>
						<div id="resultReplyf"></div>

					</div>
					<!-- container -->
				</div>
				<!-- resultArea  -->
			</form>
		</div>
	</div>
	<!-- wrap -->

	<!-- footer include -->
	<div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>