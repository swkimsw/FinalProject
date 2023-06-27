<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
body {
	background-color: rgba(255, 255, 194, 0.75);
}

* {
	font-family: NanumSquareNeo;
}

.container {
	margin-top: 100px;
}

.subNav {
	/*position: fixed;
	width: 100%;
	z-index: 2;*/
}

.naviColor{
	border: 1px solid rgba(0,0,0,0.2);
	border-radius:10px;
	background-color:white;
}

.searchGroup {
	position: relative;
	width: 100%;
	height: 40px;
	z-index: 3;
}

.searchGroup>.category {
	height: 100%;
	max-width: 85px;
	min-width: 85px;
}

.searchGroup>.searchInput {
	max-width: 250px;
	min-width: 100px;
	height: 100%;
	z-index: 4;
}

.searchGroup>.searchIcon {
	position: absolute;
	top: 10px;
	left: 300px;
	z-index: 5;
}
</style>
</head>
<body>
	<!-- gnb -->
	<c:import url="../commons/gnb.jsp">
	</c:import>

	<div class="container">
		<c:choose>
			<c:when test="${sessionScope.authGradeCode == 1003}">
				<h3>${info.name}님의공구신청목록</h3>
				<h5>${info.clientId}</h5>
				<div class="subNav">
					<nav class="navbar bg-body-tertiary navbar-expand-sm">
						<div class="container-fluid" style="border-radius:10px;">
							<div class="naviColor row navbar w-100">
								<div class="col linkGroup" style="position: relative; width: 100%; border-radius:10px;">
									<ul class="navbar-nav me-auto mb-2 mb-lg-0">
										<li class="nav-item">
											<a class="nav-link fs-5" href="/shop/toShopList">
												<button class="nav-item btn active">전체</button>
											</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/shop/toShopList?status=open">진행중</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/shop/toShopList?status=closed">공구 완료</a>
										</li>
										<li class="nav-item">
											<a class="nav-link" href="/shop/toShopList?status=closed">공구 실패</a>
										</li>
									</ul>
								</div>
								<div class="col input-group searchGroup">
									<select class="form-select form-select-sm category"
										name="category">
										<option value="productName">상품명</option>
										<option value="companyName">판매자</option>
									</select> <i class='bi bi-search searchIcon'></i> <input
										class="form-control form-control-sm searchInput"
										onkeypress="if(event.keyCode == 13 ){getSearchList()}"
										type="search" id="keyword" name="searchByKeyword"
										placeholder="검색어를 입력해주세요." maxlength="20">
								</div>
							</div>
						</div>
					</nav>
				</div>
				<br>
				<c:forEach var="c" items="${list}">
<<<<<<< HEAD
					<a href="/shop/toShopApply?code=${c.groupbuyingCode}">${c.title}</a>
					<p>상품명 : ${c.productName}</p>
					<p>가격 : ${c.productPrice} 원</p>
					<p>수량 : ${c.quantity}</p>
					<p>합계액 : ${c.productPrice * c.quantity} 원</p>
=======
					<div class="card mb-3" style="max-width: 540px;">
						<div class="row g-0">
							<div class="col-md-4">
								<img src="${c.path}${c.sysName}" class="img-fluid rounded-start"
									alt="...">
							</div>
							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title">
										<a href="/shop/toShopApply?code=${c.groupbuyingCode}">${c.title}</a>
									</h5>
									<p class="card-text">상품명 : ${c.productName}</p>
									<p class="card-text">판매자 : ${c.companyName}</p>
									<p class="card-text">가격 : ${c.productPrice} 원</p>
									<p class="card-text">수량 : ${c.quantity} 개</p>
									<p class="card-text">합계액 : ${c.productPrice * c.quantity} 원</p>
									<p class="card-text">마감 : ${c.deadLineTemp}</p>
									<p class="card-text">
										<small class="text-body-secondary">스테코드 :
											${c.statusCode}</small>
									</p>
								</div>
							</div>
						</div>
					</div>
>>>>>>> 4668cc9af33f8cc4d533391a94e79612a1f3b52a
					<hr>
				</c:forEach>
			</c:when>
			<c:when test="${sessionScope.authGradeCode == 1002}">
				<h3>${info.companyName}님의공구등록목록</h3>
				<h5>${info.businessId}</h5>
				<c:forEach var="b" items="${list}">
					<a href="/shop/toShopApply?code=${b.groupbuyingCode}">${b.title}</a>
					<p>상품명 : ${b.productName}</p>
					<p>가격 : ${b.productPrice} 원</p>
					<p>신청건수 : ${b.applyCount}</p>
					<p>상품수량 : ${b.applyQuantity}</p>
					<p>총 매출 : ${b.productPrice * b.applyQuantity}</p>
					<button onclick="openInfo(${b.groupbuyingCode})">신청자 목록</button>
					
					<hr>
				</c:forEach>
			</c:when>
		</c:choose>
<<<<<<< HEAD
	</div>		
	
	
	
	
	<script>
		function openInfo(a){
			window.open("/shop/buyingMemberInfoList?code="+a ,"list","width=1200, height=600,left=200, top=100, scrollbars=yes");
		}
		
	</script>
=======
	</div>
>>>>>>> 4668cc9af33f8cc4d533391a94e79612a1f3b52a
</body>
</html>


























