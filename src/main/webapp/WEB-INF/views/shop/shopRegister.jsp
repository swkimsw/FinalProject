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
<!-- footer css -->
<link href="${path}/resources/css/pageFooter.css" rel="stylesheet" type="text/css">
<style>
	*{font-family: 'NanumSquareNeo'; box-sizing: border-box;}
	body{background-color:rgba(255, 255, 194, 0.5);}
	textarea{resize:none;}
	.container{width: 70%; margin-top:100px; background-color:white;}
	.memberInfo{margin-top:2px; border:0;}
	#message{margin-top: 6px; margin-left: 92px;}
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
			<div class="input1">
					<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
						<div class="input-group mb-3">
							<input type="hidden" id="memberCode" name="memberCode" value="${sessionScope.code}">
							<input class="form-control form-control-lg" type="text" id="title" name="title" placeholder="제목을 입력해 주세요" aria-label=".form-control-lg example" required>
						</div>
					</div>
				
				<div id="zz" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span>
						<input type="text" class="form-control" id="productName" name="productName" required>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">판매 가격</span>
						<input type="text" class="form-control" id="productPrice" name="productPrice" placeholder=", / 원 제외 숫자만 입력해 주세요" required>
						<span class="input-group-text">원</span>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">마감 기한</span>
						<input type="datetime-local" class="form-control" id="deadLineTemp" name="deadLineTemp" required>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">최소 수량</span>
						<input type="text" class="form-control" id="min" name="min" placeholder="'개' 제외 숫자만 입력해 주세요" required>
						<span class="input-group-text">개</span>
					</div>
				</div>
			</div>
			
			<div class="input2">
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
  					<label for="formFile" class="form-label">사진 선택</label>
						<div class="input-group mb-3">
  							<input class="form-control" type="file" id="files" name="files" multiple required>
  						</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="mb-3">
  						<label for="exampleFormControlTextarea1" class="form-label">추가 정보 입력</label>
 						 <textarea class="form-control" id="detail" name="detail" rows="5"></textarea>
					</div>
				</div>
			</div>
			
			<div class="footer">
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<table class="table table-bordered">
						<tr>
							<td>업체명</td>
							<td style="padding:0px;">
								<input type="text" class="memberInfo form-control shadow-none" value="${memberDTO.companyName}" readonly>
							</td>
						</tr>
						<tr>
							<td>업체 연락처</td>
							<td style="padding:0px;">
								<input type="text" class="memberInfo form-control shadow-none" value="${memberDTO.phone}" readonly>
							</td>
						</tr>
						<tr>
							<td>배송 업체</td>
							<td style="padding:0px;">
 								<input type="text" class="memberInfo form-control" id="shippingCompany" name="shippingCompany" placeholder="배송 업체명을 입력해 주세요" required>
							</td>
						</tr>
						<tr>
							<td>교환 및 반품 주소</td>
							<td style="padding:0px;">
								<input type="text" class="memberInfo form-control shadow-none" value="${memberDTO.zipcode} ${memberDTO.address1} ${memberDTO.address2}" readonly>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="buttons">
				<div class="col-xl-12 col-md-12 col-xs-12 text-center">
					<button id="register" class="btn btn-success">등록</button>
					<a href="/shop/toShopList"><input type="button" value="취소" class="btn btn-success"></a>
				</div>
			</div>
			
		</div>
	</main>
	</form>
	<script>
	
		let regexProductPrice = /^[0-9]+$/;
		let regexMin = /^[0-9]+$/;
		
		$("#register").on("click", function(){
			
			let productPrice = $("#productPrice").val();
			let min = $("#min").val();
			
			let resultProductPrice = regexProductPrice.exec(productPrice);
			let resultMin = regexMin.exec(min);
			
			if(!resultProductPrice){
				alert("상품가격 은 숫자로 입력해 주세요!");
				return false;
			}
			
			if(!resultMin){
				alert("최소 인원 은 숫자로 입력해 주세요!");
				return false;
			}
			
		})
	
		// 오늘 이전은 선택하지 못하도록 - 하루 뒤부터 선택 가능
		let days = 1 * 24 * 60 * 60 * 1000;
		
		var nowUtc = Date.now();
		var timeOff = new Date().getTimezoneOffset()*60000;
		var afterOneDay = new Date(nowUtc+days-timeOff).toISOString().substring(0,16);
		
		$("#deadLineTemp").attr("min", afterOneDay);
		
	</script>
	<c:import url="../commons/pageFooter.jsp"/>
</body>
</html>