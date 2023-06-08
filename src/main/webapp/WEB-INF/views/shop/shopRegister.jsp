<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Register</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">
<style>
	*{font-family: 'NanumSquareNeoBold';}
	.container{width: 70%; margin-top:100px;}
</style>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp">
		</c:import>
	</header>
	<form action="/shop/insertShop" method="post" enctype="multipart/form-data">
	<main>
		<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<h2 class="mb-5" style="text-align:center;">공구 등록</h2>
			
			<div class="row input1">
				<div class="mb-3">
					<div class="col-12 col-md-12 col-xl-12">
						<div class="input-group mb-3">
  							<label for="formFile" class="form-label">사진 선택</label>
  							<input class="form-control" type="file" id="files" name="files" multiple>
  						</div>
					</div>
				</div>
				<div class="mb-3">
					<div class="col-12 col-md-12 col-xl-12">
						<div class="input-group mb-3">
							<input class="form-control form-control-lg" type="text" id="title" name="title" placeholder="제목을 입력해 주세요" aria-label=".form-control-lg example">
						</div>
					</div>
				</div>
			</div>
			
			<div class="input2">
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span>
						<input type="text" class="form-control" id="productName" name="productName" required>
					</div>
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">판매 가격</span>
						<input type="text" class="form-control" id="productPrice" name="productPrice" required>
					</div>
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">마감 기한</span>
						<input type="date" class="form-control" id="deadLineTemp" name="deadLineTemp" required>
					</div>
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">최소 인원</span>
						<input type="text" class="form-control" id="min" name="min" required>
					</div>
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					<div class="input-group mb-3">
						<span class="input-group-text">최대 인원</span>
						<input type="text" class="form-control" id="max" name="max" required>
					</div>
				</div>
				<div class="col-12 col-md-6 col-xl-6">
					<div class="mb-3">
  						<label for="exampleFormControlTextarea1" class="form-label">추가 정보 입력</label>
 						 <textarea class="form-control" id="detail" name="detail" rows="3"></textarea>
					</div>
				</div>
			</div>
			
			<div class="footer">
				
			</div>
			<div class="buttons">
				<div class="col-xl-12 col-md-12 col-xs-12 text-center">
					<button class="btn btn-primary">등록</button>
					<input type="button" value="취소" class="btn btn-primary">
				</div>
			</div>
			
		</div>
	</main>
	</form>
</body>
</html>