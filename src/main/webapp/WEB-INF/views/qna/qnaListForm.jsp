<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--헤더띄우기  -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">

<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js"></script>

<script src="resources/jsFile/qna/qnaJS.js"></script>

<title>SkyGround</title>

<!-- 질문버튼 클릭시 로그인 체크  -->
<script type="text/javascript">
	function qnalogInCheck() {
		
		if ( ${loginUser == null} ) {
			alert("로그인 이후 시도해주세요.");
			
		} else {
			var screenW = screen.availWidth;
			var screenH = screen.availHeight;
			var popW = 800;
			var popH = 450;
			var posL = (screenW - popW) / 2;
			var posT = (screenH - popH) / 2;
			
			window.open("qnaF", "", 'width=' + popW + ', height=' + popH
					+ ', left=' + posL + ', top=' + posT);
		}
	} // qnalogInCheck()
</script>

<style type="text/css">
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
		margin-bottom: 20px;
		margin-right: 10%;
		margin-bottom : 10%;
		border-radius: 5px;
	}
	
	.header_box_bg {
		background-image: url("resources/image/qnaImage/qnaListHeader.png");
		background-repeat: no-repeat;
		background-size: cover;
		align-content: center;
		background-position: center center;
		width: 600px;
		padding: 10px;
		margin-top: 20px;
		border-width: 2px;
		border-radius: 5px;
		z-index: 0;
		border-radius: 5px;
		border-width: 2px;
		margin-top: 20px;
		padding: 10px;
		width: 600px;
	}
	
	.header_box {
		background-size: cover;
		align-content: center;
		width: 600px;
		padding: 10px;
		margin-top: 20px;
		border-width: 2px;
		border-radius: 5px;
		z-index: 3;
	}
	
	.main_header {
		position: fixed;
		display: block;
		align-content: center;
	}
	
	.search_box {
		width: 60%;
	}
	
	a{
		text-decoration: none !important;
	}
	
	a:link {
		text-decoration: none;
		color: black;
		!important;
	}
	
	a:visited {
		text-decoration: none !important;
		color: black;
	}
	
	a {
		text-decoration: none !important;
		color: black;
		!important;
	}
	
	.search_box {
		width: 70% !important;
		border-radius: 10px;
		height: 10px;
	}
	
	.search_box:active {
		border-color: #f2ff93;
		border : 2px;
	}
	
	.glyphicon-search{
	
	}
</style>

</head>
<body>
	<div class="main_header">
		<jsp:include page="../include/header.jsp" />
	</div>

	<div class="wrap" align="center">
		<!--head_box 및 검색창  -->
		<div class="header_box">
			<div class="head_title">
				<a href="qnaListF">
					<h2>궁금하신점이 있으신가요?</h2>
					<h5>서로 질문을 공유하고 정보를 나눠 보세요</h5>
				</a>
			</div> <br>
			
			<form name="search" method="post">
				<span>
					<select name="keyField" id="keyField">
						<option value="qt_title">제목</option>
						<option value="qt_contents">내용</option>
						<option value="email">작성자</option>
					</select>
				</span>
				<input type="text" class="search_box" name="keyword" id="keyword" placeholder="궁금하신 항목을 검색해 주세요.">
				<a class="glyphicon glyphicon-search" id="qnaSearchBtn"></a>
				
			</form>
		</div>

		<div id="resultArea">
			<div class="container">
				<table class="table table-hover">
					<thead>
						<tr>
							<th width="10%">순번</th>
							<th width="55%">제목</th>
							<th width="20%">작성자</th>
							<th width="15%">등록 일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ql" items="${qnaList}">
							<tr>
								<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${ql.qt_turn}</a></td>
								<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${ql.qt_title}</a></td>
								<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${ql.email}</a></td>
								<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${ql.qt_date}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<a onclick="qnalogInCheck();" class="btn btn-success">질문하기</a> <br>
				
				<!--페이징  -->
				<c:forEach var="i" begin="${startPageNum}" end="${endPageNum}">
					<c:if test="${pageNum == i}">
						<ul class="pagination" style="color: red; z-index: 0;">
							<li style="color: red;"><a href="qnaListF?pageNum=${i}">${i}</a></li>
						</ul>
					</c:if>
					
					<c:if test="${pageNum != i}">
						<ul class="pagination">
							<li><a href="qnaListF?pageNum=${i}">${i}</a></li>
						</ul>
					</c:if>
				</c:forEach>
				<!--text-center 페이징  -->
			
			</div>
			<!--container  -->
		</div>
		<!--resultArea  -->

	</div>

	<!-- footer include -->
	<div>
		<jsp:include page="../include/footer.jsp" />
	</div>
	
</body>
</html>