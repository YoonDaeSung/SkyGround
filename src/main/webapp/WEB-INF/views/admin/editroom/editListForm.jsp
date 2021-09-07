<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!-- 나눔 고딕 FONT -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>객실 정보 입력 및 수정</title>
</head>
<body>
	
	<form style="margin-top: 200px">
		<c:forEach var="li" items="${editL}" varStatus="vs">
			<c:if test="${vs.index == 0}">
				<c:set var="rm" value="0"></c:set>
			</c:if>
			<c:if test="${rm != li.rm_num && vs.index >= 0}">
				<br>	
				<c:set var="rm" value="${li.rm_num}"></c:set>	
				<img class="box" src="resources/image/${li.rm_image}" 
					width="200" height="150" align="middle" style="float: left; margin: 14px;">
				<div class="container">
					<h2>${li.rm_name} / 객실 정보</h2>
					<table class="table table-hover" style="width: 700px">
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
								<td>${li.rm_nprice}</td>
								<td>${li.rm_price}</td>
								<td>${li.rm_min_prs}</td>
								<td>${li.rm_max_prs}</td>
								<td>${li.rm_strt}</td>
								<td>
									<span style="cursor: pointer;">
										<a href="editD?rm_num=${li.rm_num}">수정 </a>
									</span>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</c:if>
		</c:forEach>
		
		<a href="editI">
			<input type="button" class="btn btn-primary" value="객실 추가하기" style="width:300px ; margin-left: 80%; margin-bottom: 50px">
		</a>
	</form>

</body>
</html>