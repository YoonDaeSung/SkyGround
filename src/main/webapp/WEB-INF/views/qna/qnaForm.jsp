<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!--부트스트랩 사용하기  -->
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">

<script src="resources/bootstrap/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js"></script>

<script src="resources/jsFile/qna/qnaJS.js"></script>

<title>SkyGround</title>

<style type="text/css">
	.main{padding-top: 30px; padding-left: 200px;}
	.titleBox{height:30px; width: 700px;}
	.contentsBox{height:150px; width: 700px; overflow: scroll;}
	.tagbox{height:150px; width: 700px; overflow: scroll;}
	.date{border:none; decoration: none;}
</style>

</head>
<body>
	
	<div class="main">
		
		<!--현재 날짜 자동 불러오기  -->
		<form id="questionJoin">
			
			<input class="date" type="date" name="qt_date" id="qt_date" readonly="readonly">
			
			<input type="hidden" id="email" name="email" value="${loginUser.email}">
			
			<script>
				document.getElementById('qt_date').value = new Date().toISOString().substring(0, 10);
			</script>
			
			${loginUser.email} 
			<hr>
					
			<h3>질문하기 </h3>
			<h5>${loginUser.name}님 질문을 등록해주세요</h5>
			
			<h4>제목</h4>
			<input type="text" class="titleBox" name="qt_title" id="qt_title" placeholder="제목을 입력해주세요." required> <br>
			
			<h4>내용</h4>
			<input type="text" class="contentsBox" name="qt_contents" id="qt_contents" placeholder="내용을 입력해주세요." required>
			<br><br><br>
			
			<a class="btn btn-success" id="qnaBtn">질문 등록</a> &nbsp; &nbsp; 
			<input class="btn btn-danger" type="reset" value="전부 초기화">
		</form>
		
	</div>
	
</body>
</html>