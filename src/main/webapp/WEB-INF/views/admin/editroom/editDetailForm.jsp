<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- FONT LINK -->
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=UnifrakturCook:700'>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="resources/jsFile/jquery-3.2.1.min.js"></script>

<script src="resources/jsFile/room/roomJS.js"></script>

<title>Room_Detail</title>

<style>
	.container-fluid {
		padding-top: 0px;
		padding-bottom: 0px;
	}
</style>

</head>
<body>
	<div>
	<!-- 헤더 넣으면 됌 -->
	</div>
	
	<form id="modiR" style="margin-top: 200px" enctype="multipart/form-data" method="post">
		<c:forEach var="ed" items="${editD}" varStatus="vs">
			<c:if test="${vs.index == 0}">
				<c:set var="rm" value="0"></c:set>
				<div class=" bg1 text-center" >
					<input type="text" value="${ed.rm_num}">
					<h3 class="margin"><input type="text" value="${ed.rm_name}" style="align-items: center;"></h3>
					<img src="resources/image/${ed.rm_image}" class="img-responsive img-circle margin" 
						style="display:inline;" alt="Bird" width="350" height="350">
						
					<div class="clear"></div>
					<input type="button" value="대표이미지 수정">
					
					<div class="container">
						<h2>객실 정보 </h2>
						
						<table class="table table-hover">
							<thead>
								<tr>
									<th>비 성수기 평일</th>
									<th>성수기 평일(비 성수기 주말과 동일)</th>
									<th>최소 인원</th>
									<th>최대 인원</th>
									<th>객실 구조</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" value="${ed.rm_nprice}"></td>
									<td><input type="text" value="${ed.rm_price}"></td>
									<td><input type="text" value="${ed.rm_min_prs}"></td>
									<td><input type="text" value="${ed.rm_max_prs}"></td>
									<td><input type="text" value="${ed.rm_strt}"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- Second Container -->
				<div class=" bg-2 text-center">
					<h3 class="margin">객실 특징</h3>
					<font color="black"><input type="text" value="" width="800px" height="500px"></font>
				</div>
				
				<!-- Third Container (Grid) -->
				<div class=" bg-3 text-center">
					<h3 class="margin">Where To Find Me?</h3> <br>
				</div>
			</c:if>
			
			<c:if test="${rm != ed.rm_num && vs.index >=0}">
				<div class="row"style="display:inline;">
					<div class="col-sm-4">
						<p>image introduce</p>
						<img src="resources/image/${ed.rm_image}" class="img-responsive margin" 
							style="width:400px; height: 300px; display: inline;" alt="Image">
					</div>
					
					<button type="submit" class="btn btn-danger" style="float: center;  width: 100px; height: 50px; margin-top: 10%;">이미지 삭제</button>
					<button type="submit" class="btn btn-success" style="float: center; width: 100px; height: 50px; margin-top: 10%;">이미지 수정</button>
				</div>
			</c:if>
			
			<c:if test="${vs.last}">
				<a href="delR?rm_num=${ed.rm_num}" style="margin-left: 50%;">객실 삭제</a><!-- DELETE ALL -->
			</c:if>
		</c:forEach>
	</form>
	
	<div>
		<button type="button" class="btn " style="float: right; width: 200px;">이미지 추가</button>
		<div class="clear"></div>
		
		<input type="button" id="editBtn" name="editBtn" class="btn btn-success" value="수정">
		<a href="editL">
			<input type="button" value="목록으로">
		</a>
		<button type="button"  style="float: right; width : 100px; margin-bottom: 5%; margin-right: 5%;">TOP</button>
	</div>

</body>
</html>