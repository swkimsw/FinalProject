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

.clientHeader{
	position: fixed;
	background-color: window;
	top:80px;
	padding-top:20px;
	padding-bottom: 10px;
	z-index:3;
	width:100%;
}
.businessHeader{
	background-color: window;
	top:80px;
	padding-top:20px;
	padding-bottom: 5px;
	z-index:3;
	width:100%;
}
.businessHeader:hover{
	cursor: pointer;
}
.applyList{
	position:relative;
	top:100px;
}

.listCard{
	background-color: rgba(255, 255, 194, 0.5);
	border:none;
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
.circleBtn{
	background-color: rgba(255, 255, 194, 0.5);
	border-radius: 120px;
	border:none;
	height:120px;
	min-height:110px;
	width:120px;
	min-width:110px;
	align-items: center;
	text-align: center;
}
.toApply{
	text-decoration: none;
	color: black;
}
.list-wrapper{
	border-bottom: 1px solid grey;
	background-color: #f2f3f5;
	width:1000px;
	min-width:600px;
	padding-top: 10px;
	padding-bottom: 10px;
	margin-bottom:20px;
}
.regist{
	background-color: white;
	width:900px; 
	min-width:500px; 
	border-radius: 30px;
}
.infoBtn{
	border-radius: 100px;
	border: none;
	width:100px;
	height:100px;
	background-color: rgba(255, 255, 194, 0.5);
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
										div += "<div class='card ml-3 mb-3 listCard'>";
										div += "<div class='row cardRow'>" ;
										div += "<div class='col col-md-5 col-lg-4 col-xl-3 cardImgBox'>";
										div += "<div class='cardImg'>";
										div += "<img src='" + i.path + i.sysName + "' class='img-fluid productImg' onclick='location.href='/shop/toShopApply?code=" 
												+ i.groupbuyingCode+ "''>";
										div += "</div></div>";	
										div += "<div class='col col-md-7 col-lg-7 col-xl-7 card-body cardText'>";
										
										if(i.statusCode == 1001){
											div += "<span class='badge rounded-pill text-bg-success position-absolute top-0 end-0 m-3 p-2'>" 
													+ i.statusValue + "</span>"
										}else if(i.statusCode == 1002){
											div += "<span class='badge rounded-pill text-bg-secondary position-absolute top-0 end-0 m-3 p-2'>" 
												+ i.statusValue + "</span>"
										}else if(i.statusCode == 1003){
											div += "<span class='badge rounded-pill text-bg-dark position-absolute top-0 end-0 m-3 p-2'>" 
												+ i.statusValue + "</span>"
										}
												
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
										div += "<div class='card ml-3 mb-3 listCard'>";
										div += "<div class='row cardRow'>" ;
										div += "<div class='col col-md-5 col-lg-4 col-xl-3 cardImgBox'>";
										div += "<div class='cardImg'>";
										div += "<img src='" + i.path + i.sysName + "' class='img-fluid productImg' onclick='location.href='/shop/toShopApply?code=" 
												+ i.groupbuyingCode+ "''>";
										div += "</div></div>";	
										div += "<div class='col col-md-7 col-lg-7 col-xl-7 card-body cardText'>";
										
										if(i.statusCode == 1001){
											div += "<span class='badge rounded-pill text-bg-success position-absolute top-0 end-0 m-2 p-2'>" 
													+ i.statusValue + "</span>"
										}else if(i.statusCode == 1002){
											div += "<span class='badge rounded-pill text-bg-secondary position-absolute top-0 end-0 m-2 p-2'>" 
												+ i.statusValue + "</span>"
										}else if(i.statusCode == 1003){
											div += "<span class='badge rounded-pill text-bg-dark position-absolute top-0 end-0 m-2 p-2'>" 
												+ i.statusValue + "</span>"
										}
												
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
					
					<div class="listContainer d-flex justify-content-center flex-column align-items-center">
						<div class="list-wrapper d-flex justify-content-center flex-column align-items-center pt-4">
							
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
								$(".list-wrapper").empty();
								if(resp.length > 0){
									resp.forEach(function(i){
										div = "<div class='registBox py-2'>";
										if(i.statusCode == 1001){
											div += "<span class='badge rounded-pill text-bg-success ms-3 mb-2 p-2'>" 
											+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;진행</span>";
										}else if(i.statusCode == 1002){
											div += "<span class='badge rounded-pill text-bg-secondary ms-3 mb-2 p-2'>" 
											+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;종료</span>";
										}else if(i.statusCode == 1003){
											div += "<span class='badge rounded-pill text-bg-dark ms-3 mb-2 p-2'>" 
											+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;실패</span>";
										}
										div += "<div class='regist position-relative px-5 py-4 mb-4'>"
										div += "<h4><a class='toApply' href='/shop/toShopApply?code=" + i.groupbuyingCode + "'>" + i.title + "</a></h4>";
										div += "<span>" + i.productName + "&ensp;|&ensp;" + i.productPrice + "원 </span><br>";
										div += "<span>신청인수&emsp;" + i.applyCount + "&ensp;|&ensp;신청수량&emsp;" + i.applyQuantity + "&ensp;|&ensp;판매액&emsp;" + (i.productPrice * i.applyQuantity) + "원</span>";
										div += "<button class='infoBtn position-absolute p-3 mt-4 me-5 top-0 end-0' onclick='openInfo(" + i.groupbuyingCode + ")'>신청자<br>정보</button>";
										div += "<div class='progress' style='min-width:300px; max-width:600px; margin-top:10px;'>";
										div += "<div class='progress-bar progress-bar-striped bg-success' role='progressbar' style='width:" 
												+ (i.applyQuantity / i.min * 100) +"%;' aria-valuemin='0' aria-valuemax='100'>달성률&ensp;"
												+ (i.applyQuantity / i.min * 100) + "%</div></div></div></div>";
										$(".list-wrapper").append(div);
									})
								}else{
									$(".list-wrapper").append("<span><i class='bi bi-send-x-fill'></i>&ensp;등록 내역이 없습니다.</span>");
								}
							}
						)
						
					})
					
					function statusBtn(a){
						$.ajax({
							url: "/shop/myShopListByStatus", 
							type: "post",
							dataType : "json",
							data : {status : a},
							error: function(){
								alert("서버 연결에 실패하였습니다.");
							}
						}).done(
							function(resp){
								$(".list-wrapper").empty();
								if(resp.length > 0){
									resp.forEach(function(i){
										div = "<div class='registBox py-2'>";
										if(i.statusCode == 1001){
											div += "<span class='badge rounded-pill text-bg-success ms-3 mb-2 p-2'>" 
											+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;진행</span>";
										}else if(i.statusCode == 1002){
											div += "<span class='badge rounded-pill text-bg-secondary ms-3 mb-2 p-2'>" 
											+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;종료</span>";
										}else if(i.statusCode == 1003){
											div += "<span class='badge rounded-pill text-bg-dark ms-3 mb-2 p-2'>" 
											+ i.regDateTemp + "&ensp;~&ensp;" + i.deadLineTemp + "&ensp;|&ensp;실패</span>";
										}
										div += "<div class='regist position-relative px-5 py-4 mb-4'>"
										div += "<h4><a class='toApply' href='/shop/toShopApply?code=" + i.groupbuyingCode + "'>" + i.title + "</a></h4>";
										div += "<span>" + i.productName + "&ensp;|&ensp;" + i.productPrice + "원 </span><br>";
										div += "<span>신청인수&emsp;" + i.applyCount + "&ensp;|&ensp;신청수량&emsp;" + i.applyQuantity + "&ensp;|&ensp;판매액&emsp;" + (i.productPrice * i.applyQuantity) + "원</span>";
										div += "<button class='infoBtn position-absolute p-3 mt-4 me-5 top-0 end-0' onclick='openInfo(" + i.groupbuyingCode + ")'>신청자<br>정보</button>";
										div += "<div class='progress' style='min-width:300px; max-width:600px; margin-top:10px;'>";
										div += "<div class='progress-bar progress-bar-striped bg-success' role='progressbar' style='width:" 
												+ (i.applyQuantity / i.min * 100) +"%;' aria-valuemin='0' aria-valuemax='100'>달성률&ensp;"
												+ (i.applyQuantity / i.min * 100) + "%</div></div></div></div>";
										$(".list-wrapper").append(div);
									})
								}else{
									$(".list-wrapper").append("<span><i class='bi bi-send-x-fill'></i>&ensp;등록 내역이 없습니다.</span>");
								}
							}
						)
					}
				
					
					function openInfo(a){
						window.open("/shop/buyingMemberInfoList?code="+a ,"list","width=1200, height=600,left=200, top=100, scrollbars=yes");
					}
				</script>
			</c:when>
		</c:choose>
		
	</div>		
	
</body>
</html>


























