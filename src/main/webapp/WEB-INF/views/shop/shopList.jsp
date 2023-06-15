<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
	font-family:NanumSquareNeo;
}

.container {
	margin-top: 100px;
}
.searchBtn{
	position:absolute;
	top: 7px;
   	right:150px;
}
.form-control{
	height:50px;
}
</style>
</head>
<body>
	<!-- gnb -->
	<c:import url="../commons/gnb.jsp">
	</c:import>

	<div class="container">
		<div class="header">
		
			<div class="row d-flex justify-content-center">
				<div class="col-10">
					<div class="mx-quto input-group mt-3">
						<select id="category">
							<option id="productName" value="productName" selected>상품명</option>
							<option id="sellerName" value="companyNaMe">판매자명</option>
							<option id="deadLine" value="deadLine">마감일</option>
						</select>
						<input name="searchByKeyword" type="text" id="keyword" maxlength="25" class="form-control" placeholder="검색어 입력" aria-label="search" aria-describedby="searchBtn">
		                <button class="btn btn-primary" type="submit" id="searchBtn">검색</button>
		            </div>
		        </div>
	        </div>
			
			
			<div class="row d-flex justify-content-center">
				<div class="col-10 mt-2">
					<input type="date" name="searchByDate"> ~ 
				</div>
			</div>
		</div>
		
		<div class="body">
			<div class="row d-flex position-relative">
			
				<c:forEach var="i" items="${list}">
					
					
					<div class="col-xl-4 col-sm-12 col-md-6 p-2 mt-2 mb-2">
					
						<div class="card">
							<span class="badge deadLine rounded-pill text-bg-primary position-absolute top-0 end-0 m-2 p-2">N일 남음</span>
							<img src="${i.path}${i.sysName}" href="/shop/SelectShop?code=${i.code}" style="width:100%; alt="...">
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
		$("#searchBtn").on("click",function(){
			const category = $("#category").val();
			const keyword = $("#keyword").val();
			console.log(category +":"+ keyword);
			if(keyword.trim() != ""){
				$.ajax({
					url:"shop/searchByKeyword",
					data: {
						category:category,
						keyword:keyword}
				}).done(function(resp){
					
				});
			}else{
				alert("검색어를 입력해주세요.");
			}
			
			
		});
		
		
		
		
	</script>


</body>
</html>