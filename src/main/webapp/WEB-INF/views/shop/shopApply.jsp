<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop Apply</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" >
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">
<style>
	*{font-family: 'NanumSquareNeo';}
	.container{width: 70%; margin-top:100px;}\
</style>
</head>
<body>
	<header>
		<c:import url="../commons/gnb.jsp">
		</c:import>
	</header>
	<main>
	<form action="/shop/updateShop" method="post" enctype="multipart/form-data">
		<div class="container fluid shadow p-3 mb-5 bg-body-tertiary rounded">
			<h2 class="mb-5" style="text-align:center;">공구 신청</h2>

			<div class="images">
				<div id="carouselExampleIndicators" class="carousel slide mb-3">
  					<div class="carousel-indicators">
  						<c:forEach var="i" items="${fileDTO}">
  							
  						</c:forEach>
    					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    					<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  					</div>
  					<div class="carousel-inner">
  						<c:forEach var="i" items="${fileDTO}">
  							<div class="carousel-item active">
      							<img src="/resources/shopImg/${i.sysname}" class="d-block w-100" alt="...">
    						</div>
  						</c:forEach>
  					</div>
  					<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    					<span class="visually-hidden">Previous</span>
  					</button>
  					<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    					<span class="carousel-control-next-icon" aria-hidden="true"></span>
    					<span class="visually-hidden">Next</span>
  					</button>
				</div>
			</div>
			
			<div class="output">
					<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
						<div class="input-group mb-3">
							<input type="hidden" id="code" name="code" value="${shopDTO.code}">
							<input type="hidden" id="">
							<input class="form-control form-control-lg" type="text" id="title" name="title" value="${shopDTO.title}" aria-label=".form-control-lg example" readonly>
						</div>
					</div>
				
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">상품명</span>
						<input type="text" class="form-control" id="productName" name="productName" value="${shopDTO.productName}" readonly>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="mm input-group mb-3">
						<span class="input-group-text">판매 가격</span>
						<input type="text" class="form-control" id="productPrice" name="productPrice" value="${shopDTO.productPrice}" readonly>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">마감 기한</span>
						<input type="date" class="form-control" id="deadLineTemp" name="deadLineTemp" value="${shopDTO.deadLineTemp}" readonly>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">최소 인원</span>
						<input type="text" class="form-control" id="min" name="min" value="${shopDTO.min}" readonly>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">최대 인원</span>
						<input type="text" class="form-control" id="max" name="max" value="${shopDTO.max}" readonly>
					</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="input-group mb-3">
						<span class="input-group-text">개수</span>
						<input type="text" class="form-control" placeholder="입력해 주세요" id="quantity" name="quantity" required>
					</div>
				</div>
				<div id="imageSelect" class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto; display:none;">
  					<label for="formFile" class="form-label">사진 선택</label>
						<div class="input-group mb-3">
  							<input class="form-control" type="file" id="files" name="files" multiple>
  						</div>
				</div>
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<div class="mb-3">
  						<label for="exampleFormControlTextarea1" class="form-label">추가 정보 입력</label>
 						 <textarea class="form-control" id="detail" name="detail" rows="5" readonly>${shopDTO.detail}</textarea>
					</div>
				</div>
			</div>
			
			<div class="footer">
				<div class="col-12 col-md-8 col-xl-8" style="float:none; margin: 0 auto;">
					<table class="table table-bordered">
						<tr>
							<td>배송 업체</td>
							<td> CJ대한통운 (나중에 값 받아오기) </td>
						</tr>
						<tr>
							<td>업체 연락처</td>
							<td> 010-1234-5678 (나중에 값 받아오기) </td>
						</tr>
						<tr>
							<td>교환 및 반품 주소</td>
							<td> 서울특별시 중구 남대문로 120 (나중에 값 받아오기) </td>
						</tr>
					</table>
				</div>
			</div>
			<c:choose>
				<c:when test="${authgradeCode == 1002 and !loginId.equals(shopDTO.businessId)}">
					<!-- 등록하지 않은 판매자일 때 -->
					<div class="col-xl-12 col-md-12 col-xs-12 text-center">
						<div class="buttons">
							<a href="/"><input type="button" id="back" value="뒤로 가기" class="btn btn-primary"></a>
						</div>
					</div>
				</c:when>
				<c:when test="${authgradeCode == 1003}">
					<!-- 이용자 -->
					<div class="col-xl-12 col-md-12 col-xs-12 text-center">
						<div class="buttons">
							<input type="button" id="insertRequestBtn" value="신청" class="btn btn-primary">
							<a href="/"><input type="button" value="취소" class="btn btn-primary"></a>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<!-- 등록한 판매자 & 관리자 -->
					<div class="col-xl-12 col-md-12 col-xs-12 text-center">
						<div class="buttons">
							<input type="button" id="updateBtn" value="수정" class="btn btn-primary">
							<a href="/shop/deleteShop?code=${shopDTO.code}"><input type="button" id="deleteBtn" value="삭제" class="btn btn-primary"></a>
							<a href="/"><input type="button" id="back" value="취소" class="btn btn-primary"></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<hr>
		</div>
	</form>
	</main>
	<script>
		// 삭제, 취소 버튼 없애고 수정 완료, 취소 버튼 추가
		$("#updateBtn").on("click", function(){
			$("#title").removeAttr("readonly");
			$("#productName").removeAttr("readonly");
			$("#productPrice").removeAttr("readonly");
			$("#deadLineTemp").removeAttr("readonly");
			$("#max").removeAttr("readonly");
			$("#min").removeAttr("readonly");
			$("#detail").removeAttr("readonly");
			$("#imageSelect").removeAttr("style");
			$("#imageSelect").attr("style", 'float:none; margin: 0 auto;');
			$("#quantity").prop("readonly",true);
			
			$("#updateBtn, #deleteBtn, #back").css("display", "none");

			let updateComplete = $("<button class='btn btn-primary'>");
			updateComplete.text("수정 완료");
			
			let cancel = $("<button type='button' class='btn btn-primary'>");
			cancel.text("취소");
			cancel.on("click", function(){
				location.reload();
			})
			
			$(".buttons").append(updateComplete);
			$(".buttons").append("&nbsp;");
			$(".buttons").append(cancel);
		})
		
		// 신청 버튼 클릭시
		$("#insertRequestBtn").on("click", function(){
			let quantity = $("#quantity").val();
			let code = $("#code").val();
			let clientCode = ${clientCode};
			location.href="/shop/insertShopRequest?quantity="+quantity+"&parentCode="+code+"&clientCode="+clientCode;
		})
		
	</script>
</body>
</html>