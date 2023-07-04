<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CookCook - My Shop</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
<!-- awesome font -icon -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet" type="text/css">
<!-- footer css -->
<link href="${path}/resources/css/pageFooter.css" rel="stylesheet" type="text/css">
<!--  myShopList css -->
<link href="${path}/resources/css/shop/myShopList.css" rel="stylesheet" type="text/css">
<!-- myShopList js -->
<script src="${path}/resources/js/shop/myShopList.js"></script>
</head>
<body>
	<header>
		<!-- gnb -->
		<c:import url="../commons/gnb.jsp">
		</c:import>
	</header>
	
	<main>
		<div class="container msContainer w-75">
			<c:choose>
			
				<%-- 세션 code = 1003일때 일반회원 공구 신청 목록  --%>
				<c:when test="${sessionScope.authGradeCode == 1003}">
					<div class="client-wrapper" style="height:auto;margin-bottom: 200px;">
						<div class="row clientHeader">
							<div class="co1 col-md-6"><h3><i class="bi bi-send-check-fill"></i>&ensp;${info.name}님의 신청 목록</h3></div>
							<div class="col col-md-6">
								<select class="form-select w-50" name="clientCategory" onchange="clientSelect()">
									<option value="0" selected>전체</option>
									<option value="1001">진행중인 공구</option>
									<option value="1002">종료된 공구</option>
									<option value="1003">실패한 공구</option>
								</select>
							</div>
						</div>
						<div class="apply-wrapper applyList">
							
						</div>
					</div>
					<script type="text/javascript"> 
						$(document).ready(function() {
							$.ajax({
								url: "/shop/myShopListByStatus",
								type: "post",
								dataType : "json",
								data : {status : 0},
								error: function(){
									alert("서버 연결에 실패하였습니다.");
								}
							}).done(
								function(resp){
									appendClientDiv(resp);
								}		
							)
						})
					</script>
				</c:when>
				
				<%-- 세션 code = 1002일때 사업자 회원 공구 등록 목록 --%>
				<c:when test="${sessionScope.authGradeCode == 1002}">
						<div class="businessHeader ps-2 pt-3" onclick="statusBtn(0)" ><h3><i class="bi bi-house"></i>&nbsp;${info.companyName}님의 공구</h3></div>
					<div class="business-wrapper">
						<div class="counter d-flex justify-content-center">
							<c:forEach var="t" items="${count}">
								<button class="circleBtn mx-4 my-3 f-1 d-flex flex-column align-items-center justify-content-center" onclick="statusBtn(${t.statusCode})">
									<c:choose>
										<c:when test="${t.statusCode == 1001 }">
											<div class="statusValue">진행중</div>
										</c:when>
										<c:when test="${t.statusCode == 1002 }">
											<div class="statusValue">공구 종료</div>
										</c:when>
										<c:when test="${t.statusCode == 1003 }">
											<div class="statusValue">공구 실패</div>
										</c:when>
									</c:choose>
									<div class="statusCount" style="font-size: x-large;">${t.statusCount}</div>
								</button>
							</c:forEach>
						</div>
						
						<div class="listContainer d-flex justify-content-center flex-column align-items-center" style="margin-bottom:200px;">
							<div class="list-wrapper d-flex justify-content-center flex-column align-items-center py-4">
								
							</div>
						</div>	
					</div>	
					<script>
						$(document).ready(function(){
							$.ajax({
								url: "/shop/myShopListByStatus", 
								type: "post",
								dataType : "json",
								data : {status : 0},
								error: function(){
									alert("서버 연결에 실패하였습니다.");
								}
							}).done(
								function(resp){
									appendBusinessDiv(resp);
								}
							)
						})
					</script>
				</c:when>
			</c:choose>
		</div>		
	</main>	
	
	<c:import url="../commons/pageFooter.jsp"/>
</body>
</html>


























