<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js"></script>

<script src="resources/jsFile/room/roomJS.js"></script>

<title>객실 정보 입력</title>
</head>
<body>

	<form id="insertR" action="insR" method="post">
		<div class="container" style="height: 100%">
			<h1>객실 추가</h1>
			<p>전체 입력 필수</p>
			<hr>
			
			<div>
				<label><b>객실 번호</b></label> <br>
				<input type="text" placeholder="숫자만 가능(필수)" name="rm_num" id="rm_num" required>
			</div> <br>
			
			<div>
				<label><b>객실 이름</b></label> <br> 
				<input type="text" placeholder="객실 이름(필수)" name="rm_name" id="rm_name" required>
			</div> <br>
			<div>
				<label><b>비 성수기 가격(평일)</b></label> <br>
				<input type="text" placeholder="비 성수기 가(필수)" name="rm_nprice" id="rm_nprice" required>
			</div> <br>
			<div>
				<label><b>성수기 가격(평일)</b></label> <br>
				<input type="text" placeholder="성수기 가(필수)" name="rm_price" id="rm_price" required>
			</div> <br>
			<div>
				<label><b>최소 인원</b></label><br>
				<input type="text" placeholder="최소 인원" name="rm_min_prs" id="rm_min_prs" required>
			</div> <br>
			<div>
				<label><b>최대 인원</b></label> <br>
				<input type="text" placeholder="최대 인원(필수)" name="rm_max_prs" id="rm_max_prs" required>
			</div> <br>
			<div>
				<label><b>객실 크기(제곱)</b></label> <br>
				<input type="text" placeholder="객실 크기(제곱미터)" name="rm_size" id="rm_size" required>
			</div> <br>
			<div>
				<label><b>객실 크기(평)</b></label> <br>
				<input type="text" placeholder="객실 크기(평 수)" name="rm_pyeong" id="rm_pyeong" required>
			</div> <br>
			<div>
				<label><b>객실 구조</b></label> <br>
				<input type="text" placeholder="객실 구조(ex>1LDK)" name="rm_strt" id="rm_strt" required>
			</div> <br>
			<div>
				<label><b>객실 내부 시설</b></label> <br>
				<textarea rows="5" cols="60" placeholder="객실 시설" name="rm_inst" id="rm_inst" required></textarea>
			</div>
		</div>
		
		<input type="submit" id="ok" name="submit" class="btn btn-success" value="승인" onclick="insertResult()" style="margin-left: 50%; margin-bottom: 2%;">
		<button type="reset" id="cancel" name="cancel" class="btn btn-danger" value="cancel" style="margin-bottom: 2%">취소</button>
	</form>
	<div style="clear: both"></div>
	
</body>
</html>