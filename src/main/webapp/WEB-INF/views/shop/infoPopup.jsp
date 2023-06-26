<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookCook - Shop</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap bundle -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- awesome font -icon -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<title>신청차 정보</title>
<style>

* {
	font-family: NanumSquareNeo;
}
</style>
</head>
<body>
	<div class="container">
		<table class="table table-striped">
	 		<thead>
	 			<tr>
	 				<th></th>
	 				<th></th>
	 				<th></th>
	 				<th></th>
	 				<th></th>
	 				
	 				
	 			</tr>
	 		</thead>
	 		<tbody>
	 			<c:choose>
	 				<c:when test="${fn:length(list) > 0}">
			 			<c:forEach var="i" items="${list}">
				 			<tr>
				 				<th scope='row'></th>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 				<td></td>
				 			</tr>
		 				</c:forEach>
		 			</c:when>
		 			<c:otherwise>
		 				
		 			</c:otherwise>
	 			</c:choose>
	 		</tbody>
	 		
	 		<tfoot>
	 			<tr>
	 				<td><button>닫기</button></td>
	 			</tr>
	 		</tfoot>
		</table>
	</div>

</body>
</html>

