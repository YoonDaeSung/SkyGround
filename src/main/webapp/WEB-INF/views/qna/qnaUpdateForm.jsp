<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.css">

<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js"></script>

<script src="resources/jsFile/qna/qnaJS.js"></script>

<title>SkyGround</title>

<style>
	.container {
		width:80%;
	}
</style>

</head>
<body>
	
	<div class="container">
		
		<form id="qtUpdate">
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
						<td>작성자 : <span id="user_email">${qnaDetail.email}</span></td>
					</tr>
					<tr>
						<td>등록 일 : <span id="date">${qnaDetail.qt_date}</span></td>
					</tr>
					<tr style="background-color: white;">
						<td>
							제목 : <input id="qt_title" name="qt_title" class="text_box_title"  type="text" value="${qnaDetail.qt_title}">
														
						</td>
					</tr>
					<tr>
						<td height="250px">
							내용 : <input id="qt_contents" name="qt_contents" class="text_box_contents" type="text" value="${qnaDetail.qt_contents}">
								 
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="detailUpBtn">
				<a class="btn btn-info" href="" id="qnaUpdateBtn">수정 완료</a>
				<a class="btn btn-danger" href=""> 취소 </a>
			</div>
		</form>
		
	</div> <!-- container -->
	
</body>
</html>