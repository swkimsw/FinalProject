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

* {
	font-family: NanumSquareNeo;
}

.container {
	margin-top: 80px;
}

.header{
	position: fixed;
	background-color: window;
	top:80px;
	padding-top:20px;
	padding-bottom: 10px;
	z-index:3;
	width:100%;
}

.applyList{
	position:relative;
	top:100px;
}
.cardRow{

}
.listCard{
	position:relative;
	margin-right:5%; 
	margin-left:5%;
}
.cardImg{
	width: 150px;
	height:150px;
	overflow:hidden;
	margin: 30px;
}

.productImg{
	height:100%;
	width:100%;
}
.productImg:hover{
	cursor:pointer;
}

</style>
</head>
<body>
	<!-- gnb -->
	<c:import url="../commons/gnb.jsp">
	</c:import>

	<div class="container w-75 h-100">
		<c:choose>
			<%-- 세션 code = 1003일때 일반회원 공구 신청 목록  --%>
			<c:when test="${sessionScope.authGradeCode == 1003}">
				<div class="client-wrapper" style="height:auto;">
					<div class="row header">
						<div class="co1 col-md-6"><h4>${info.name}님의 신청 목록</h4></div>
						<div class="col col-md-6">
							<select class="form-select w-50" name="clientCategory" onchange="clientSelect()">
								<option value="0" selected>전체</option>
								<option value="1001">진행중인 공구</option>
								<option value="1002">종료된 공구</option>
								<option value="1003">실패한 공구</option>
							</select>
						</div>
					</div>
					<div class="body applyList">
						
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
								$(".applyList").empty();
								if(resp.length > 0){
									resp.forEach(function(i){
										div = "<div class='ms-5 mb-1'><span class='text ms-2'><b>" + i.applyDateTemp + " 신청 </b></span></div>";
										div += "<div class='card ml-3 listCard'>";
										div += "<div class='row cardRow'>" ;
										div += "<div class='col col-md-5 col-lg-4 col-xl-3 cardImgBox'>";
										div += "<div class='cardImg'>";
										div += "<img src='" + i.path + i.sysName + "' class='img-fluid productImg' onclick='location.href='/shop/toShopApply?code=" 
												+ i.groupbuyingCode+ "''>";
										div += "</div></div>";	
										div += "<div class='col col-md-7 col-lg-7 col-xl-7 card-body cardText'>";
										div += "<span class='badge rounded-pill text-bg-success position-absolute top-0 end-0 m-2 p-2'>" 
												+ i.statusValue + "</span>"
										div += "<p class='card-text mt-3'>" + i.productName + " | " + i.companyName + "</p>";
										div += "<h4 class='card-title'>" + i.title + "</h4>";
										div += "<p class='card-text'> 진행기간&nbsp;&nbsp;" + i.regDateTemp + " ~ " +  i.deadLineTemp + "</p>";
										div += "<p class='card-text'> 신청수량&nbsp;&nbsp;&nbsp;" + i.quantity + "&nbsp;&nbsp;|&nbsp;&nbsp;합계액&nbsp;&nbsp;&nbsp;&nbsp;" + (i.productPrice * i.quantity) + "원 </p>";
										div += "</div></div></div>";
										$(".applyList").append(div);
									})
									$(".applyList").append("<hr>");
								}else{
									div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936'><hr/><p class='fs-6'> <i class='bi bi-send-x'/> 신청하신 내역이 없습니다. </p><hr/></div>";
									$(".applyList").append(div);
								}
							}		
						)
					})
				
					function clientSelect(){
						let status = $('select[name="clientCategory"]').val();
						$.ajax({
							url: "/shop/myShopListByStatus",
							type: "post",
							dataType : "json",
							data : {status : status},
							error: function(){
								alert("서버 연결에 실패하였습니다.");
							}
						}).done(
							function(resp){
								$(".applyList").empty();
								if(resp.length > 0){
									resp.forEach(function(i){
										div = "<div class='ms-5 mb-1'><span class='text ms-2'><b>" + i.applyDateTemp + " 신청 </b></span></div>";
										div += "<div class='card ml-3 listCard'>";
										div += "<div class='row cardRow'>" ;
										div += "<div class='col col-md-5 col-lg-4 col-xl-3 cardImgBox'>";
										div += "<div class='cardImg'>";
										div += "<img src='" + i.path + i.sysName + "' class='img-fluid productImg' onclick='location.href='/shop/toShopApply?code=" 
												+ i.groupbuyingCode+ "''>";
										div += "</div></div>";	
										div += "<div class='col col-md-7 col-lg-7 col-xl-7 card-body cardText'>";
										div += "<span class='badge rounded-pill text-bg-success position-absolute top-0 end-0 m-2 p-2'>" 
												+ i.statusValue + "</span>"
										div += "<p class='card-text mt-3'>" + i.productName + " | " + i.companyName + "</p>";
										div += "<h4 class='card-title'>" + i.title + "</h4>";
										div += "<p class='card-text'> 진행기간&nbsp;&nbsp;" + i.regDateTemp + " ~ " +  i.deadLineTemp + "</p>";
										div += "<p class='card-text'> 신청수량&nbsp;&nbsp;&nbsp;" + i.quantity + "&nbsp;&nbsp;|&nbsp;&nbsp;합계액&nbsp;&nbsp;&nbsp;&nbsp;" + (i.productPrice * i.quantity) + "원 </p>";
										div += "</div></div></div>";
										$(".applyList").append(div);
									})
									$(".applyList").append("<hr>");
								}else{
									div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936'><hr/><p class='fs-6'> <i class='bi bi-send-x'/> 신청하신 내역이 없습니다. </p><hr/></div>";
									$(".applyList").append(div);
								}
							}		
						)
					}
				</script>
				
			</c:when>
			
			
			
			
			
			<%-- 세션 code = 1002일때 사업자 회원 공구 등록 목록 --%>
			<c:when test="${sessionScope.authGradeCode == 1002}">
				<div class="business-wrapper">
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
				</div>	
				<script>
					<%--$(document).ready(function(){
						$.ajax({
							url: "/shop/myShopListByStatus",
							type: "post",
							dataType : "json",
							data : {status : 0},
							error: function(){
								alert("서버 연결에 실패하였습니다.");
							}
						}).done(
							
							
						)
						
					})--%>
				
					function openInfo(a){
						window.open("/shop/buyingMemberInfoList?code="+a ,"list","width=1200, height=600,left=200, top=100, scrollbars=yes");
					}
				</script>
			</c:when>
		</c:choose>
		
	</div>		
	
	<script>
	
	</script>
	
	
	
</body>
</html>


























