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

<title>SkyGround</title>

<style type="text/css">
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
	
	.container {
		width : 80%;
		padding : 10px;
	    margin-right: auto;
	    margin-left: auto;
	}
	
	div {
	    display: block;
	}
	
	body {
	    font-size: 14px;
	    line-height: 1.42857143;
	    color: #333;
	}
	
	.navbar{
		border-radius: 0px;
		margin-bottom: 200px;
	}
	
	.jumbotron {
		margin-bottom:0px;
	}
</style>

</head>
<body>

	<div class="container">
		<table class="table table-hover">
			<thead>
				<tr>
					<th width="10%">순번</th>
					<th width="55%">제목</th>
					<th width="20%">작성자</th>
					<th width="15%">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${code==200}">
					<c:forEach var="ql" items="${qnaSearch}" varStatus="vs">
						<tr>
							<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${vs.index+1}</a></td>
							<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${ql.qt_title}</a></td>
							<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${ql.email}</a></td>
							<td><a href="questionDetailCon?qt_turn=${ql.qt_turn}">${ql.qt_date}</a></td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
		<c:if test="${code==201}">
			<tr>
				<h2>검색하신 자료가 존재하지 않습니다.</h2>
			<tr>
		</c:if>
		
		<a onclick="qnalogInCheck();" class="btn btn-success">질문하기</a>
		<a onclick="myListlogInCheck()" class="btn btn-warning" id="qnaMyBtn">내 질문목록</a>

		<!--페이징  -->
		<div class="text-center">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
			</ul>
		</div>
		<!--text-center 페이징  -->
		
	</div>
	
</body>
</html>