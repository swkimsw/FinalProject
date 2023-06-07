<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
<style>
* {
	font-family: NanumSquareNeoBold;
}

.container {
	margin-top: 100px;
	border: 1px solid black;
}
</style>
</head>
<body>
	<!-- gnb -->
	<c:import url="../commons/gnb.jsp">
	</c:import>

	<div class="container">
		<div class="header">
			<div class="row">
				<div class="col-8">
					<input type="text" class="form-control " name="searchByText">
				</div>
				<div class="col-2">
					<button class="btn btn-primary ">검색</button>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<input type="date" name="searchByDate"> ~ <input
						type="date" name="searchByDate2">
				</div>
			</div>
		</div>
		<div class="body">
			<div class="row">
				<div class="col-4 col-md-3 col-sm-2">
					<div class="card" style="width: 18rem;">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">싱싱한귤</h5>
							<p class="card-text">감귤농가</p>
						</div>
						<div class="card-footer">
							<small>날짜</small>
						</div>
					</div>
				</div>	
				<div class="col-4 col-md-3 col-sm-2">
					<div class="card" style="width: 18rem;">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">싱싱한귤</h5>
							<p class="card-text">감귤농가</p>
						</div>
						<div class="card-footer">
							<small>날짜</small>
						</div>
					</div>
				</div>	
				<div class="col-4 col-md-3 col-sm-2">
					<div class="card" style="width: 18rem;">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">싱싱한귤</h5>
							<p class="card-text">감귤농가</p>
						</div>
						<div class="card-footer">
							<small>날짜</small>
						</div>
					</div>
				</div>	
				<div class="col-4 col-md-3 col-sm-2">
					<div class="card" style="width: 18rem;">
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">싱싱한귤</h5>
							<p class="card-text">감귤농가</p>
						</div>
						<div class="card-footer">
							<small>날짜</small>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>



</body>
</html>