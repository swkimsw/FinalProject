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
	background-color: rgba(255,255,194,0.75);
}

* {
	font-family: NanumSquareNeo;
}

.container {
	margin-top: 100px;
}
#searchBtn: hover{
	color: #007936;
}
.cover{
	transition-duration: 300ms;
}
.cover: hover{
	background-color: #00000050;
    cursor: pointer;
    opacity: 1;
}

</style>
</head>
<body>
	<!-- gnb -->
	<c:import url="../commons/gnb.jsp">
	</c:import>

	<div class="container">
		<div class="header">
			<div class="row d-flex justify-content-center search">
				<div class="col-10">
					<div class="mx-quto input-group mt-1">
					<input type="radio" value="productName" name="category" checked> 상품명 <br/>
				 	<input type="radio" value="companyName" name="category"> 판매자명
						<input type="text" id="keyword" name="searchByKeyword"
							maxlength="25" class="form-control ml-25" style="height:50px;" placeholder="검색어 입력" >
						<button class="btn" style="background-color:#007936; color:#ffffc2;" type="submit" id="searchBtn"
							onclick="getSearchList()">search</button>
					</div>
				</div>
			</div>
		</div>
		<div class="subNav">
			<nav class="navbar navbar-expand-lg ">
  				<div class="container-fluid">
   					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
   						<span class="navbar-toggler-icon"></span>
   					</button>
  					
    				<div class="collapse navbar-collapse" id="navbarTogglerDemo03" style="background-color:none;">
		      			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		       				<li class="nav-item">
		          				<a class="nav-link active" aria-current="page" href="#">진행중인 공구</a>
		        			</li>
		        			<li class="nav-item">
		          				<a class="nav-link" href="/shop/toShopList?status=closed">마감된 공구</a>
				        	</li>
				    	</ul>
	      				<form class="d-flex">
	        				<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
	        				<button class="btn btn-outline-success" type="submit">Search</button>
	      				</form>
    				</div>
  				</div>
			</nav>
		</div>
		<div class="body">
			<div class="row d-flex position-relative list">
				<c:forEach var="i" items="${list}">
					<div class="col-xl-4 col-sm-12 col-md-6 p-2 mt-2 mb-2 contents">
						<div class="card border-0">
							<c:choose>
								<c:when test="${i.dDay > 0 }">
									<span
										class="badge deadLine rounded-pill text-bg-primary position-absolute top-0 end-0 m-2 p-2">${i.dDay}일
										남음</span>
								</c:when>
								<c:when test="${i.dDay == 0 }">
									<span
										class="badge deadLine rounded-pill text-bg-danger position-absolute top-0 end-0 m-2 p-2">오늘
										마감</span>
								</c:when>
								<c:when test="${i.dDay < 0 }">
									<span
										class="badge deadLine rounded-pill text-bg-secondary position-absolute top-0 end-0 m-2 p-2">마감</span>
								</c:when>
							</c:choose>
								<a href="/shop/SelectShop?code=${i.code}"> 
									<img src="${i.path}${i.sysName}" style="width: 100%;">
								</a>
							<div class="card-body">
								<p class="card-title" style="font-size: 20px;">${i.title}</p>
								<p class="card-text fw-lighter" style="font-size: 12px;">${i.companyName}</p>
							</div>
						</div>

					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<script>
	
		//검색 결과 리스트 ajax
		function getSearchList(){
			let category = $('input[type="radio"][name="category"]:checked').val(); // 체크박스 체크 여부(checked)
			let keyword = $("#keyword").val();
			if (keyword.trim() != "") {
				$.ajax({
					url : "/shop/searchByKeyword",
					type : "post",
					dataType:"json",
					data : {
						category : category,
						keyword : keyword
					},
					error: function(){alert("검색에 실패하였습니다");}
				}).done(function(resp) {
					$(".body> .list").empty();
					$(".subNav").empty();
					if(resp.length > 0){
						resp.forEach(function(i){
							div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936'><hr/><p class='fs-6'> <i class='bi bi-search'/>" + "   '" + keyword + "'의 검색결과는 " + resp.length + "개 입니다.</p><hr/></div>";
							div += "<div class='col-xl-4 col-sm-12 col-md-6 p-2 mt-2 mb-2 contents'><div class='card border-0'>";
							if(i.dDay>0){
								div += "<span class='badge deadLine rounded-pill text-bg-primary position-absolute top-0 end-0 m-2 p-2'>" + i.dDay+ "일 남음</span>"; 
							}
							if(i.dDay==0){
								div += "<span class='badge deadLine rounded-pill text-bg-danger position-absolute top-0 end-0 m-2 p-2'>오늘 마감</span>";
							}
							if(i.dDay<0){
								div += "<span class='badge deadLine rounded-pill text-bg-secondary position-absolute top-0 end-0 m-2 p-2'>마감</span>	";
							}
							div += "<a href='/shop/SelectShop?code = " + i.code + "'>";
							div += "<img src='" + i.path + i.sysName + "' style='width: 100%;'> </a> <div class='card-body'>";
							div += "<p class='card-title' style='font-size: 20px;'>"+ i.title + "</p> ";
							div += "<p class='card-text fw-lighter' style='font-size: 12px;'>" + i.companyName + "</p> </div> </div> </div>";
							$(".list").append(div);
						})
						
						keyword = "";
						
					}else{
						div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936'><hr/><p class='fs-6'> <i class='bi bi-search'/>" + "   '" + keyword + "'의 검색결과가 없습니다.</p><hr/></div>" ;
						$(".list").append(div);
					}
					$("#keyword").val("");
				}).fail(function(){
					alert("검색에 실패하였습니다.");
				})				
				
			}else {
				alert("검색어를 입력해주세요.");
			}

		}
		
		//마감된 공구 List ajax
		function getClosedList(){
				$.ajax({
					url : "/shop/getClosedList",
					type : "post",
					dataType:"json",
					error: function(){alert("서버 연결에 실패하였습니다");}
				}).done(function(resp) {
					$(".body> .list").empty();
					if(resp.length > 0){
						resp.forEach(function(i){
							div = "<div class='col-xl-4 col-sm-12 col-md-6 p-2 mt-2 mb-2 contents'><div class='card border-0'>";
							div += "<span class='badge deadLine rounded-pill text-bg-secondary position-absolute top-0 end-0 m-2 p-2'>마감</span>	";
							div += "<a href='/shop/SelectShop?code = " + i.code + "'>";
							div += "<img src='" + i.path + i.sysName + "' style='width: 100%;'> </a> <div class='card-body'>";
							div += "<p class='card-title' style='font-size: 20px;'>"+ i.title + "</p> ";
							div += "<p class='card-text fw-lighter' style='font-size: 12px;'>" + i.companyName + "</p> </div> </div> </div>";
							$(".list").append(div);
						})
						
						keyword = "";
						
					}else{
						div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936'><hr/><p class='fs-6'> <i class='bi bi-search'/> 마감된 공구가 없어요! </p><hr/></div>" ;
						$(".list").append(div);
					}
					
				})
		}
		
	</script>


</body>
</html>