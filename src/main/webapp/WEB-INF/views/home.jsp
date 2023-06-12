<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<!-- JQuery-->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap - CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- Bootstrap - JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<!-- Bootstrap - icon -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
	rel="stylesheet">
<!-- Font 기본 : {font-family: 'NanumSquareNeoBold'}-->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css"
	rel="stylesheet">
<!-- awesome font -icon -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	rel="stylesheet"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- gbn css -->
<link href="${path}/resources/css/gnb.css" rel="stylesheet"
	type="text/css">
<style>
* {
	font-family: NanumSquareNeoBold;
}

.container {
	margin-top: 100px;
}
</style>
</head>
<body>

	<!-- gnb -->
	<c:import url="commons/gnb.jsp">
	</c:import>
	<!-- main -->
	<div class="container" style="margin-top: 100px;">

		<!-- 아침, 점심, 저녁 -->
		<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
			<input type="checkbox" class="btn-check" id="btncheck1" value="아침" autocomplete="off">
				<label class="btn btn-outline-primary" for="btncheck1">아침</label> 
			
			<input type="checkbox" class="btn-check" id="btncheck2" value="점심" autocomplete="off"> 
				<label class="btn btn-outline-primary" for="btncheck2">점심</label> 
			
			<input type="checkbox" class="btn-check" id="btncheck3" value="저녁" autocomplete="off">
				<label class="btn btn-outline-primary" for="btncheck3">저녁</label>
		</div>
		
		<!-- 비건, 다이어트 -->		
		<div class="btn-group" role="group" aria-label="Basic radio toggle button group">
  			<input type="radio" class="btn-check" name="btnradio" id="btnradio1" value="비건" autocomplete="off" >
  				<label class="btn btn-outline-primary" for="btnradio1">비건</label>

  			<input type="radio" class="btn-check" name="btnradio" id="btnradio2" value="다이어트" autocomplete="off">
  				<label class="btn btn-outline-primary" for="btnradio2">다이어트</label>
  		</div>
  		
  		<!-- 당일 ~ 7일 -->
  		<!-- Default dropend button -->
		<div>
			<div class="btn-group dropend">
				<button type="button" class="btn btn-secondary dropdown-toggle"
					data-bs-toggle="dropdown" aria-expanded="false">Dropend</button>
				<ul class="dropdown-menu">
					<li>당일</li>
					<li>1일</li>
					<li>2일</li>
					<li>3일</li>
					<li>4일</li>
					<li>5일</li>
					<li>6일</li>
					<li>7일</li>
				</ul>
			</div>
		</div>

		<button id="sendBtn">보내기</button>
		
		<div id="getMsg">보낸 메세지 칸</div>
	</div>

</body>
<script type="text/javascript">
	$("#sendBtn").on("click", function() {
		$.ajax({
			url : "/chat/sendMsg",
			type : "post",
			data : {
				sendMsg : $("#sendMsg").val()
			}
		}).done(function(resp) {
			console.log(resp);
			$("#getMsg").text(resp);
		});
	});
</script>
</html>