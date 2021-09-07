<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>" rel="stylesheet">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	
	<script src="resources/jsFile/room/roomJS.js"></script>	
	<script src="resources/jsFile/jquery-3.2.1.min.js"></script>
	
<title>SkyGround</title>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<form style="margin-top: 200px; margin-left: 9%;">
		<c:forEach var="li" items="${listR}" varStatus="vs">
			<c:if test="${vs.index == 0}">
				<c:set var="rm" value="0"></c:set>
			</c:if>
			<c:if test="${rm != li.rm_num && vs.index >= 0}">
				<br>	
				<c:set var="rm" value="${li.rm_num}"></c:set>	
				<img class="box img-circle" src="resources/image/${li.rm_image}" 
					width="400" height="300" style="float: left; margin-left: 14px; margin-right: 20px;margin-top: 0,auto;">
					
				<div class="container">
				  	<h2>객실 정보 / ${li.rm_name}</h2>
				  <table class="table table-hover" style="width: 700px">
				    <thead>
				       <tr>
					        <th>비 성수기</th>
					        <th>성수기 </th>
					        <th>최소 인원</th>
					        <th>최대 인원</th>
					        <th>객실 규모(㎡)</th>
					        <th>객실 규모(평)</th>
					        <th>객실 구조</th>
					   </tr>
				    </thead>
				    <tbody>
				    	<tr>
				    		<td>${li.rm_nprice}원</td>
							<td>${li.rm_price}원</td>
							<td>${li.rm_min_prs}인</td>
							<td>${li.rm_max_prs}인</td>
							<td>${li.rm_size}㎡ </td>
							<td>${li.rm_pyeong}평</td>
				    		<td>${li.rm_strt}</td>
				    		
				    		<td>
				    			<span style="cursor: pointer;">
				  					<a href="detailRF?rm_num=${li.rm_num}">자세히</a>
				  				</span>
				  			</td>
				      </tr>
				    </tbody>
				  </table>
				</div>
				<hr>
			</c:if>
		</c:forEach>
	</form>
	<!-- footer include -->
	<div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>