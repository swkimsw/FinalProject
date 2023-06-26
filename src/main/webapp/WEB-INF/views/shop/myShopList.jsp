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
<link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">

<style>
body {
	background-color: rgba(255,255,194,0.75);
}

* {
	font-family: NanumSquareNeo;
}

.container {
	margin-top: 100px;
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
				<h3> ${info.name}님의 공구 신청 목록</h3>
				<h5>${info.clientId}</h5>
				<c:forEach var="c" items="${list}">
					<a href="/shop/toShopApply?code=${c.groupbuyingCode}">${c.title}</a>
					<p>상품명 : ${c.productName}</p>
					<p>가격 : ${c.productPrice} 원</p>
					<p>수량 : ${c.quantity}</p>
					<p>합계액 : ${c.productPrice * c.quantity} 원</p>
					<hr>
				</c:forEach>
			</c:when>
			<c:when test="${sessionScope.authGradeCode == 1002}">
					<h3> ${info.companyName}님의 공구 등록 목록</h3>
					<h5>${info.businessId}</h5>
				<c:forEach var="b" items="${list}">
					<a href="/shop/toShopApply?code=${b.groupbuyingCode}">${b.title}</a>
					<p>상품명 : ${b.productName}</p>
					<p>가격 : ${b.productPrice} 원 </p>
					<p>신청건수 : ${b.applyCount}</p>
					<p>상품수량 : ${b.applyQuantity}</p>
					<p>총 매출 : ${b.productPrice * b.applyQuantity}</p>
					<button onclick="openInfo(${b.groupbuyingCode})">신청자 목록</button>
					<hr>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>		
	
	
	
	
	<script>
		function openInfo(int groupbuyingCode){
			const option = 'width:700, height:800, scrollbars=yes';
			window.open('shop/buyingeMemberInfoList','_parent',option);
		}
		
	</script>
</body>
</html>