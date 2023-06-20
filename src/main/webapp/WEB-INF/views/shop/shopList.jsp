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
.searchGroup{
	position:relative;
	width:100%;
}
.searchGroup{
	height:70px;
}
.searchGroup > .inputGroup > .searchInput{
	height:80px;
	max-width:300px;
	min-width: 50px;
}

.searchGroup > .searchIcon{
	position: absolute;
	top:50px;
	left:100px;
	z-index:5;
}
.form-check{
	
}


</style>
</head>
<body>
	<!-- gnb -->
	<c:import url="../commons/gnb.jsp">
	</c:import>

	<div class="container">
		<div class="row subNav">
			<div class="col">
				<nav class="navbar navbar-expand-lg" >
	  				<div class="container-fluid" style="background-color:rgba(255,255,194,0.75);">
	   					<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo03" aria-controls="navbarTogglerDemo03" aria-expanded="false" aria-label="Toggle navigation">
	   						<span class="navbar-toggler-icon"></span>
	   					</button>
	  					
	    				<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
	    					<div class="linkGroup" style="position:relative;width:100%;">
				      			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				      				<li class="nav-item">
				          				<a class="nav-link active fs-5" onclick="activeChange()" href="/shop/toShopList">공구 모아보기</a>
				        			</li>
				       				<li class="nav-item">
				          				<a class="nav-link" onclick="activeChange()" href="/shop/toShopList?status=open">진행중인 공구</a>
				        			</li>
				        			<li class="nav-item">
				          				<a class="nav-link" onclick="activeChange()" href="/shop/toShopList?status=closed">마감된 공구</a>
						        	</li>
						        	<c:if test="${authGradeCode == 1002}">
							        	<li class="nav-item">
					          				<a class="nav-link" onclick="activeChange()" href="/shop/toShopRegister">공구 등록</a>
							        	</li>
						        	</c:if>
						    	</ul>
						    </div>	
					    	<div class="input-group searchGroup">
					    		<div class="input-group-text radioGroup" >
			      					<input class="form-check-input mt-0" type="radio" value="productName" name="category" id="productNameRadio" checked>상품명<br>
						 			<input class="form-check-input mt-0" type="radio" value="companyName" name="category" id="companyNameRadio"> 판매자명<br>
						 		</div>
						 		<i class='bi bi-search searchIcon'></i>
			        			<input class="form-control searchInput" onkeypress="if(event.keyCode == 13 ){getSearchList()}" type="search" id="keyword" name="searchByKeyword" placeholder="검색어를 입력해주세요." maxlength="20">
			        		</div>	
	    				</div>
	  				</div>
				</nav>
			</div>
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
								<a href="/shop/toShopApply?code=${i.code}"> 
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
					//$(".subNav").empty();
					if(resp.length > 0){
						div = "<div class='col-xxl-12 pt-2 pb-1 text-center' style='color:#007936'><hr/><p class='fs-6'> <i class='bi bi-search'/>" + "   '" + keyword + "'의 검색결과는 " + resp.length + "개 입니다.</p><hr/></div>";
						$(".list").append(div);
						resp.forEach(function(i){
							card = "<div class='col-xl-4 col-sm-12 col-md-6 p-2 mt-2 mb-2 contents'><div class='card border-0'>";
							if(i.dDay>0){
								card += "<span class='badge deadLine rounded-pill text-bg-primary position-absolute top-0 end-0 m-2 p-2'>" + i.dDay+ "일 남음</span>"; 
							}
							if(i.dDay==0){
								card += "<span class='badge deadLine rounded-pill text-bg-danger position-absolute top-0 end-0 m-2 p-2'>오늘 마감</span>";
							}
							if(i.dDay<0){
								card += "<span class='badge deadLine rounded-pill text-bg-secondary position-absolute top-0 end-0 m-2 p-2'>마감</span>	";
							}
							card += "<a href='/shop/SelectShop?code = " + i.code + "'>";
							card += "<img src='" + i.path + i.sysName + "' style='width: 100%;'> </a> <div class='card-body'>";
							card += "<p class='card-title' style='font-size: 20px;'>"+ i.title + "</p> ";
							card += "<p class='card-text fw-lighter' style='font-size: 12px;'>" + i.companyName + "</p> </div> </div> </div>";
							$(".list").append(card);
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
		/*function getClosedList(){
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
		}*/
		
		
	</script>


</body>
</html>